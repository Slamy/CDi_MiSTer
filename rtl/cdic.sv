`timescale 1 ns / 1 ns
// CD-Interface Controller

`include "bus.svh"
`include "audiotypes.svh"

module cdic (
    input clk,
    input clk_audio,
    input reset,
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
    output bit rdy,
    input dtc,
    input done_in,
    output done_out,

    output bit [31:0] cd_hps_lba,
    output cd_hps_req,
    input cd_hps_ack,
    input cd_hps_data_valid,
    input [15:0] cd_hps_data,
    input debug_disable_sector_filter,

    output signed [15:0] audio_left,
    output signed [15:0] audio_right
);

    wire reset_audio;

    // When clocked at 30 MHz and a sector rate of 75 Hz
    // 30e6/75 = 400000
    // But clocked at 22226400 Hz
    // 22226400 / 75 = 296352
    // 22226400 / 37800 = 588
    // 22226400 / 44100 = 504
    localparam bit [23:0] kSectorPeriod = 296352;
    localparam bit [23:0] kSample37Period = 588;
    localparam bit [23:0] kSample44Period = 504;

    flag_cross_domain cross_reset (
        .clk_a(clk),
        .clk_b(clk_audio),
        .flag_in_clk_a(reset),
        .flag_out_clk_b(reset_audio)
    );

    bit [23:0] sample37800counter;
    bit [23:0] sample44100counter;
    bit [23:0] sector75counter;

    wire sample_tick37_audio = sample37800counter == 0;
    wire sample_tick44_audio = sample44100counter == 0;
    wire sector_tick_audio = sector75counter == 0;
    wire sample_tick37  /*verilator public_flat_rd*/;
    wire sample_tick44;
    wire sector_tick;
    flag_cross_domain cross1 (
        .clk_a(clk_audio),
        .clk_b(clk),
        .flag_in_clk_a(sample_tick37_audio),
        .flag_out_clk_b(sample_tick37)
    );
    flag_cross_domain cross2 (
        .clk_a(clk_audio),
        .clk_b(clk),
        .flag_in_clk_a(sample_tick44_audio),
        .flag_out_clk_b(sample_tick44)
    );
    flag_cross_domain cross3 (
        .clk_a(clk_audio),
        .clk_b(clk),
        .flag_in_clk_a(sector_tick_audio),
        .flag_out_clk_b(sector_tick)
    );

    // Simulate 75 sectors per second
    always_ff @(posedge clk_audio) begin
        if (reset_audio) begin
            sample37800counter <= 0;
            sample44100counter <= 0;
            sector75counter <= 0;
        end else begin
            if (sector75counter == 0) sector75counter <= kSectorPeriod - 1;
            else sector75counter <= sector75counter - 1;

            if (sample44100counter == 0) sample44100counter <= kSample44Period - 1;
            else sample44100counter <= sample44100counter - 1;

            if (sample37800counter == 0) sample37800counter <= kSample37Period - 1;
            else sample37800counter <= sample37800counter - 1;
        end
    end

    // some info is from https://github.com/cdifan/cdichips/blob/master/ims66490cdic.md
    // behaviour is reconstructed from MAME
    // https://github.com/mamedev/mame/blob/master/src/mame/philips/cdicdic.cpp
    // CDIC memory should be from 0x0000 ot 0x3C7F according to the low level test
    // All access must be word aligned according to ims66490cdic.md

    // 16 kB of CDIC memory

    wire [15:0] mem_cpu_readout;
    wire [12:0] mem_cpu_addr = (req && ack) ? dma_control_register[13:1] : address[13:1];
    wire [15:0] mem_cpu_data = din;
    wire mem_cpu_we = address[13:1] <= 13'h1E3F && access && write_strobe && bus_ack;

    // Cut off the sync pattern by starting with the sixth word
    // A real CDIC also does that
    wire mem_cd_hps_we = cd_hps_data_valid && sector_word_index >= 6 && use_sector_data;

    wire [15:0] mem_cdic_readout;
    bit [15:0] mem_cdic_data;
    bit [12:0] mem_cdic_addr;
    bit mem_cdic_we;

    cdic_dual_port_memory mem (
        .clk(clk),

        // CPU side interface
        .data_a(mem_cpu_data),
        .addr_a(mem_cpu_addr),
        .we_a(mem_cpu_we),
        .q_a(mem_cpu_readout),

        // CDIC side interface
        .data_b(mem_cdic_data),
        .addr_b(mem_cdic_addr),
        .we_b(mem_cdic_we),
        .q_b(mem_cdic_readout)
    );

    bit [12:0] mem_cd_audio_addr;
    bit mem_cd_audio_rd;
    bit mem_cd_audio_ack;
    bit mem_cd_audio_ack_q;

    bit cd_audio_start_playback  /*verilator public_flat_rd*/;
    bit [12:0] cd_audio_playback_addr  /*verilator public_flat_rd*/;
    header_submode_s header_submode;
    header_coding_s header_coding;
    bit channel_match;
    bit audio_channel_match;
    bit file_match;
    bit header_mode2;
    bit read_mode2;

    audiostream xa_out ();
    audiostream xa_fifo_out[2] ();
    audiostream xa_fifo_in[2] ();
    wire xa_channel  /*verilator public_flat_rd*/;
    wire signed [15:0] xa_sample  /*verilator public_flat_rd*/ = xa_out.sample;
    wire sample_strobe  /*verilator public_flat_rd*/ = xa_out.write && xa_out.strobe;

    header_coding_s current_active_coding;
    audioplayer cd_audio (
        .clk(clk),
        .reset(reset),
        .mem_addr(mem_cd_audio_addr),
        .mem_data(mem_cdic_readout),
        .mem_rd(mem_cd_audio_rd),
        .mem_ack(mem_cd_audio_ack),
        .mem_ack_q(mem_cd_audio_ack_q),

        .out(xa_out),
        .sample_channel(xa_channel),

        .start_playback(cd_audio_start_playback),
        .playback_coding_in(header_coding),
        .playback_coding_out(current_active_coding),
        .playback_addr(cd_audio_playback_addr)
    );

    wire [1:0] fifo_nearly_full;

    always_comb begin
        // Mono is default. Write to both FIFOs and ignore the channel
        xa_fifo_in[0].sample = xa_out.sample;
        xa_fifo_in[1].sample = xa_out.sample;
        xa_fifo_in[0].write = xa_out.write;
        xa_fifo_in[1].write = xa_out.write;
        xa_out.strobe = xa_channel ? xa_fifo_in[1].strobe : xa_fifo_in[0].strobe;

        // In case of Stereo, write only to selected channel
        if (current_active_coding.chan == kStereo) begin
            xa_fifo_in[0].write = xa_channel == 0 && xa_out.write;
            xa_fifo_in[1].write = xa_channel == 1 && xa_out.write;
        end
    end

    wire signed [15:0] fifo_out_left  /*verilator public_flat_rd*/ = xa_fifo_out[0].sample;
    wire signed [15:0] fifo_out_right  /*verilator public_flat_rd*/ = xa_fifo_out[1].sample;
    wire fifo_out_valid  /*verilator public_flat_rd*/ = xa_fifo_out[0].strobe;

    assign audio_left  = fifo_out_left;
    assign audio_right = fifo_out_right;

    audiofifo fifo_left (
        .clk,
        .reset,
        .in(xa_fifo_in[0]),
        .out(xa_fifo_out[0]),
        .nearly_full(fifo_nearly_full[0])
    );
    audiofifo fifo_right (
        .clk,
        .reset,
        .in(xa_fifo_in[1]),
        .out(xa_fifo_out[1]),
        .nearly_full(fifo_nearly_full[1])
    );

    bit playback_active = 0;
    bit sample_toggle18 = 0;
    bit [3:0] debug_cnt;

    always_ff @(posedge clk) begin
        debug_cnt <= debug_cnt + 1;

        xa_fifo_out[0].strobe <= 0;
        xa_fifo_out[1].strobe <= 0;

        if (reset) begin
            playback_active <= 0;
        end else begin

            if (fifo_nearly_full == 2'b11) begin
                playback_active <= 1;
            end

            if (xa_fifo_out[0].write == 0 && xa_fifo_out[0].write == 0) begin
                playback_active <= 0;
            end

            if (current_active_coding.rate == k37Khz) begin
                if (playback_active && sample_tick37) begin
                    xa_fifo_out[0].strobe <= 1;
                    xa_fifo_out[1].strobe <= 1;
                end
            end

            if (current_active_coding.rate == k18Khz) begin
                if (playback_active && sample_tick37 && sample_toggle18) begin
                    xa_fifo_out[0].strobe <= 1;
                    xa_fifo_out[1].strobe <= 1;
                end
            end

            if (sample_tick37) sample_toggle18 <= !sample_toggle18;
        end
    end


    always_comb begin
        mem_cdic_addr = cd_data_target_adr;
        mem_cdic_we = mem_cd_hps_we;
        mem_cdic_data = cd_hps_data;
        mem_cd_audio_ack = 0;

        if (mem_cd_hps_we) begin
            // Highest priority is to write incoming CD data into memory
        end else if (mem_cd_audio_rd) begin
            mem_cdic_addr = mem_cd_audio_addr;
            mem_cdic_we = 0;
            mem_cd_audio_ack = 1;
        end
    end

    always_ff @(posedge clk) begin
        if (reset) mem_cd_audio_ack_q <= 0;
        else mem_cd_audio_ack_q <= mem_cd_audio_ack;
    end
    wire access = cs && uds && lds;

    struct packed {
        bit [3:0] mins_upper_digit;
        bit [3:0] mins_lower_digit;
        bit [3:0] secs_upper_digit;
        bit [3:0] secs_lower_digit;
        bit [3:0] frac_upper_digit;
        bit [3:0] frac_lower_digit;
        bit [7:0] reserved;
    } time_register  /*verilator public_flat_rd*/;

    bit [31:0] time_register_as_lba;

    always_comb begin
        bit [31:0] mins, secs, frac;

        mins = 32'(time_register.mins_upper_digit) * 32'd10 + 32'(time_register.mins_lower_digit);
        secs = 32'(time_register.secs_upper_digit) * 32'd10 + 32'(time_register.secs_lower_digit);
        frac = 32'(time_register.frac_upper_digit) * 32'd10 + 32'(time_register.frac_lower_digit);

        time_register_as_lba = ((mins * 60) + secs) * 75 + frac;
    end

    // Register set according to MAME and
    // https://github.com/cdifan/cdichips/blob/master/ims66490cdic.md
    bit [31:0] channel_register = 0;
    bit [15:0] audio_channel_register = 0;
    bit [15:0] command_register = 0;
    bit [15:0] data_buffer_register = 0;
    bit [15:0] x_buffer_register = 0;
    bit [15:0] audio_buffer_register = 0;
    bit [15:0] interrupt_vector_register = 0;
    bit [15:0] dma_control_register = 0;
    bit [15:0] audio_control_register = 0;  // called Z buffer in MAME?
    bit [15:0] file_register = 0;

    // 2352 bytes per sector. Always.
    localparam bit [13:0] kWordsPerSector = 2352 / 2;

    // Index of word in CD sector. Useful for selecting specific words
    bit [13:0] sector_word_index = 0;

    // Current write address for RAM to store CD data
    bit [12:0] cd_data_target_adr = 0;

    // CD is spinning and we are reading data
    // HPS will be advised to give data as long as this is set
    bit cd_reading_active = 0;

    bit use_sector_data = 0;

`ifdef VERILATOR
    always_ff @(posedge clk) begin
        if (cd_hps_data_valid)
            $display(
                "CDIC CD Data %x %d %x WE:%d",
                cd_data_target_adr,
                sector_word_index,
                cd_hps_data,
                mem_cd_hps_we
            );
    end
