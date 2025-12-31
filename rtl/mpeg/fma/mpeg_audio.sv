`timescale 1 ns / 1 ps
`include "synth_window.svh"
`include "../util.svh"

module mpeg_audio (
    input clk,
    input reset,
    input dsp_enable,
    input reset_input_fifo,

    input [7:0] data_byte,
    input data_strobe,
    output fifo_full,

    output bit signed [15:0] audio_left,
    output bit signed [15:0] audio_right,
    input sample_tick44,
    output playback_active,

    output bit event_decoding_started,
    output bit event_frame_decoded,
    output bit event_underflow,

    input [7:0] dspa,
    input [7:0] dspd,
    input dspd_strobe,
    output linear_volume_s dsp_volume
);

    // 8kB of MPEG stream memory to fill from outside
    wire [31:0] mpeg_in_fifo_out;

    mpeg_input_stream_fifo_8k in_fifo (
        .clk,
        // In, invert endianness at the same time
        .waddr({mpeg_stream_fifo_write_adr[12:2], 2'b11 - mpeg_stream_fifo_write_adr[1:0]}),
        .wdata(data_byte),
        .we(data_strobe),
        // Out (32 bit CPU interface)
        .raddr(dmem_cmd_payload_address[12:2]),
        .q(mpeg_in_fifo_out)
    );

    bit  [27:0] mpeg_stream_fifo_write_adr;
    bit  [31:0] mpeg_stream_bit_index;
    wire [28:0] mpeg_stream_byte_index = mpeg_stream_bit_index[31:3];
    wire [27:0] mpeg_stream_fifo_read_adr = mpeg_stream_byte_index[27:0];

    wire [27:0] fifo_level = mpeg_stream_fifo_write_adr - mpeg_stream_fifo_read_adr;
    assign fifo_full = mpeg_stream_fifo_write_adr > (mpeg_stream_fifo_read_adr + 28'd8000);

    always_ff @(posedge clk) begin
        event_decoding_started <= 0;
        event_frame_decoded <= 0;
        event_underflow <= 0;

        if (reset || reset_input_fifo) begin
            mpeg_stream_fifo_write_adr <= 0;
            mpeg_stream_bit_index <= 0;
        end else begin
            if (data_strobe) begin
                mpeg_stream_fifo_write_adr <= mpeg_stream_fifo_write_adr + 1;
            end

            if (dmem_cmd_payload_write && dmem_cmd_valid) begin
                if (dmem_cmd_payload_address == 32'h10002000)
                    mpeg_stream_fifo_write_adr <= dmem_cmd_payload_data[27:0];
                if (dmem_cmd_payload_address == 32'h10002004)
                    mpeg_stream_bit_index <= dmem_cmd_payload_data;

                event_decoding_started <= (dmem_cmd_payload_address == 32'h10002008);
                event_frame_decoded <= (dmem_cmd_payload_address == 32'h1000200c);
                event_underflow <= (dmem_cmd_payload_address == 32'h10002010);
            end
        end
    end

    dsp_registers registerbank (
        .clk,
        .reset,
        .dspa,
        .dspd,
        .dspd_strobe,
        .volume(dsp_volume)
    );

    // 28000 byte of memory are required
    wire [31:0] memory_out;
    wire [31:0] memory_b_out;
    assign imem_rsp_payload_word = reverse_endian_32(memory_b_out);

    audio_firmware_memory mem (
        .clk,
        .addr2(imem_cmd_payload_address[14:2]),
        .data_out2(memory_b_out),
        .be2(0),
        .we2(0),
        .data_in2(0),
        .addr1(mac_state == FETCH ? mac_vector_addr[14:2] : dmem_cmd_payload_address[14:2]),
        .data_in1(reverse_endian_32(dmem_cmd_payload_data)),
        .we1(dmem_cmd_payload_address[31:28]==0 && dmem_cmd_valid && dmem_cmd_ready && dmem_cmd_payload_write),
        .be1({
            dmem_cmd_payload_mask[0],
            dmem_cmd_payload_mask[1],
            dmem_cmd_payload_mask[2],
            dmem_cmd_payload_mask[3]
        }),
        .data_out1(memory_out)
    );

    // sbt "Test/runMain vexiiriscv.Generate --with-rvm --with-rvc 
    // --region base=00000000,size=80000000,main=1,exe=1 --allow-bypass-from=0"

    wire        imem_cmd_valid;
    bit         imem_cmd_ready;
    wire [ 0:0] imem_cmd_payload_id;
    wire [31:0] imem_cmd_payload_address;
    bit         imem_rsp_valid;
    bit  [ 0:0] imem_rsp_payload_id;
    bit         imem_rsp_payload_error;
    bit  [31:0] imem_rsp_payload_word;
    wire        dmem_cmd_valid;
    bit         dmem_cmd_ready;
    wire [ 0:0] dmem_cmd_payload_id;
    wire        dmem_cmd_payload_write;
    wire [31:0] dmem_cmd_payload_address;
    wire [31:0] dmem_cmd_payload_data;
    wire [ 1:0] dmem_cmd_payload_size;
    wire [ 3:0] dmem_cmd_payload_mask;
    wire        dmem_cmd_payload_io;
    wire        dmem_cmd_payload_fromHart;
    wire [15:0] dmem_cmd_payload_uopId;
    bit         dmem_rsp_valid;
    bit  [ 0:0] dmem_rsp_payload_id;
    bit         dmem_rsp_payload_error;
    bit  [31:0] dmem_rsp_payload_data;

    /*verilator tracing_off*/
    VexiiRiscv vexii (
        .PrivilegedPlugin_logic_rdtime(0),
        .PrivilegedPlugin_logic_harts_0_int_m_timer(0),
        .PrivilegedPlugin_logic_harts_0_int_m_software(0),
        .PrivilegedPlugin_logic_harts_0_int_m_external(0),
        .FetchCachelessPlugin_logic_bus_cmd_valid(imem_cmd_valid),
        .FetchCachelessPlugin_logic_bus_cmd_ready(imem_cmd_ready),
        .FetchCachelessPlugin_logic_bus_cmd_payload_id(imem_cmd_payload_id),
        .FetchCachelessPlugin_logic_bus_cmd_payload_address(imem_cmd_payload_address),
        .FetchCachelessPlugin_logic_bus_rsp_valid(imem_rsp_valid),
        .FetchCachelessPlugin_logic_bus_rsp_payload_id(imem_rsp_payload_id),
        .FetchCachelessPlugin_logic_bus_rsp_payload_error(imem_rsp_payload_error),
        .FetchCachelessPlugin_logic_bus_rsp_payload_word(imem_rsp_payload_word),
        .LsuCachelessPlugin_logic_bus_cmd_valid(dmem_cmd_valid),
        .LsuCachelessPlugin_logic_bus_cmd_ready(dmem_cmd_ready),
        .LsuCachelessPlugin_logic_bus_cmd_payload_id(dmem_cmd_payload_id),
        .LsuCachelessPlugin_logic_bus_cmd_payload_write(dmem_cmd_payload_write),
        .LsuCachelessPlugin_logic_bus_cmd_payload_address(dmem_cmd_payload_address),
        .LsuCachelessPlugin_logic_bus_cmd_payload_data(dmem_cmd_payload_data),
        .LsuCachelessPlugin_logic_bus_cmd_payload_size(dmem_cmd_payload_size),
        .LsuCachelessPlugin_logic_bus_cmd_payload_mask(dmem_cmd_payload_mask),
        .LsuCachelessPlugin_logic_bus_cmd_payload_io(dmem_cmd_payload_io),
        .LsuCachelessPlugin_logic_bus_cmd_payload_fromHart(dmem_cmd_payload_fromHart),
        .LsuCachelessPlugin_logic_bus_cmd_payload_uopId(dmem_cmd_payload_uopId),
        .LsuCachelessPlugin_logic_bus_rsp_valid(dmem_rsp_valid),
        .LsuCachelessPlugin_logic_bus_rsp_payload_id(dmem_rsp_payload_id),
        .LsuCachelessPlugin_logic_bus_rsp_payload_error(dmem_rsp_payload_error),
        .LsuCachelessPlugin_logic_bus_rsp_payload_data(dmem_rsp_payload_data),
        .clk(clk),
        .reset(reset || !dsp_enable)
    );
    /*verilator tracing_on*/

    bit signed [32:0] mac_vector_accu = 0;
    bit signed [31:0] mac_vector_accu_saturated;

    always_comb begin
        if (mac_vector_accu > signed'(33'h7fffffff)) mac_vector_accu_saturated = 32'h7fffffff;
        else if (mac_vector_accu < signed'(-33'h7fffffff))
            mac_vector_accu_saturated = -32'h7fffffff;
        else mac_vector_accu_saturated = mac_vector_accu[31:0];
    end

    bit signed [17:0] mac_vector_temp1 = 0;

    // shared with CPU bus. Careful!
    wire signed [31:0] mac_vector_temp2 = reverse_endian_32(memory_out);

    bit [31:0] mac_vector_addr;
    bit [8:0] mac_vector_index;
    bit [7:0] mac_vector_cnt;
    bit perform_calc;
    enum bit {
        IDLE,
        FETCH
    } mac_state;

    always_ff @(posedge clk) begin
        perform_calc <= 0;

        if (perform_calc) begin
            /*
            $display("Accumulate %d <= %d + %d * %d",
                     mac_vector_accu + mac_vector_temp1 * mac_vector_temp2, mac_vector_accu,
                     mac_vector_temp1, mac_vector_temp2);
            */
            mac_vector_accu <= mac_vector_accu + mac_vector_temp1 * mac_vector_temp2;
            // mac_vector_accu <= mac_vector_accu + 1;
        end

        case (mac_state)
            IDLE: begin
                if (dmem_cmd_payload_address == 32'h10001000 && dmem_cmd_payload_write && dmem_cmd_valid && dmem_cmd_ready) begin
                    mac_vector_addr <= dmem_cmd_payload_data;
                    //$display("Vector Adr %x", dmem_cmd_payload_data);
                end
                if (dmem_cmd_payload_address == 32'h10001004 && dmem_cmd_payload_write && dmem_cmd_valid && dmem_cmd_ready) begin
                    mac_vector_index <= dmem_cmd_payload_data[8:0];
                    mac_vector_cnt <= 8;
                    mac_state <= FETCH;
                    //$display("Vector Index %x", dmem_cmd_payload_data[8:0]);

                end
                if (dmem_cmd_payload_address == 32'h10001008 && dmem_cmd_payload_write && dmem_cmd_valid && dmem_cmd_ready)
                    mac_vector_accu <= {1'b0, dmem_cmd_payload_data};
            end
            FETCH: begin
                mac_vector_temp1 <= PLM_AUDIO_SYNTHESIS_WINDOW(mac_vector_index);
                //mac_vector_temp2 <= reverse_endian_32(memory[mac_vector_addr>>2]);
                mac_vector_index <= mac_vector_index + 64;
                mac_vector_addr  <= mac_vector_addr + 128 * 4;
                mac_vector_cnt   <= mac_vector_cnt - 1;
                if (mac_vector_cnt != 0) perform_calc <= 1;
                else mac_state <= IDLE;
            end
        endcase
    end

    always_comb begin
        imem_cmd_ready = 1;

        dmem_cmd_ready = 1;
        if (dmem_cmd_payload_address[31:28] == 4'd1) begin
            dmem_cmd_ready = !mac_state && fifo_nearly_full == 0;
        end

        dmem_rsp_payload_data = reverse_endian_32(mpeg_in_fifo_out);

        if (dmem_cmd_valid_q && dmem_cmd_ready_q) begin
            case (dmem_cmd_payload_address_q[31:28])
                4'd1: begin
                    // I/O Area
                    if (!dmem_cmd_payload_write_q) begin
                        if (dmem_cmd_payload_address_q == 32'h10001008)
                            dmem_rsp_payload_data = mac_vector_accu_saturated;
                        if (dmem_cmd_payload_address_q == 32'h10002000)
                            dmem_rsp_payload_data = {4'b0000, mpeg_stream_fifo_write_adr};
                        if (dmem_cmd_payload_address_q == 32'h10002004)
                            dmem_rsp_payload_data = mpeg_stream_bit_index;
                    end
                end
                4'd0: begin
                    dmem_rsp_payload_data = reverse_endian_32(memory_out);
                end
                default: begin
                    // Assign the rest of the memory to the MPEG FIFO to fake a real big file
                    dmem_rsp_payload_data = reverse_endian_32(mpeg_in_fifo_out);
                end
            endcase

        end
    end

`ifdef VERILATOR
    bit [31:0] imem_cmd_payload_address_q;
    always_ff @(posedge clk) begin

        imem_cmd_payload_address_q <= imem_cmd_payload_address;
        if (imem_rsp_valid) begin
            //$display("IMEM %x %x", imem_cmd_payload_address_q, imem_rsp_payload_word);
        end

        if (dmem_rsp_valid) begin
            //$display("DMEM %x %x", dmem_cmd_payload_address_q, dmem_rsp_payload_data);
        end
    end
