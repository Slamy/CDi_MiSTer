`timescale 1 ns / 1 ns
`include "bus.svh"
`include "audiotypes.svh"

// Playback of Audio Sectors

// inspired by https://github.com/MiSTer-devel/PSX_MiSTer/blob/main/rtl/cd_xa.vhd
// inspired by https://github.com/dankan1890/mewui/blob/master/src/mame/machine/cdicdic.cpp

module audioplayer (
    input clk,
    input reset,

    output bit [12:0] mem_addr,
    output bit mem_rd,
    input [15:0] mem_data,
    input mem_ack,
    input mem_ack_q,

    audiostream.source out,
    output bit sample_channel,

    input start_playback,
    input header_coding_s playback_coding_in,
    output header_coding_s playback_coding_out,
    input [12:0] playback_addr
);

    enum {
        IDLE,
        EVALHEADER,
        EVALHEADER2,
        READ_SAMPLE,
        APPLY_FILTER1,
        APPLY_FILTER2,
        CALC1,
        CALC2,
        CALC3,
        NEXT_SAMPLE
    } adpcm_state;

    bit [13:0] current_addr;
    bit [13:0] data_addr;
    bit [13:0] header_addr;
    bit [13:0] block_addr;
    bit [4:0] group_cnt;  // 18 groups per sector
    bit [3:0] block_cnt;  // counts to 8 for 4BPS and to 4 for 8BPS
    bit [7:0] data_cnt;  // counts to 28

    header_coding_s playback_coding;
    assign playback_coding_out = playback_coding;

    // Those are byte addresses
    localparam bit [13:0] s_4bit_header_offsets[8] = '{0, 1, 2, 3, 8, 9, 10, 11};
    localparam bit [13:0] s_4bit_data_offsets[8] = '{16, 16, 17, 17, 18, 18, 19, 19};

    // Stolen from MAME
    localparam bit signed [11:0] s_xa_filter_coef[4][2] = '{
        '{12'h000, 12'h000},
        '{12'h0F0, 12'h000},
        '{12'h1CC, -12'h0D0},
        '{12'h188, -12'h0DC}
    };

    // TODO reduce size
    bit signed [31:0] sample  /*verilator public_flat_rd*/;
    bit signed [15:0] sample16;

    bit [7:0] mem_data_bytes[2];
    bit [13:0] mem_addr_byte;

    bit mem_addr_byte_selector;
    bit mem_addr_byte_selector_q;
    wire [7:0] mem_data_byte = mem_data_bytes[mem_addr_byte_selector_q];
    bit [3:0] mem_data_byte_nibbles[2];

    wire channel  /*verilator public_flat_rd*/ = playback_coding.chan == kStereo ? block_cnt[0] : 0;
    assign out.sample = old_samples[sample_channel][0];

    always_comb begin
        // create nibble and byte views on memory result
        {mem_data_byte_nibbles[0], mem_data_byte_nibbles[1]} = mem_data_byte;
        {mem_data_bytes[0], mem_data_bytes[1]} = mem_data;

        mem_rd = 0;
        mem_addr_byte = 0;
        mem_addr_byte_selector = 0;

        sample16 = sample[15:0];
        if (sample < -32768) sample16 = -32768;
        else if (sample > 32767) sample16 = 32767;

        case (adpcm_state)
            EVALHEADER: begin
                mem_addr_byte = block_addr + s_4bit_header_offsets[block_cnt[2:0]];
                mem_rd = 1;
            end
            EVALHEADER2: begin
                mem_rd = 1;
                mem_addr_byte = data_addr;
            end
            NEXT_SAMPLE: begin
                mem_rd = 1;
                mem_addr_byte = data_addr;
            end
        endcase

        {mem_addr, mem_addr_byte_selector} = mem_addr_byte;
    end

    bit [3:0] gain_shift;
    bit [1:0] filter_index;

    bit signed [15:0] old_samples[2][2];
    bit signed [31:0] mac;

    wire inbetween  /*verilator public_flat_rd*/ = adpcm_state == APPLY_FILTER1;

    always_ff @(posedge clk) begin

        // catch overflow during simulation
        if (start_playback) assert (adpcm_state == IDLE);

        if (out.strobe) begin
            assert (out.write);
            out.write <= 0;
        end

        if (mem_rd) mem_addr_byte_selector_q <= mem_addr_byte_selector;

        if (reset) begin
            adpcm_state <= IDLE;
            old_samples <= '{'{0, 0}, '{0, 0}};
            group_cnt   <= 0;
            out.write   <= 0;
        end else begin
            case (adpcm_state)
                IDLE: begin
                    if (start_playback) begin
                        block_addr <= {playback_addr, 1'b0};
                        playback_coding <= playback_coding_in;
                        adpcm_state <= EVALHEADER;
                        block_cnt <= 0;
                        group_cnt <= 0;
                    end
                end
                EVALHEADER: begin
                    if (mem_ack) begin
                        data_addr <= block_addr + s_4bit_data_offsets[block_cnt[2:0]];
                        adpcm_state <= EVALHEADER2;
                        data_cnt <= 0;
                    end
                end
                EVALHEADER2: begin
                    if (mem_ack_q) begin
                        $display("Coding param: %x", mem_data_byte);
                        gain_shift   <= 12 - mem_data_byte[3:0];
                        filter_index <= mem_data_byte[5:4];
                    end

                    if (mem_ack) begin
                        adpcm_state <= READ_SAMPLE;
                    end
                end
                READ_SAMPLE: begin
                    if (mem_ack_q) begin
                        sample <= 32'(signed'(mem_data_byte_nibbles[!block_cnt[0]])) <<< gain_shift;
                        data_addr <= data_addr + 4;
                        data_cnt <= data_cnt + 1;
                        adpcm_state <= APPLY_FILTER1;
                    end
                end
                APPLY_FILTER1: begin
                    mac <= s_xa_filter_coef[filter_index][0] * old_samples[channel][0];
                    adpcm_state <= APPLY_FILTER2;
                end
                APPLY_FILTER2: begin
                    mac <= mac + s_xa_filter_coef[filter_index][1] * old_samples[channel][1];
                    adpcm_state <= CALC1;
                end
                CALC1: begin
                    if (!out.write) begin
                        sample <= sample + ((mac + 128) / 256);
                        adpcm_state <= CALC2;
                        sample_channel <= channel;
                    end
                end
                CALC2: begin
                    old_samples[sample_channel][1] <= old_samples[sample_channel][0];
                    old_samples[sample_channel][0] <= sample16;
                    out.write <= 1;
                    if (data_cnt == 28) begin
                        if (block_cnt == 7) begin
                            if (group_cnt == 17) begin
                                adpcm_state <= IDLE;
                            end else begin
                                block_addr  <= block_addr + 128;  // group has 128 byte size
                                adpcm_state <= EVALHEADER;
                                block_cnt   <= 0;
                                group_cnt   <= group_cnt + 1;
                            end
                        end else begin
                            block_cnt   <= block_cnt + 1;
                            adpcm_state <= EVALHEADER;
                        end
                    end else begin
                        adpcm_state <= NEXT_SAMPLE;
                    end
                end
                NEXT_SAMPLE: begin
                    if (mem_ack) begin
                        adpcm_state <= READ_SAMPLE;
                    end
                end
            endcase
        end

    end
endmodule