`endif

    assign intreq = x_buffer_register[15] | audio_buffer_register[15];
    assign req = dma_control_register[15];

    localparam kSectorHeader_Mode = 15 / 2;  // Low Byte

    localparam kSectorHeader_File = 16 / 2;  // High Byte
    localparam kSectorHeader_Channel = 17 / 2;  // Low Byte

    localparam kSectorHeader_Submode = 18 / 2;  // High Byte
    localparam kSectorHeader_Coding = 19 / 2;  // Low Byte

    bit audio_target;

    always_ff @(posedge clk) begin
        bus_ack <= 0;
        rdy <= 0;
        cd_audio_start_playback <= 0;

        if (reset) begin
            audio_target <= 1;
            bus_ack <= 0;
            time_register <= 0;
            command_register <= 0;
            audio_buffer_register <= 0;
            dma_control_register <= 0;
            data_buffer_register <= 0;
            x_buffer_register <= 0;
            audio_control_register <= 0;
            interrupt_vector_register <= 0;
            file_register <= 0;
            audio_channel_register <= 0;
            sector_word_index <= 0;
            channel_register <= 0;
            cd_reading_active <= 0;
            header_coding <= 0;
            cd_hps_lba <= 0;
            cd_data_target_adr <= 0;
        end else begin
            if (cd_hps_ack) cd_hps_req <= 0;

            if (mem_cd_hps_we) begin
                cd_data_target_adr <= cd_data_target_adr + 1;
            end

            if (cd_hps_data_valid) begin
                sector_word_index <= sector_word_index + 1;

                if (sector_word_index == kWordsPerSector - 1) begin
                    $display("Sector written to RAM / has ended");
                    //data_buffer_register[14] <= 1'b1;

                    cd_hps_lba <= cd_hps_lba + 1;
                    use_sector_data <= 0;

                    if (use_sector_data) begin
                        data_buffer_register[0] <= !data_buffer_register[0];
                        x_buffer_register[15]   <= 1'b1;

                        // Reset Mode 1&2 cause reading to stop after reading
                        // a sector
                        if (command_register == 16'h23 || command_register == 16'h24)
                            cd_reading_active <= 0;

                        if (header_submode.audio) begin
                            cd_audio_start_playback <= 1;
                        end
                    end
                end

                // Reading Order of MODE2 Header Information
                // Example Header
                // 00 ff ff ff ff ff ff ff ff ff ff 00 01 42 71 02 01 04 64 05 01 04 64 05
                // 00 ff ff ff ff ff ff ff ff ff ff 00 Sync
                // 01 42 71 Timecode
                // 02 Mode 2
                // 01 File
                // 04 Channel
                // 64 Submode
                // 05 Coding
                // 01 04 64 05 Repeat of the last 4 bytes

                if (sector_word_index == kSectorHeader_Mode) begin
                    // Mode is in Low byte
                    header_mode2 <= (cd_hps_data[7:0] == 2) && read_mode2;
                end

                if (header_mode2) begin
                    if (sector_word_index == kSectorHeader_Submode) begin
                        // Submode is in High Byte
                        // Coding is in Low Byte
                        header_submode <= cd_hps_data[15:8];
                        header_coding  <= cd_hps_data[7:0];
                    end

                    if (sector_word_index == kSectorHeader_File) begin
                        // File header value must match the file register for all MODE2 sectors
                        $display("File / Channel %x %x", file_register, cd_hps_data);
                        if (file_register[15:8] != cd_hps_data[15:8]) begin
                            $display("File ignored!");
                        end

                        // High Byte is File
                        file_match <= file_register[15:8] == cd_hps_data[15:8];
                        // Low Byte is Channel
                        audio_channel_match <= audio_channel_register[cd_hps_data[3:0]];
                        channel_match <= channel_register[{1'b0, cd_hps_data[3:0]}];
                    end

                    if (sector_word_index == 10 && !debug_disable_sector_filter) begin
                        // Inspired by cdicdic_device::is_mode2_sector_selected(const uint8_t *buffer)
                        if (header_mode2) begin
                            if (file_match) begin
                                if (header_submode.eof || header_submode.trig || header_submode.eor) begin
                                    // Don't analyze the sub mode. Just accept this sector.
                                end else if (header_submode.data || header_submode.audio || header_submode.video) begin
                                    // This sector has applicable data
                                    if (header_submode.audio && !audio_channel_match)
                                        use_sector_data <= 0;
                                    if (!channel_match) use_sector_data <= 0;
                                end else begin
                                    // Message Sector
                                    use_sector_data <= 0;
                                end
                            end else begin
                                // For a Mode 2 sector, the file must match!
                                use_sector_data <= 0;

                            end
                        end
                    end
                end

                if (header_mode2 && use_sector_data && sector_word_index == 11 && header_submode.audio) begin
`ifdef VERILATOR
                    $display("Switching to Audio %x : %s %s %s", header_coding,
                             header_coding.bps.name(), header_coding.rate.name(),
                             header_coding.chan.name());
