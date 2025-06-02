

typedef struct {
    bit [15:0] tmpref;
    bit [31:0] timecode;
    bit seq;
    bit pic;
    bit gop;
} mpeg_dummy_video_fifo_entry;

module vmpeg (
    input clk,
    input reset,
    // CPU interface
    input [23:1] address,
    input [15:0] din,
    output bit [15:0] dout,
    input uds,
    input lds,
    input write_strobe,
    input cs,
    output bit bus_ack,
    output intreq,
    input intack,
    output req,
    input ack,
    output rdy,
    input dtc,
    input done_in,
    output done_out,

    // Video Synchronization
    input hsync,
    input vsync,
    input hblank,
    input vblank,

    output bit mpeg_ram_enabled  // Prohibits detection of MPEG RAM by the OS RAM crawler
);
    wire access = cs && (uds || lds);

    wire dma_data_valid = ack && dtc;
    bit dma_data_valid_q;

    bit [7:0] dma_temp;

    wire [7:0] mpeg_data  /*verilator public_flat_rd*/ = dma_data_valid_q ? dma_temp : din[15:8];
    wire mpeg_data_valid = dma_data_valid || dma_data_valid_q;
    bit dma_for_fma;
    wire fmv_data_valid  /*verilator public_flat_rd*/ = mpeg_data_valid && !dma_for_fma;
    wire fma_data_valid  /*verilator public_flat_rd*/ = mpeg_data_valid && dma_for_fma;

    enum bit [3:0] {
        IDLE,
        MAGIC0,
        MAGIC1,
        MAGIC2,
        MAGIC3,
        MAGIC_MATCH,
        GOP0,
        GOP1,
        GOP2,
        GOP3,
        PIC0,
        PIC1,
        PIC2,
        PIC3,
        SLICE0,
        SEQHDR
    } mpeg_video_state = IDLE;

    enum bit [3:0] {
        FMA_IDLE,
        FMA_MAGIC0,
        FMA_MAGIC1,
        FMA_MAGIC2,
        FMA_MAGIC3,
        FMA_MAGIC_MATCH,
        FMA_PACK0,
        FMA_PACK1,
        FMA_PACK2,
        FMA_PACK3,
        FMA_PACK4,
        FMA_PACK5
    } mpeg_audio_state = FMA_IDLE;

    mpeg_dummy_video_fifo_entry fifo_in;
    mpeg_dummy_video_fifo_entry fifo_out;
    bit fifo_write;
    bit fifo_out_valid;
    bit fifo_out_strobe;

    mpeg_dummy_video_fifo video_dummy_fifo (
        .clk,
        .reset,
        .in(fifo_in),
        .write(fifo_write),
        .out(fifo_out),
        .out_valid(fifo_out_valid),
        .strobe(fifo_out_strobe)
    );

    bit [9:0] temperal_sequence_number;
    bit [9:0] next_sequence_number;
    bit [32:0] system_clock_reference;
    bit [32:0] system_clock_reference_start_time;
    bit system_clock_reference_start_time_valid = 0;

    bit decoding_frame_data = 0;

    always @(posedge clk) begin
        fifo_write <= 0;

        if (fifo_write) begin
            fifo_in.seq <= 0;
            fifo_in.pic <= 0;
            fifo_in.gop <= 0;
        end

        dma_data_valid_q <= dma_data_valid;

        if (dma_data_valid) dma_temp <= din[7:0];

        if (fma_data_valid) begin
            // $display ("MPEG %x",mpeg_data);

            casez ({
                mpeg_audio_state, mpeg_data
            })
                // verilog_format: off
                {FMA_PACK5, 8'h??}: begin         
                    mpeg_audio_state <= FMA_IDLE;

                    if (!system_clock_reference_start_time_valid)begin
                        system_clock_reference_start_time[32:1] <= fma_dclk + 17400;
                        system_clock_reference_start_time_valid <= 1;
                    end
                end
                
                {FMA_PACK4, 8'h??}: begin                    
                    mpeg_audio_state <= FMA_PACK5;
                    system_clock_reference[6:0] <= mpeg_data[7:1];
                    $display ("FMA PACK %x %d",mpeg_data,system_clock_reference);


                    fma_pack_cnt <= fma_pack_cnt +1;
                end
                {FMA_PACK3, 8'h??}: begin
                    mpeg_audio_state <= FMA_PACK4;
                    system_clock_reference[14:7] <= mpeg_data;
                end
                {FMA_PACK2, 8'h??}: begin
                    mpeg_audio_state <= FMA_PACK3;
                    system_clock_reference[21:15] <= mpeg_data[7:1];
                end
                {FMA_PACK1, 8'h??}: begin
                    mpeg_audio_state <= FMA_PACK2;
                    system_clock_reference[29:22] <= mpeg_data;
                end
                {FMA_PACK0, 8'h??}: begin
                    mpeg_audio_state <= FMA_PACK1;
                    system_clock_reference[32:30] <= mpeg_data[3:1];
                end

                {FMA_MAGIC_MATCH, 8'hba} : begin
                    mpeg_audio_state <= FMA_PACK0;
                end
                {FMA_MAGIC2, 8'h01} : mpeg_audio_state <= FMA_MAGIC_MATCH;
                {FMA_MAGIC2, 8'h00} : mpeg_audio_state <= FMA_MAGIC2;
                {FMA_MAGIC0, 8'h00} : mpeg_audio_state <= FMA_MAGIC2;
                {FMA_IDLE, 8'h00} : mpeg_audio_state <= FMA_MAGIC0;
                default: mpeg_audio_state <= FMA_IDLE;
            // verilog_format: on
            endcase

        end

        if (fmv_data_valid) begin

            // $display ("MPEG %x",mpeg_data);

            casez ({
                mpeg_video_state, mpeg_data
            })
                // verilog_format: off

                {PIC3, 8'h??}: begin mpeg_video_state <= IDLE; 
                    $display ("PIC3 %x",mpeg_data);

                    fifo_write <= 1;
                    fifo_in.pic <= 1;
                end
                {PIC2, 8'h??}: begin
                    mpeg_video_state <= PIC3;
                    if (next_sequence_number == temperal_sequence_number)
                    begin
                        fifo_in.tmpref[11:2] <= temperal_sequence_number;
                        $display ("PIC2 %x %d",mpeg_data,temperal_sequence_number);
                        next_sequence_number <= next_sequence_number + 1;
                    end
                    end
                {PIC1, 8'h??}: begin
                    mpeg_video_state <= PIC2;
                    //$display ("PIC1 %x",mpeg_data);
                    temperal_sequence_number[1:0] <= mpeg_data[7:6];
                    end
                {PIC0, 8'h??}: begin
                    mpeg_video_state <= PIC1;
                    //$display ("PIC0 %x",mpeg_data);
                    temperal_sequence_number[9:2] <= mpeg_data;
                    end
                {GOP3, 8'h??}: begin
                    mpeg_video_state <= IDLE;
                    $display ("GOP3 %x",mpeg_data);
                    fifo_in.gop <= 1;
                    next_sequence_number <= 0;
                    fifo_in.timecode[16] <= mpeg_data[7];
                    $display ("Timecode %d:%d:%d",timecode[5:0],timecode[27:22], timecode[21:16]);
                end
                {GOP2, 8'h??}: begin
                    mpeg_video_state <= GOP3;
                    $display ("GOP2 %x",mpeg_data);
                    fifo_in.timecode[24:22] <= mpeg_data[7:5];
                    fifo_in.timecode[21:17] <= mpeg_data[4:0];
                    gop_cnt <= gop_cnt + 1;
                end
                {GOP1, 8'h??}: begin
                    mpeg_video_state <= GOP2;
                    $display ("GOP1 %x",mpeg_data);
                    // Seconds
                    fifo_in.timecode[27:25] <= mpeg_data[2:0];
                    end
                {GOP0, 8'h??}: begin mpeg_video_state <= GOP1; $display ("GOP0 %x",mpeg_data);end

                {SEQHDR, 8'h??}: begin
                    mpeg_video_state <= IDLE; 
                    $display ("SEQHDR %x",mpeg_data);
                    fifo_in.seq <= 1;

                end

                {MAGIC_MATCH, 8'hb3} : begin mpeg_video_state <= SEQHDR;end
                {MAGIC_MATCH, 8'hb8} : mpeg_video_state <= GOP0;
                {MAGIC_MATCH, 8'h00} : mpeg_video_state <= PIC0;
                {MAGIC_MATCH, 8'h01} : mpeg_video_state <= SLICE0;
                {MAGIC2, 8'h01} : mpeg_video_state <= MAGIC_MATCH;
                {MAGIC2, 8'h00} : mpeg_video_state <= MAGIC2;
                {MAGIC0, 8'h00} : mpeg_video_state <= MAGIC2;
                {IDLE, 8'h00} : mpeg_video_state <= MAGIC0;
                default: mpeg_video_state <= IDLE;
            // verilog_format: on
            endcase
        end
    end


    typedef struct packed {
        bit erdv;
        bit erdd;
        bit vcup;
        bit pai;

        bit vsync;
        bit eii;
        bit esi;
        bit tim;

        bit dcl;
        bit ovf;
        bit ndat;
        bit rfb;

        bit eod;
        bit pic;
        bit gop;
        bit seq;
    } interrupt_flags_s;

    // FMA CMD @ 00E03000
    // 0001 Stop?
    // 8002 DMA Start
    bit [15:0] fma_command_register;
    // FMA STAT @ 00E03002
    // 0000
    // 0014
    // 0004 Frame Header Updated
    // FMA ISO End Detected Status      STAT_EOI            BIT_MASK(0)
    // FMA Audio Stream Changed Status  STAT_CSU            BIT_MASK(1)
    // FMA Frame Header Updated Status  STAT_UPD            BIT_MASK(2)
    // FMA Underflow Status             STAT_UNF            BIT_MASK(3)
    // FMA Decoding Started Status      STAT_DEC            BIT_MASK(4)
    bit [15:0] fma_status_register;
    // FMA ISR @ 00E0301A
    // 0100 Timer?
    // 0104 Updated Header and Timer?
    // 0114 Decoding Started
    // FMA ISO End Detected Interrupt   ISR_EOI            BIT_MASK(0)
    // FMA Changed Stream Interrupt     ISR_CSU            BIT_MASK(1)
    // FMA Updated Header Interrupt     ISR_UPD            BIT_MASK(2)
    // FMA Underflow Interrupt          ISR_UNF            BIT_MASK(3)
    // FMA Decoding Started Interrupt   ISR_DEC            BIT_MASK(4)
    // FMA Error Interrupt              ISR_ERR            BIT_MASK(5)
    // FMA Poll Interrupt               ISR_POLL           BIT_MASK(8)
    bit [15:0] fma_interrupt_status_register;
    // FMA IER @ 00E0301C
    bit [15:0] fma_interrupt_enable_register;
    // FMA IVEC @ 00E0300C
    bit [15:0] fma_interrupt_vector_register = 0;
    // FMA DCLKH @ 00E03010, DCLKH @ 00E03012
    // Increments with 45 kHz
    bit [31:0] fma_dclk;
    bit [31:0] fma_dclk_next_update;
    bit [15:0] fma_dclkl_latch;


    // FMV ISR @ 00E04062
    interrupt_flags_s interrupt_status_register;
    // FMV IER @ 00E04060
    interrupt_flags_s interrupt_enable_register;
    // FMV IVEC @ 00E040DC
    bit [15:0] interrupt_vector_register = 0;
    // FMV TCNT @ 00E04064 (also named SYS_TIM)
    // according to fmvdrv sources:
    // 29700 -1 for 5.28 seconds
    // 56 -1 for 10ms interrupt
    // 75 -1 for 12.333ms interrupt
    // 225 - 1 for 40 ms interrupt
    // so we have about 5,625 ticks per ms
    // this means 5625 tick per second
    // this means 90 kHz / 5625 Hz = 16 Perfect to the power of 2
    bit [15:0] timer_compare_register = 56 - 1;

    wire fmv_intreq = (interrupt_status_register & interrupt_enable_register) != 0;
    wire fma_intreq = (fma_interrupt_status_register & fma_interrupt_enable_register) != 0;
    assign intreq = fma_intreq || fmv_intreq;

    bit [15:0] image_height = 0;
    bit [15:0] image_width = 0;
    bit [15:0] image_height2 = 0;
    bit [15:0] image_width2 = 0;
    bit [15:0] image_rt;

    // TIMECD @ 00E04058
    // [21:16] 6 Bit Frames? Not BCD
    // [27:22] 6 Bit Seconds? Not BCD
    // [5:0] 6 Bit Minutes? Not BCD
    // Where are the hours?
    bit [31:0] timecode;
    bit [15:0] tmpref;

    typedef struct packed {
        bit show_next;
        bit show;
        bit hide;
        bit reserved;
        bit vid_off;
        bit vid_on;
        bit sbuf;
        bit regs_upd;
        bit scroll;
        bit [1:0] vbuf;
    } video_command_s;

    bit [5:0] mpeg_ram_enabled_cnt;

    always_comb begin
        dout = 0;

        case (address[15:1])
            15'h1800: dout = fma_command_register;  // 0x0E03000
            15'h1801: dout = fma_status_register;  // 0x0E03002
            15'h1806: dout = fma_interrupt_vector_register;  //
            15'h1808: dout = fma_dclk[31:16];  // 0x0E03010
            15'h1809: dout = fma_dclkl_latch;  // 0x0E03012
            15'h180D: dout = fma_interrupt_status_register;  // 0x0E0301A
            15'h180E: dout = fma_interrupt_enable_register;  // 0x0E0301C
            15'h1812: dout = 16'h0004;  // HF2 Flag of DSP56001?

            15'h2001: dout = 16'h0180;  // 00E04002 ??
            15'h2002: dout = 16'h0118;  // 00E04004 ??
            15'h2003: dout = image_rt;  // 00E04006 ??
            15'h2029: dout = 16'h0180;  // e04052 Pic Size High??
            15'h202a: dout = 16'h0118;  // e04054 Pic Size Low??
            15'h202b: dout = image_rt;  // e04056 Pic Rt ??
            15'h202c: dout = timecode[31:16];  // 00E04058 Time Code High??
            15'h202d: dout = timecode[15:0];  // 00E0405A Time Code Low??
            15'h202e: dout = tmpref;  // 00E0405C TMP REF?? SYS_VSR?
            15'h202f:
            dout = 16'h2000;  // 00E0405E ?? STS ? 2000 has always room for more. always 2000 on cdiemu
            15'h2030: dout = interrupt_enable_register;  // 0E04060
            15'h2031: dout = interrupt_status_register;  // 0E04062
            15'h2032: dout = timer_compare_register;  // 0E04064
            15'h2038: dout = image_height;  // 0E04070 Only written to 0118 -> 280 dez
            15'h2039: dout = image_width;  // 0E04072 Only written to 0180 -> 384 dez
            15'h2050: dout = 16'hffff;  // 00E040A0 ?? Always ffff on cdiemu
            15'h2052: dout = 16'h0001;  // 00E040A4 ??
            15'h2055: dout = 16'h0001;  // e040aa ??
            15'h2056: dout = 16'h0001;  // e040ac ??
            15'h206e: dout = interrupt_vector_register;  //

            default: ;
        endcase

        if (intack) begin
            if (fma_intreq)
                dout = {fma_interrupt_vector_register[7:0], fma_interrupt_vector_register[7:0]};
            else dout = {interrupt_vector_register[10:3], interrupt_vector_register[10:3]};
        end
    end

    bit vsync_q;
    bit dma_active;
    assign req = dma_active;
    assign rdy = dma_active;  // TODO actually use the data

    // Divides 30 Mhz to 45 kHz
    localparam bit [9:0] kFmaClockDivider = 667;
    bit [9:0] fma_dclk_shadow_cnt = 0;

    // Increments at 90 kHz
    bit [15+5:0] timer_cnt = 0;

    bit [9:0] gop_cnt = 0;
    bit [9:0] fma_pack_cnt = 0;
    bit vsync_flipflop;

    always @(posedge clk) begin
        bus_ack <= 0;
        vsync_q <= vsync;
        fifo_out_strobe <= 0;

        if (reset) begin
            mpeg_ram_enabled <= 0;
            mpeg_ram_enabled_cnt <= 0;
            timer_cnt <= 0;
            dma_active <= 0;
        end else begin
            //if (vsync && !vsync_q) interrupt_status_register.vsync <= 1;

            if (vsync && !vsync_q) vsync_flipflop <= !vsync_flipflop;

            if (fifo_out_valid && vsync && !vsync_q && vsync_flipflop) begin
                fifo_out_strobe <= 1;
                interrupt_status_register.seq <= fifo_out.seq;
                interrupt_status_register.gop <= fifo_out.gop;
                interrupt_status_register.pic <= fifo_out.pic;
                tmpref <= fifo_out.tmpref;
                timecode <= fifo_out.timecode;
            end

            if (fma_dclk_shadow_cnt == kFmaClockDivider - 1) begin
                fma_dclk_shadow_cnt <= 0;
                fma_dclk <= fma_dclk + 1;

                if (timer_cnt[15+3:0+3] == timer_compare_register) begin
                    interrupt_status_register.tim <= 1;
                    fma_interrupt_status_register[8] <= 1;
                    timer_cnt <= 0;

                    $display("Time %d", system_clock_reference_start_time[32:1] - fma_dclk);
                end else begin
                    timer_cnt <= timer_cnt + 1;
                end


                if (fma_dclk == fma_dclk_next_update && decoding_frame_data) begin
                    fma_dclk_next_update <= fma_dclk_next_update + 1175;

                    // Resetting Decoding started
                    fma_status_register[4] <= 0;

                    // Frame Header Updated
                    fma_status_register[2] <= 1;
                    fma_interrupt_status_register[2] <= 1;
                end

                if (system_clock_reference_start_time_valid && fma_dclk == system_clock_reference_start_time[32:1] && !decoding_frame_data) begin
                    decoding_frame_data <= 1;
                    fma_dclk_next_update <= fma_dclk + 1175;
                    // Decoding started
                    fma_status_register[4] <= 1;
                    fma_interrupt_status_register[4] <= 1;

                    // Frame Header Updated
                    fma_status_register[2] <= 1;
                    fma_interrupt_status_register[2] <= 1;

                end
            end else begin
                fma_dclk_shadow_cnt <= fma_dclk_shadow_cnt + 1;
            end

            if (done_in && ack) begin
                fma_command_register[15] <= 0;
                dma_active <= 0;
            end

            if (access) begin
                bus_ack <= !bus_ack;

                if (bus_ack) begin
                    if (write_strobe)
                        $display("DVC Write %x %x %d %d", {address[23:1], 1'b0}, din, uds, lds);
                    else $display("DVC Read %x %x %d %d", {address[23:1], 1'b0}, dout, uds, lds);
                end

                if (!write_strobe && bus_ack) begin
                    if (address[15:1] == 15'h2031) begin
                        // Reading the Interrupt Status Register probably resets it? TODO
                        interrupt_status_register <= 0;
                    end

                    if (address[15:1] == 15'h180D) begin
                        // Reading the Interrupt Status Register probably resets it? TODO
                        fma_interrupt_status_register <= 0;
                    end

                    if (address[15:1] == 15'h1808) begin
                        fma_dclkl_latch <= fma_dclk[15:0];
                    end
                end

                if (write_strobe && bus_ack) begin
                    //if (address[13:1] ==
                    mpeg_ram_enabled_cnt <= mpeg_ram_enabled_cnt + 1;
                    if (mpeg_ram_enabled_cnt == 6'b111111) begin
                        mpeg_ram_enabled <= 1;
                        if (!mpeg_ram_enabled) $display("MPEG RAM Enabled!");
                    end

                    case (address[15:1])
                        15'h1800: begin
                            $display("FMA CMD %x %x", address[15:1], din);
                            fma_command_register <= din;
                            if (din[15]) begin
                                dma_active  <= 1;
                                dma_for_fma <= 1;
                            end
                        end
                        15'h1806: begin
                            $display("FMA IVEC %x %x", address[15:1], din);
                            fma_interrupt_vector_register <= din;
                        end
                        15'h180E: begin
                            fma_interrupt_enable_register <= din;
                            $display("FMA IER %x %x", address[15:1], din);

                        end

                        15'h2030: begin
                            interrupt_enable_register <= din;
                            $display("FMV Write IER Register %x %x", address[15:1], din);
                        end
                        15'h2031: begin
                            // TODO interrupt_status_register;
                        end
                        15'h2032: begin  // 0E04064
                            $display("FMV Write TCNT Register %x %x", address[15:1], din);
                            timer_compare_register <= din;
                        end
                        15'h2057: begin
                            $display("FMV Write TRLD Register %x %x", address[15:1], din);
                            timer_cnt <= 0;
                        end
                        15'h2060: begin
                            $display("FMV Write SYSCMD Register %x %x", address[15:1], din);
                            if (din == 16'h8000) begin
                                dma_active  <= 1;
                                dma_for_fma <= 0;
                            end
                        end
                        15'h2061: begin
                            $display("FMV Write VIDCMD Register %x %x", address[15:1], din);
                        end
                        15'h206F: begin
                            $display("FMV Write XFER Register %x %x", address[15:1], din);
                        end
                        15'h206E: begin
                            interrupt_vector_register <= din;
                            $display("FMV Write IVEC Register %x %x", address[15:1], din);
                        end
                        15'h2038: begin
                            $display("FMV Write Image Height %x %x", address[15:1], din);
                            image_height <= din;
                        end
                        15'h2039: begin
                            $display("FMV Write Image Width %x %x", address[15:1], din);
                            image_width <= din;
                        end
                        15'h2001: begin
                            $display("FMV Write Image Width2 %x %x", address[15:1], din);
                            image_width2 <= din;
                        end
                        15'h2002: begin
                            $display("FMV Write Image Height2 %x %x", address[15:1], din);
                            image_height2 <= din;
                        end
                        15'h2003: begin
                            $display("FMV Write Image RT? %x %x", address[15:1], din);
                            image_rt <= din;
                        end
                        default: ;
                    endcase
                end
            end
        end
    end


endmodule



module mpeg_dummy_video_fifo (
    input clk,
    input reset,
    input mpeg_dummy_video_fifo_entry in,
    input write,
    output mpeg_dummy_video_fifo_entry out,
    output out_valid,
    input strobe
);

    mpeg_dummy_video_fifo_entry mem[64];
    bit [5:0] read_index_d;
    bit [5:0] read_index_q;
    bit [5:0] write_index;
    bit [6:0] count;

    // The memory introduces one cycle delay. This is an issue
    // when the FIFO is empty. We want to avoid using the memory readout
    // when reading from a value that is just written
    bit indizes_equal_during_write_d;
    bit indizes_equal_during_write_q;

    assign out_valid = count != 0 && !reset && !indizes_equal_during_write_q;

    always_comb begin
        read_index_d = read_index_q;
        if (strobe) begin
            read_index_d = read_index_q + 1;
        end

        indizes_equal_during_write_d = write_index == read_index_d && write;
    end

    always_ff @(posedge clk) begin
        if (write && !strobe) count <= count + 1;
        if (strobe && !write && count != 0) count <= count - 1;

        if (reset) begin
            write_index <= 0;
            read_index_q <= 0;
            count <= 0;
        end else begin
            if (write) begin
                mem[write_index] <= in;
                write_index <= write_index + 1;
            end

            out <= mem[read_index_d];
            read_index_q <= read_index_d;
            indizes_equal_during_write_q <= indizes_equal_during_write_d;
        end
    end
endmodule