`endif

    bit [31:0] debug_l_storage;
    bit [31:0] dmem_cmd_payload_address_q;
    bit dmem_cmd_valid_q;
    bit dmem_cmd_ready_q;
    bit dmem_cmd_payload_write_q;

    always_ff @(posedge clk) begin
        imem_rsp_valid <= 0;
        dmem_rsp_valid <= 0;

        dmem_cmd_payload_address_q <= dmem_cmd_payload_address;
        dmem_cmd_valid_q <= dmem_cmd_valid;
        dmem_cmd_ready_q <= dmem_cmd_ready;
        dmem_cmd_payload_write_q <= dmem_cmd_payload_write;

        if (dmem_cmd_payload_write && dmem_cmd_valid) begin
            if (dmem_cmd_payload_address == 32'h1000000c) $finish();
            if (dmem_cmd_payload_address == 32'h10000030) soft_state <= dmem_cmd_payload_data;
            if (dmem_cmd_payload_address == 32'h10000000)
                $display("Debug out %x", dmem_cmd_payload_data);
            if (dmem_cmd_payload_address == 32'h10000040)
                $display("Debug A %x", dmem_cmd_payload_data);
            if (dmem_cmd_payload_address == 32'h10000044)
                $display("Debug B %x", dmem_cmd_payload_data);

            if (dmem_cmd_payload_address == 32'h10000004) debug_l_storage <= dmem_cmd_payload_data;
            if (dmem_cmd_payload_address == 32'h10000008)
                $display("Debug %d %d", signed'(debug_l_storage), signed'(dmem_cmd_payload_data));
        end

        if (dmem_cmd_valid && dmem_cmd_ready) begin
            dmem_rsp_payload_id <= dmem_cmd_payload_id;
            dmem_rsp_valid <= 1;

            case (dmem_cmd_payload_address[31:28])
                4'd1: begin
                    // I/O Area
                end
                4'd0: begin

                end
                default: begin
                end
            endcase
        end

        if (imem_cmd_valid) begin
            imem_rsp_valid <= 1;
            imem_rsp_payload_id <= imem_cmd_payload_id;
        end
    end

    audiostream xa_fifo_out[2] ();
    audiostream xa_fifo_in[2] ();

`ifdef VERILATOR
    wire signed [15:0] fifo_out_left  /*verilator public_flat_rd*/ = xa_fifo_out[0].sample;
    wire signed [15:0] fifo_out_right  /*verilator public_flat_rd*/ = xa_fifo_out[1].sample;
    wire fifo_out_valid  /*verilator public_flat_rd*/ = xa_fifo_out[0].strobe;
