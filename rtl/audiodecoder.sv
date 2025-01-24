`timescale 1 ns / 1 ns
`include "bus.svh"
`include "audiotypes.svh"

// Playback of Audio Sectors

// inspired by https://github.com/MiSTer-devel/PSX_MiSTer/blob/main/rtl/cd_xa.vhd
// inspired by https://github.com/dankan1890/mewui/blob/master/src/mame/machine/cdicdic.cpp


function automatic [3:0] get_sector_count_for_coding(input header_coding_s coding);
    bit [3:0] base_count = 2;

    if (coding.bps == k4Bps) base_count *= 2;  // Twice as many 4bpp audio frames fit as usual
    if (coding.rate == k18Khz)
        base_count *= 2;  // Twice as many half-rate audio frames fit as usual
    if (coding.chan == kMono) base_count *= 2;  // Twice as many mono audio frames fit vs. stereo

    $display("get_sector_count_for_coding %d", base_count);
    get_sector_count_for_coding = base_count - 1;
endfunction

module audiodecoder (
    input clk,
    input reset,
    input reset_filter_on_start,
    input ignore_playback_delay,

    output bit [12:0] mem_addr,
    output bit mem_rd,
    input [15:0] mem_data,
    input mem_ack,  // Flag indicates that the memory request was accepted
    input mem_ack_q,  // Flag indicates that mem_data is valid

    audiostream.source out,
    output bit sample_channel,

    input use_external_coding,  // don't read coding from memory, use parameter
    input header_coding_s cd_audio_coding,  // used when external_coding set
    input start_playback,
    input audio_tick,  // CD sector tick rate 75 Hz
    output header_coding_s playback_coding_out,
    input [12:0] playback_addr,

    output idle,
    output bit disable_audiomap  // flag, when 0xff coding is detected
);

    enum {
        IDLE,
        // XA ADPCM handling
        DETECT_CODING,
        DETECT_CODING2,
        WAIT_AUDIO_TICKS,
        EVALHEADER,
        EVALHEADER2,
        READ_SAMPLE,
        APPLY_FILTER1,
        APPLY_FILTER2,
        CALC1,
        CALC2,
        CALC3,
        NEXT_SAMPLE,
        // CDDA handling
        CDDA_READ,
        CDDA_PROCESS,
        CDDA_WAIT
    } decoder_state;

    assign idle = decoder_state == IDLE;

    bit [13:0] data_addr;
    bit [13:0] block_addr;
    bit [4:0] group_cnt;  // 18 groups per sector
    bit [3:0] block_cnt;  // counts to 8 for 4BPS and to 4 for 8BPS
    bit [5:0] data_cnt;  // counts to 28

    bit [3:0] tick_wait_cnt;
    header_coding_s playback_coding;

    // Those are byte addresses
    localparam bit [13:0] HEADER_OFFSETS_4BIT[8] = '{0, 1, 2, 3, 8, 9, 10, 11};
    localparam bit [13:0] DATA_OFFSETS_4BIT[8] = '{16, 16, 17, 17, 18, 18, 19, 19};
    localparam bit [13:0] HEADER_OFFSETS_8BIT[4] = '{0, 1, 2, 3};
    localparam bit [13:0] DATA_OFFSETS_8BIT[4] = '{16, 17, 18, 19};

    localparam bit [4:0] LAST_GROUP_INDEX = 17;
    localparam bit [5:0] SAMPLES_PER_BLOCK = 28;
    localparam bit [13:0] BLOCK_SIZE = 128;

    bit [13:0] header_offset;
    bit [13:0] data_offset;
    bit [ 3:0] gain_shift_offset;
    bit [ 3:0] last_block_index;
    always_comb begin
        if (playback_coding.bps == k8Bps) begin
            header_offset = HEADER_OFFSETS_8BIT[block_cnt[1:0]];
            data_offset = DATA_OFFSETS_8BIT[block_cnt[1:0]];
            gain_shift_offset = 8;
            last_block_index = 3;
        end else begin
            header_offset = HEADER_OFFSETS_4BIT[block_cnt[2:0]];
            data_offset = DATA_OFFSETS_4BIT[block_cnt[2:0]];
            gain_shift_offset = 12;
            last_block_index = 7;
        end
    end

    // Stolen from MAME
    localparam bit signed [11:0] s_xa_filter_coef[4][2] = '{
        '{12'h000, 12'h000},
        '{12'h0F0, 12'h000},
        '{12'h1CC, -12'h0D0},
        '{12'h188, -12'h0DC}
    };

    // TODO reduce width of register. 32 bit is rather large for 16 bit
    bit signed [31:0] sample  /*verilator public_flat_rd*/;
    bit signed [15:0] sample16;

    bit [7:0] mem_data_bytes[2];
    bit [13:0] mem_addr_byte;

    bit mem_addr_byte_selector;
    bit mem_addr_byte_selector_q;
    wire [7:0] mem_data_byte = mem_data_bytes[mem_addr_byte_selector_q];
    bit [3:0] mem_data_byte_nibbles[2];

    wire channel  /*verilator public_flat_rd*/ = playback_coding.chan == kStereo ? block_cnt[0] : 0;

    always_comb begin
        out.sample = old_samples[sample_channel][0];
        if (playback_coding.bps == k16Bps) out.sample = sample[15:0];
    end

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

        case (decoder_state)
            DETECT_CODING: begin
                mem_addr_byte = block_addr + 11;
                mem_rd = 1;
            end
            EVALHEADER: begin
                mem_addr_byte = block_addr + header_offset + 12;
                mem_rd = 1;
            end
            EVALHEADER2: begin
                mem_addr_byte = data_addr + 12;
                mem_rd = 1;
            end
            NEXT_SAMPLE: begin
                mem_addr_byte = data_addr + 12;
                mem_rd = 1;
            end
            CDDA_READ: begin
                mem_addr_byte = data_addr;
                mem_rd = 1;
            end
        endcase

        {mem_addr, mem_addr_byte_selector} = mem_addr_byte;
    end

    bit [3:0] gain_shift;
    bit [1:0] filter_index;

    bit signed [15:0] old_samples[2][2];
    bit signed [31:0] mac;

    wire inbetween  /*verilator public_flat_rd*/ = decoder_state == APPLY_FILTER1;

    always_ff @(posedge clk) begin
        disable_audiomap <= 0;

        // catch overflow during simulation
        if (start_playback) assert (decoder_state == IDLE);

        if (out.strobe) begin
            assert (out.write);
            out.write <= 0;
        end

        if (mem_rd) mem_addr_byte_selector_q <= mem_addr_byte_selector;

        if (reset) begin
            decoder_state <= IDLE;
            old_samples <= '{'{0, 0}, '{0, 0}};
            group_cnt <= 0;
            out.write <= 0;
            tick_wait_cnt <= 0;
        end else begin
            if (audio_tick && !idle) begin
                if (tick_wait_cnt == 0)
                    tick_wait_cnt <= get_sector_count_for_coding(playback_coding);
                else tick_wait_cnt <= tick_wait_cnt - 1;
            end

            case (decoder_state)
                IDLE: begin
                    if (start_playback) begin
                        // Coding can be read from memory or forced
                        if (use_external_coding) begin
                            // Don't read coding from memory.
                            // Use cd_audio_coding

                            block_cnt <= 0;
                            group_cnt <= 0;
                            $display("EXTERNAL CODING %x", cd_audio_coding);

                            playback_coding <= cd_audio_coding;
                            decoder_state   <= (cd_audio_coding.bps == k16Bps) ? CDDA_READ : WAIT_AUDIO_TICKS;
                            if (tick_wait_cnt == 0) begin
                                if (ignore_playback_delay) tick_wait_cnt <= 1;
                                else tick_wait_cnt <= get_sector_count_for_coding(cd_audio_coding);
                            end
                        end else begin
                            // Read coding from sector header
                            decoder_state <= DETECT_CODING;
                        end

                        block_addr <= {playback_addr, 1'b0};
                        data_addr  <= {playback_addr, 1'b0};  // for CDDA

                        $display("Start Decoder at %x", {playback_addr, 1'b0});

                        if (reset_filter_on_start) begin
                            $display("Reset audio filters");
                            old_samples <= '{'{0, 0}, '{0, 0}};

                            // TODO Why this again?
                            if (!use_external_coding) tick_wait_cnt <= 0;
                        end
                    end
                end
                DETECT_CODING: begin
                    if (mem_ack) begin
                        decoder_state <= DETECT_CODING2;
                    end
                end
                DETECT_CODING2: begin
                    if (mem_ack_q) begin
                        block_cnt <= 0;
                        group_cnt <= 0;
                        $display("DETECT_CODING2 %x", mem_data_byte);
                        assert (mem_data_byte != 0);  // plausible?

                        if (mem_data_byte == 8'hff) begin
                            // special coding to stop the decoder?
                            decoder_state <= IDLE;
                            disable_audiomap <= 1;
                        end else begin
                            playback_coding <= mem_data_byte;
                            decoder_state   <= WAIT_AUDIO_TICKS;
                            if (tick_wait_cnt == 0) begin
                                if (ignore_playback_delay) tick_wait_cnt <= 1;
                                else tick_wait_cnt <= get_sector_count_for_coding(mem_data_byte);
                            end

                            assert (mem_data_byte != 0);  // plausible?
                        end

                    end
                end
                WAIT_AUDIO_TICKS: begin
                    if (tick_wait_cnt == 0) decoder_state <= EVALHEADER;
                end
                EVALHEADER: begin
                    if (mem_ack) begin
                        data_addr <= block_addr + data_offset;
                        decoder_state <= EVALHEADER2;
                        data_cnt <= 0;
                    end
                end
                EVALHEADER2: begin
                    if (mem_ack_q) begin
                        $display("Coding param: %x", mem_data_byte);
                        gain_shift   <= gain_shift_offset - mem_data_byte[3:0];
                        filter_index <= mem_data_byte[5:4];
                    end

                    if (mem_ack) begin
                        decoder_state <= READ_SAMPLE;
                    end
                end
                READ_SAMPLE: begin
                    if (mem_ack_q) begin
                        if (playback_coding.bps == k8Bps)
                            sample <= 32'(signed'(mem_data_byte)) <<< gain_shift;
                        else
                            sample <= 32'(signed'(mem_data_byte_nibbles[!block_cnt[0]])) <<< gain_shift;

                        data_addr <= data_addr + 4;
                        data_cnt <= data_cnt + 1;
                        decoder_state <= APPLY_FILTER1;
                    end
                end
                APPLY_FILTER1: begin
                    mac <= s_xa_filter_coef[filter_index][0] * old_samples[channel][0];
                    decoder_state <= APPLY_FILTER2;
                end
                APPLY_FILTER2: begin
                    mac <= mac + s_xa_filter_coef[filter_index][1] * old_samples[channel][1];
                    decoder_state <= CALC1;
                end
                CALC1: begin
                    if (!out.write) begin
                        sample <= sample + ((mac + 128) / 256);
                        decoder_state <= CALC2;
                        sample_channel <= channel;
                    end
                end
                CALC2: begin
                    old_samples[sample_channel][1] <= old_samples[sample_channel][0];
                    old_samples[sample_channel][0] <= sample16;
                    out.write <= 1;
                    playback_coding_out <= playback_coding;

                    if (data_cnt == SAMPLES_PER_BLOCK) begin
                        if (block_cnt == last_block_index) begin
                            if (group_cnt == LAST_GROUP_INDEX) begin
                                decoder_state <= IDLE;
                            end else begin
                                block_addr <= block_addr + BLOCK_SIZE;  // group has 128 byte size
                                decoder_state <= EVALHEADER;
                                block_cnt <= 0;
                                group_cnt <= group_cnt + 1;
                            end
                        end else begin
                            block_cnt <= block_cnt + 1;
                            decoder_state <= EVALHEADER;
                        end
                    end else begin
                        decoder_state <= NEXT_SAMPLE;
                    end
                end
                NEXT_SAMPLE: begin
                    if (mem_ack) begin
                        decoder_state <= READ_SAMPLE;
                    end
                end
                CDDA_READ: begin
                    if (mem_ack) begin
                        data_addr <= data_addr + 2;
                        decoder_state <= CDDA_PROCESS;
                    end
                end
                CDDA_PROCESS: begin
                    if (mem_ack_q) begin
                        sample[15:0] <= {mem_data[7:0], mem_data[15:8]};
                        sample_channel <= !data_addr[1];
                        out.write <= 1;
                        playback_coding_out <= playback_coding;
                        decoder_state <= CDDA_WAIT;
                    end
                end
                CDDA_WAIT: begin
                    if (!out.write) begin
                        // TODO Remove magic numbers
                        if (block_addr == 14'h1400 && data_addr == (14'h930 + 14'h1400)) begin
                            decoder_state <= IDLE;
                        end else if (block_addr == 14'h1e00 && data_addr == (14'h930 + 14'h1e00))
                            decoder_state <= IDLE;
                        else begin
                            decoder_state <= CDDA_READ;
                        end
                    end
                end
            endcase
        end
    end
endmodule