`endif
                    cd_data_target_adr <= audio_target ? 13'h0a00 : 13'h0F00;
                    cd_audio_playback_addr <= audio_target ? 13'h0a00 : 13'h0F00;
                    audio_target <= !audio_target;
                end
            end

            if (done_in) dma_control_register[15] <= 0;

            if (cd_reading_active && sector_tick) begin
                cd_hps_req <= 1;
                cd_data_target_adr <= data_buffer_register[0] ? 0 : 13'h0500;
                sector_word_index <= 0;
                use_sector_data <= 1;
            end

            if (data_buffer_register[15]) begin
                x_buffer_register[15] <= 1'b0;
                // as soon as bit 15 is set, the command is parsed and must be reset directly afterwards
                data_buffer_register[15] <= 0;

                case (command_register)
                    16'h23: begin
                        $display("CDIC Command: Reset Mode 1");
                        //cd_reading_active <= 1;
                        cd_hps_lba <= time_register_as_lba;
                        read_mode2 <= 0;
                    end
                    16'h24: begin
                        $display("CDIC Command: Reset Mode 2");
                        //cd_reading_active <= 1;
                        cd_hps_lba <= time_register_as_lba;
                        read_mode2 <= 1;
                    end
                    16'h2b: begin
                        $display("CDIC Command: Stop CDDA");
                        cd_reading_active <= 0;
                    end
                    16'h2e: begin
                        $display("CDIC Command: Update");
                        cd_reading_active <= 0;
                    end
                    16'h27: $display("CDIC Command: Fetch TOC");
                    16'h28: $display("CDIC Command: Play CDDA");
                    16'h29: begin
                        $display("CDIC Command: Read Mode 1");
                        cd_reading_active <= 1;
                        cd_hps_lba <= time_register_as_lba;
                        read_mode2 <= 0;
                    end
                    16'h2c: $display("CDIC Command: Seek");
                    16'h2a: begin
                        $display("CDIC Command: Read Mode 2");
                        cd_reading_active <= 1;
                        cd_hps_lba <= time_register_as_lba;
                        read_mode2 <= 1;
                    end
                    default: begin
                        assert (0);
                    end
                endcase

            end

            if (address[13:1] <= 13'h1E3F && access && write_strobe && !bus_ack) begin
                if (address[13:1] < 13'h1E00) $display("CDIC Write RAM %x %x", address[13:1], din);
            end else if (req && ack) begin
                if (dtc) begin
                    dma_control_register[14:0] <= dma_control_register[14:0] + 2;
                    rdy <= 0;
                end else rdy <= 1;

            end else begin
                if (access && address[13:1] < 13'h1E00 && bus_ack)
                    $display("CDIC Read RAM %x %x", address[13:1], dout);
            end

            if (bus_ack) begin

                if (!write_strobe && address[13:1] == 13'h1FFA) begin
                    // Reading the Audio Buffer Register resets the highest bit
                    audio_buffer_register[15] <= 0;
                    // but for the moment of reading it has to still be 1
                end

                if (!write_strobe && address[13:1] == 13'h1FFB) begin
                    // Reading the X Buffer Register resets the highest bit
                    x_buffer_register[15] <= 0;
                    // but for the moment of reading it has to still be 1
                end

            end

            if (access) begin
                bus_ack <= !bus_ack;

                if (write_strobe && bus_ack) begin
                    case (address[13:1])
                        13'h1E00: begin  // 0x3C00 Command Register
                            $display("CDIC Write Command Register %x %x", address[13:1], din);
                            command_register <= din;
                        end
                        13'h1E01: begin  // 0x3C02 Time High Register
                            $display("CDIC Write Time High Register %x %x", address[13:1], din);
                            time_register[31:16] <= din;
                        end
                        13'h1E02: begin  // 0x3C04 Time Low Register
                            $display("CDIC Write Time Low Register %x %x", address[13:1], din);
                            time_register[15:0] <= din;
                        end
                        13'h1E03: begin  // 0x3C06 File Register
                            $display("CDIC Write File Register %x %x", address[13:1], din);
                            file_register <= din;
                        end
                        13'h1E04: begin  // 0x3C08 Channel High Register
                            $display("CDIC Write Channel High Register %x %x", address[13:1], din);
                            channel_register[31:16] <= din;
                        end
                        13'h1E05: begin  // 0x3C0a Channel Low Register
                            $display("CDIC Write Channel Low Register %x %x", address[13:1], din);
                            channel_register[15:0] <= din;
                        end
                        13'h1E06: begin  // 0x3C0c Audio Channel Register
                            $display("CDIC Write Audio Channel Register %x %x", address[13:1], din);
                            audio_channel_register <= din;
                        end
                        13'h1FFA: begin  // 0x3FF4 ABUF Audio buffer register
                            $display("CDIC Write Audio Buffer Register %x %x", address[13:1], din);
                            audio_buffer_register <= din;
                        end
                        13'h1FFB: begin  // 0x3FF6 X Buffer Register
                            $display("CDIC Write X Buffer Register %x %x", address[13:1], din);
                            x_buffer_register <= din;
                        end
                        13'h1FFC: begin  // 0x3FF8 DMA Control Register
                            $display("CDIC Write DMA Control Register %x %x", address[13:1], din);
                            dma_control_register <= din;
                        end
                        13'h1FFD: begin  // 0x3FFA Z Buffer Register / Audio Control Register
                            $display("CDIC Write Z Buffer Register / Audio Control Register %x %x",
                                     address[13:1], din);
                            audio_control_register <= din;
                        end
                        13'h1FFE: begin  // 0x3FFC IVEC Interrupt Vector register
                            $display("CDIC Write Interrupt Vector Register %x %x", address[13:1],
                                     din);
                            interrupt_vector_register <= din;
                        end
                        13'h1FFF: begin  // 0x3FFE DBUF Data buffer register
                            $display("CDIC Write Data Buffer Register %x %x", address[13:1], din);
                            data_buffer_register <= din;

                            if (!din[14]) begin
                                // Reset everything related to CD reading.
                                cd_reading_active <= 0;
                            end
                        end
                        default: begin
                        end
                    endcase
                end else if (bus_ack) begin

                    // Just some debug info on reading

                    case (address[13:1])
                        13'h1E00: begin  // 0x3C00 Command Register
                            $display("CDIC Read Command Register %x %x", address[13:1], dout);
                        end
                        13'h1E01: begin  // 0x3C02 Time High Register
                            $display("CDIC Read Time High Register %x %x", address[13:1], dout);
                        end
                        13'h1E02: begin  // 0x3C04 Time Low Register
                            $display("CDIC Read Time Low Register %x %x", address[13:1], dout);
                        end
                        13'h1E03: begin  // 0x3C06 File Register
                            $display("CDIC Read File Register %x %x", address[13:1], dout);
                        end
                        13'h1E04: begin  // 0x3C08 Channel High Register
                            $display("CDIC Read Channel High Register %x %x", address[13:1], dout);
                        end
                        13'h1E05: begin  // 0x3C0a Channel Low Register
                            $display("CDIC Read Channel Low Register %x %x", address[13:1], dout);
                        end
                        13'h1E06: begin  // 0x3C0c Audio Channel Register
                            $display("CDIC Read Audio Channel Register %x %x", address[13:1], dout);
                        end
                        13'h1FFA: begin  // 0x3FF4  ABUF	Audio buffer register
                            $display("CDIC Read Audio Buffer Register %x %x", address[13:1], dout);
                        end
                        13'h1FFB: begin  // 0x3FF6 X Buffer Register
                            $display("CDIC Read X Buffer Register %x %x", address[13:1], dout);
                        end
                        13'h1FFC: begin  // 0x3FF8 DMA Control Register
                            $display("CDIC Read DMA Control Register %x %x", address[13:1], dout);
                        end
                        13'h1FFD: begin  // 0x3FFA Z Buffer Register / Audio Control Register
                            $display("CDIC Read Z Buffer Register / Audio Control Register %x %x",
                                     address[13:1], dout);
                        end
                        13'h1FFE: begin  // 0x3FFC IVEC Interrupt Vector register
                            $display("CDIC Read Interrupt Vector Register %x %x", address[13:1],
                                     dout);
                        end
                        13'h1FFF: begin  // 0x3FFE DBUF Data buffer register
                            $display("CDIC Read Data Buffer Register %x %x", address[13:1], dout);
                        end
                        default: begin
                        end
                    endcase


                end
            end
        end
    end

    always_comb begin
        dout = 16'h0;

        case (address[13:1])
            // 13'h00a00: dout = 16'h1234;  // force debug mode of ROM code
            // 13'h00a01: dout = 16'h1234;  // force debug mode of ROM code

            13'h1E00: begin  // 0x3C00 Command Register
                dout = command_register;
            end
            13'h1E01: begin  // 0x3C02 Time High Register
                dout = time_register[31:16];
            end
            13'h1E02: begin  // 0x3C04 Time Low Register
                dout = time_register[15:0];
            end
            13'h1E03: begin  // 0x3C06 File Register
                dout = file_register;
            end
            13'h1E04: begin  // 0x3C08 Channel High Register
                dout = channel_register[31:16];
            end
            13'h1E05: begin  // 0x3C0a Channel Low Register
                dout = channel_register[15:0];
            end
            13'h1E06: begin  // 0x3C0c Audio Channel Register
                dout = audio_channel_register;
            end
            13'h1FFA: begin  // 0x3FF4 ABUF Audio buffer register
                dout = audio_buffer_register;
            end
            13'h1FFB: begin  // 0x3FF6 XBUF Extra buffer register
                dout = x_buffer_register;
            end
            13'h1FFC: begin  // 0x3FF8 DMA Control Register
                dout = dma_control_register;
            end
            13'h1FFD: begin  // 0x3FFA AUDCTL Audio control register
                dout = audio_control_register;
            end
            13'h1FFE: begin  // 0x3FFC IVEC Interrupt Vector register
                dout = interrupt_vector_register;
            end
            13'h1FFF: begin  // 0x3FFE DBUF Data buffer register
                dout = data_buffer_register;
            end
            default: begin
                dout = mem_cpu_readout;
            end
        endcase

        if (intack) begin
            dout = {interrupt_vector_register[7:0], interrupt_vector_register[7:0]};
        end

        // During DMA cycles we only provide the RAM
        if (ack) dout = mem_cpu_readout;

    end

endmodule


// According to
// https://www.intel.com/content/www/us/en/docs/programmable/683082/22-1/true-dual-port-synchronous-ram.html
// to ensure that this is indeed a True Dual-Port RAM with Single Clock
module cdic_dual_port_memory (
    input clk,
    input [15:0] data_a,
    input [15:0] data_b,
    input [12:0] addr_a,
    input [12:0] addr_b,
    input we_a,
    input we_b,
    output bit [15:0] q_a,
    output bit [15:0] q_b
);
    // Declare the RAM variable
    bit [15:0] ram[8192]  /*verilator public_flat_rw*/;

    // Port A 
    always @(posedge clk) begin
        if (we_a) begin
            ram[addr_a] = data_a;
        end
        q_a <= ram[addr_a];
    end

    // Port B 
    always @(posedge clk) begin
        if (we_b) begin
            ram[addr_b] = data_b;
        end
        q_b <= ram[addr_b];
    end
endmodule