`endif

    wire [1:0] fifo_nearly_full;
    wire [1:0] fifo_half_full;

    mpeg_audiofifo fifo_left (
        .clk,
        .reset,
        .in(xa_fifo_in[0]),
        .out(xa_fifo_out[0]),
        .nearly_full(fifo_nearly_full[0]),
        .half_full(fifo_half_full[0])
    );
    mpeg_audiofifo fifo_right (
        .clk,
        .reset,
        .in(xa_fifo_in[1]),
        .out(xa_fifo_out[1]),
        .nearly_full(fifo_nearly_full[1]),
        .half_full(fifo_half_full[1])
    );

    wire [15:0] sample  /*verilator public_flat_rd*/ = dmem_cmd_payload_data[15:0];
    wire sample_left_write /*verilator public_flat_rd*/ = (dmem_cmd_payload_address == 32'h10003000 && dmem_cmd_payload_write && dmem_cmd_valid && dmem_cmd_ready) ;
    wire sample_right_write /*verilator public_flat_rd*/ = (dmem_cmd_payload_address == 32'h10004000 && dmem_cmd_payload_write && dmem_cmd_valid && dmem_cmd_ready) ;
    bit [31:0] soft_state = 0;

    always_comb begin
        xa_fifo_in[0].sample = sample;
        xa_fifo_in[1].sample = sample;
        xa_fifo_in[0].write  = sample_left_write;
        xa_fifo_in[1].write  = sample_right_write;
    end

    // Used to reduce the speed of zeroing after playback has ended
    bit dc_bias_cnt;
    bit audio_fifo_output_enabled = 0;
    assign playback_active = audio_fifo_output_enabled;

    bit strobe_fifo;
    always_comb begin
        strobe_fifo = 0;
        if (audio_fifo_output_enabled) begin
            if (sample_tick44) strobe_fifo = 1;
        end
    end

    always_ff @(posedge clk) begin
        dc_bias_cnt <= !dc_bias_cnt;

        xa_fifo_out[0].strobe <= 0;
        xa_fifo_out[1].strobe <= 0;

        if (reset) begin
            audio_fifo_output_enabled <= 0;
            xa_fifo_out[0].strobe <= 0;
            xa_fifo_out[1].strobe <= 0;
        end else begin

            if (fifo_half_full == 2'b11 && sample_tick44) begin
                audio_fifo_output_enabled <= 1;
            end

            if (xa_fifo_out[0].write == 0 && xa_fifo_out[0].write == 0) begin
                audio_fifo_output_enabled <= 0;
            end

            if (audio_fifo_output_enabled) begin
                if (strobe_fifo) begin
                    xa_fifo_out[0].strobe <= 1;
                    xa_fifo_out[1].strobe <= 1;

                    audio_left <= xa_fifo_out[0].sample;
                    audio_right <= xa_fifo_out[1].sample;
                end
            end else if (dc_bias_cnt) begin
                // Slowly move the current sample to zero
                // to remove pops when playing the next samples

                if (audio_left > 0) audio_left <= audio_left - 1;
                else if (audio_left < 0) audio_left <= audio_left + 1;

                if (audio_right > 0) audio_right <= audio_right - 1;
                else if (audio_right < 0) audio_right <= audio_right + 1;
            end
        end
    end

endmodule : mpeg_audio




