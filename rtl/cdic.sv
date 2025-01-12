`timescale 1 ns / 1 ns
// CD-Interface Controller

`include "bus.svh"
`include "audiotypes.svh"

`define dp_hps_data(statement) `ifdef DEBUG_HPS_DATA $display``statement `endif
`define dp_dma_write(statement) `ifdef DEBUG_CDIC_DMA $display``statement `endif

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
    output bit cd_hps_req,
    input cd_hps_ack,
    input cd_hps_data_valid,
    input [15:0] cd_hps_data,

    output signed [15:0] audio_left,
    output signed [15:0] audio_right,

    output bit fail_not_enough_words,
    output bit fail_too_much_data
);

    // Used to detect edges of cd_hps_ack
    bit cd_hps_ack_q;

    // Sometimes when performing a seek, the MiSTer main doesn't deliver
    // a CD sector for multiple sector times.
    // As long as this is bit is set, the data must not be processed.
    // This is "Free seeking time emulation" as long
    // as this only occurs during seeking
    wire hps_transaction_in_progress = cd_hps_req || cd_hps_ack;

    // Register set according to MAME and
    // https://github.com/cdifan/cdichips/blob/master/ims66490cdic.md
    // Together with some observations from MAME

    // MODE2 Channel Audio Mask
    // If not matching, sector is ignored
    // No IRQs are generated for ignored sectors
    bit [31:0] channel_register = 0;

    // MODE2 Channel Audio Mask
    // If matching, disables audiomap and plays sector
    // directly without waiting for CPU?
    // The data is delivered to one of the ADPCM buffers?
    bit [15:0] audio_channel_register = 0;

    bit [15:0] command_register = 0;

    // Bit 0 is toggled on every received sector
    // Bit 2 is reset on data sector
    // Bit 2 is set on audio sector
    // Bit 14 is set on every received sector
    // Bit 15 starts the CD reading and parses command register
    // Resetting Bit 14 stops CD reading
    // Buffer of the stored sector is visible here
    // Setting bit 15 seems to reset all other bits
    // 000 0x0000 = 0 * 0xA00
    // 001 0x0A00 = 1 * 0xA00
    // 100 0x2800 = 4 * 0xA00
    // 101 0x3200 = 5 * 0xA00
    bit [15:0] data_buffer_register = 0;

    // Bit 15 causes IRQ
    // Bit 15 is set when a sector is stored
    // in either data or ADPCM buffer
    // Reading register clears bit 15 after the read
    // The CPU still gets the set bit
    bit [15:0] x_buffer_register = 0;

    // Bit 15 causes IRQ
    // Bit 15 is set when an audio buffer was played
    // Reading register clears bit 15 after the read
    // The CPU still gets the set bit
    bit [15:0] audio_buffer_register = 0;

    // Interrupt vector to present to the M68k CPU
    bit [15:0] interrupt_vector_register = 0;

    // Bit 15 activates DMA transfer
    // Bit 14 ??? has no use?
    // Bits 13:0 are the current address in CDIC memory according to MAME
    bit [15:0] dma_control_register = 0;

    // Bit 0 toggles on every read when no audio is played? 
    // The toggled result is the one returned
    // to the CPU?
    // Resetting bit 13 stops audio map playback?
    // Setting bit 13 starts audio map playback?
    // This is also the address for playback of audio
    bit [15:0] audio_control_register = 0;  // called Z buffer in MAME?

    // Matching value for File in MODE2 header
    // If the file is not matching, the sector will be ignored
    bit [15:0] file_register = 0;

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
    wire sample_tick44  /*verilator public_flat_rd*/;
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

    // CDIC memory write caused by DMA Access
    wire mem_dma_we = (dtc && ack && !write_strobe);

    // CDIC memory write caused by normal CPU instructions
    wire mem_cpu_we = (address[13:1] <= 13'h1E3F && access && write_strobe && bus_ack);

    // Cut off the sync pattern by starting with the sixth word
    // A real CDIC also does that
    // Also cut of the time code to later insert that. The driver seems
    // to be unhappy when it is presented too early.
    // TODO This is not yet confirmed
    wire mem_cd_hps_we = cd_hps_data_valid && (sector_word_index >= 8 || read_cdda) && use_sector_data;

    wire [15:0] mem_cdic_readout;
    bit [15:0] mem_cdic_data;
    bit [12:0] mem_cdic_addr;
    bit mem_cdic_we;

    cdic_dual_port_memory mem (
        .clk(clk),

        // CPU side interface
        .data_a(mem_cpu_data),
        .addr_a(mem_cpu_addr),
        .we_a(mem_cpu_we || mem_dma_we),
        .q_a(mem_cpu_readout),

        // CDIC side interface
        .data_b(mem_cdic_data),
        .addr_b(mem_cdic_addr),
        .we_b(mem_cdic_we),
        .q_b(mem_cdic_readout)
    );

    // Flag is set after a full sector is received
    // which had audio data and matching audio channel and
    // needs to be played back now
    bit cd_audio_start_playback;

    // Address of CD sector to play back
    // Should be 13'h1900 or 13'h1400
    // Can be either an audiomap or coming directly from CD
    bit [12:0] audio_playback_addr;

    bit [12:0] mem_cd_audio_addr;  // Address for CDIC memory
    bit mem_cd_audio_rd;
    bit mem_cd_audio_ack;
    bit mem_cd_audio_ack_q;

    header_submode_s header_submode;
    header_coding_s header_coding;
    bit channel_match;
    bit audio_channel_match;
    bit file_match;
    bit header_mode2;
    bit read_mode2;
    bit read_cdda;

    bit [15:0] header_timecode1;  // For inserting the timecode after reception
    bit [15:0] header_timecode2;  // For inserting the timecode after reception

    wire signed [15:0] adpcm_left  /*verilator public_flat_rd*/;
    wire signed [15:0] adpcm_right  /*verilator public_flat_rd*/;

    assign audio_left  = adpcm_left;
    assign audio_right = adpcm_right;

    wire audiomap_active;
    bit adpcm_enable_audiomap;  // Flag when audio_control_register[13] is set
    bit adpcm_disable_audiomap;  // Flag when audio_control_register[13] is reset
    wire audiomap_finished_playback;

    header_coding_s cd_audio_coding;
    audioplayer adpcm (
        .clk(clk),
        .sample_tick37,
        .sample_tick44,
        .audio_tick(sector_tick),
        .reset(reset),
        .mem_addr(mem_cd_audio_addr),
        .mem_data(mem_cdic_readout),
        .mem_rd(mem_cd_audio_rd),
        .mem_ack(mem_cd_audio_ack),
        .mem_ack_q(mem_cd_audio_ack_q),

        .cd_audio_coding(cd_audio_coding),
        .start_playback(cd_audio_start_playback),
        .enable_audiomap(adpcm_enable_audiomap),
        .disable_audiomap(adpcm_disable_audiomap),
        .playback_addr(audio_playback_addr),
        .audiomap_active(audiomap_active),
        .audiomap_finished_playback(audiomap_finished_playback),

        .audio_left (adpcm_left),
        .audio_right(adpcm_right)
    );

    bit cd_hps_data_valid_q;
    bit cd_hps_data_valid_q2;
    bit data_target_buffer;
    bit audio_target_buffer;

    always_comb begin
`ifdef VERILATOR
        audio_playback_addr = 0;  // better visibility in waveform
`else
        audio_playback_addr = audio_control_register[13:1];  // optimize LUTs
`endif

        if (adpcm_enable_audiomap) audio_playback_addr = audio_control_register[13:1];

        // CD Audio Playback
        if (cd_audio_start_playback) begin
            if (header_mode2) begin
                audio_playback_addr = !audio_target_buffer ? 13'h1900 : 13'h1400;
                $display("ADPCM at %x", {audio_playback_addr, 1'b0});
            end else begin
                assert (read_cdda);
                // CDDA is located in the data buffers
                audio_playback_addr = data_target_buffer ? 13'h0500 : 13'h0000;
                $display("CDDA at %x", {audio_playback_addr, 1'b0});
            end
        end
    end

    bit reset_write_timecode1;
    bit reset_write_timecode2;
    bit write_timecode1 = 0;
    bit write_timecode2 = 0;

    always_comb begin
        reset_write_timecode1 = 0;
        reset_write_timecode2 = 0;

        mem_cdic_addr = cd_data_target_adr;
        mem_cdic_we = mem_cd_hps_we;
        mem_cdic_data = cd_hps_data;
        mem_cd_audio_ack = 0;

        if (mem_cd_hps_we) begin
            // Highest priority is to write incoming CD data into memory
        end else if (write_timecode1) begin
            reset_write_timecode1 = 1;
            mem_cdic_addr = data_target_buffer ? 0 : 13'h500;
            mem_cdic_we = 1;
            mem_cdic_data = header_timecode1;
        end else if (write_timecode2) begin
            reset_write_timecode2 = 1;
            mem_cdic_addr = data_target_buffer ? 1 : 13'h501;
            mem_cdic_we = 1;
            mem_cdic_data = header_timecode2;
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
    wire access = cs && (uds || lds);

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

        // The highest bit of the fraction is usually never set as
        // it ends with BCD 0x74 before the next second
        // However, it causes the fraction to be nullified
        // This feature is used by the Seek command
        if (time_register.frac_upper_digit[3]) frac = 0;

        time_register_as_lba = ((mins * 60) + secs) * 75 + frac;
    end

    // Subcode Q data is added at the end of the raw sector data
    localparam bit [14:0] kWordsPerSubcodeFrame = 12;

    // 2352 bytes per sector. Always.
    localparam bit [14:0] kCdSectorSize = 2352;

    // Total number of words, the CDIC will provide per requested sector
    localparam bit [14:0] kWordsPerSector = kWordsPerSubcodeFrame + kCdSectorSize / 2;

    // Index of word in CD sector. Useful for selecting specific words
    bit [14:0] sector_word_index = 0;

    // Current write address for RAM to store CD data
    bit [12:0] cd_data_target_adr = 0;

    // CD is spinning and we are reading data
    // HPS will be advised to give data as long as this is set
    bit cd_reading_active = 0;

    // Number of sectors to wait until requesting the first
    // after the reading was instructed to start.
    localparam bit [5:0] kSeekTime = 1;

    // Simulates reading time. Remaining sectors to wait.
    bit [5:0] start_cd_reading_cnt = 0;

    // Reset if MODE2 filters decided to skip the current sector
    // Set on every start of a sector
    bit use_sector_data = 0;

`ifdef VERILATOR
    always_ff @(posedge clk) begin
        if (cd_hps_data_valid && use_sector_data)
            `dp_hps_data(("CDIC CD Data %x %d %x WE:%d", {cd_data_target_adr, 1'b0
                         }, sector_word_index, cd_hps_data, mem_cd_hps_we));

        if (mem_dma_we) begin
            `dp_dma_write(("DMA Write %x %x", {mem_cpu_addr, 1'b0}, mem_cpu_data));
        end
    end
`endif

    assign intreq = x_buffer_register[15] | audio_buffer_register[15];
    assign req = dma_control_register[15];

    localparam kSectorHeader_Mode = 15 / 2;  // Low Byte

    localparam kSectorHeader_File = 16 / 2;  // High Byte
    localparam kSectorHeader_Channel = 17 / 2;  // Low Byte

    localparam kSectorHeader_Submode = 18 / 2;  // High Byte
    localparam kSectorHeader_Coding = 19 / 2;  // Low Byte

    always_ff @(posedge clk) begin
        bus_ack <= 0;
        rdy <= 0;
        cd_audio_start_playback <= 0;
        cd_hps_data_valid_q2 <= cd_hps_data_valid_q;
        cd_hps_data_valid_q <= cd_hps_data_valid;
        cd_hps_ack_q <= cd_hps_ack;

        adpcm_enable_audiomap <= 0;
        adpcm_disable_audiomap <= 0;

        if (reset_write_timecode1) write_timecode1 <= 0;
        if (reset_write_timecode2) write_timecode2 <= 0;

        if (reset) begin
            start_cd_reading_cnt <= 0;
            data_target_buffer <= 0;
            audio_target_buffer <= 0;
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
            use_sector_data <= 0;
            header_coding <= 0;
            cd_hps_lba <= 0;
            cd_hps_req <= 0;
            cd_data_target_adr <= 0;
            file_match <= 0;
            audio_channel_match <= 0;
            channel_match <= 0;
            header_mode2 <= 0;
            read_mode2 <= 0;
            fail_not_enough_words <= 0;
            fail_too_much_data <= 0;
            write_timecode1 <= 0;
            write_timecode2 <= 0;
        end else begin

            if (cd_hps_ack) cd_hps_req <= 0;

            if (mem_cd_hps_we) begin
                cd_data_target_adr <= cd_data_target_adr + 1;
            end

            if (cd_hps_ack_q && !cd_hps_ack && cd_reading_active) begin
                $display("Sector written to RAM / has ended");
                //Get next sector
                cd_hps_lba <= cd_hps_lba + 1;
                write_timecode1 <= !read_cdda;
                write_timecode2 <= !read_cdda;
            end

            if (cd_hps_data_valid && cd_reading_active) begin
                sector_word_index <= sector_word_index + 1;

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
                        channel_match <= channel_register[cd_hps_data[4:0]];

                        $display("File Match ? %x %x", file_register[15:8], cd_hps_data[15:8]);
                        $display("Channel match %b %b bit %d", audio_channel_register,
                                 channel_register, cd_hps_data[3:0]);
                    end

                end

                if (sector_word_index == 6) begin
                    // Time Code 1
                    header_timecode1 <= cd_hps_data;
                end
                if (sector_word_index == 7) begin
                    // Time Code 2 and Mode
                    header_timecode2 <= cd_hps_data;
                end
            end

            if (cd_hps_data_valid_q) begin
                if (sector_word_index == 10) begin
                    // Inspired by cdicdic_device::is_mode2_sector_selected(const uint8_t *buffer)
                    // Only apply the filter if MODE2 is used
                    // MODE1 is always let through
                    if (header_mode2) begin
                        if (file_match) begin
                            if (header_submode.eof || header_submode.trig || header_submode.eor) begin
                                // Don't analyze the sub mode or the channel mask.
                                // Just accept this sector.
                            end else if (header_submode.data || header_submode.audio || header_submode.video) begin
                                // This sector has applicable data
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


            if (cd_hps_data_valid_q2) begin
                if (header_mode2 && use_sector_data && audio_channel_match && sector_word_index == 10 && header_submode.audio) begin
`ifdef VERILATOR
                    $display("Switching to ADPCM Buffer %x : %s %s %s", header_coding,
                             header_coding.bps.name(), header_coding.rate.name(),
                             header_coding.chan.name());
`endif

                    $display("Use sector %x %x %x for audio", header_timecode1[15:8],
                             header_timecode1[7:0], header_timecode2[15:8]);

                    // For audio sectors, move forward 0x1400 words
                    // DATA 0x0000 turns to ADPCM 0x2800
                    // DATA 0x0a00 turns to ADPCM 0x3200
                    // At least this is how MAME does it but cannot be build in hardware
                    // because the sector interval might lead to the currently played sector
                    // being overwritten.
                    // We are applying a hack here:
                    // The second coding pair is provided at 0x280X/0x320X as
                    // checked by the driver code.
                    // This is actually required to make the intros
                    // of "Zelda's Adventure" and "Hotel Mario" work
                    // as the driver reads the coding values
                    cd_data_target_adr <= cd_data_target_adr + 13'h1400;

                    // The current coding is stored here to avoid dependency
                    // onto the buffers whose location are now optimized
                    // for CPU readout. The ADPCM buffers are no longer
                    // tied to the buffer position from CPU view
                    cd_audio_coding <= header_coding;
                end else if (use_sector_data && sector_word_index == 10 && !read_cdda) begin
                    $display("Use sector %x %x %x for data in buffer %x", header_timecode1[15:8],
                             header_timecode1[7:0], header_timecode2[15:8], {
                             cd_data_target_adr[12:3], 4'b0});
                end

                if (header_mode2 && use_sector_data && audio_channel_match && sector_word_index == 12 && header_submode.audio) begin
                    $display("Select actual ADPCM buffer");

                    // This is a hack to simulate bank switching!
                    // The driver code never reads the data which is fed to the ADPCM
                    // buffers using the audio channel mask.
                    // We use this method to avoid the currently playing buffer to be
                    // overwritten.
                    cd_data_target_adr  <= audio_target_buffer ? 13'h1906 : 13'h1406;
                    audio_target_buffer <= !audio_target_buffer;
                end
            end

            // Audio map finished? Cause an IRQ to inform the CPU
            if (audiomap_finished_playback) audio_buffer_register[15] <= 1;

            if (done_in) dma_control_register[15] <= 0;

            if (sector_tick) begin
                if (!hps_transaction_in_progress) sector_word_index <= 0;

                // Simulate seeking time
                if (start_cd_reading_cnt != 0) begin
                    if (start_cd_reading_cnt == 1) cd_reading_active <= 1;
                    start_cd_reading_cnt <= start_cd_reading_cnt - 1;
                end
            end

            if (cd_reading_active && sector_tick && !hps_transaction_in_progress) begin
                // Use the same sector buffer again if the current one was filtered out
                // MAME does that too and it makes sense.
                // Offset 2 for skipping Time Code, which is inserted later
                if (read_cdda) cd_data_target_adr <= data_target_buffer ? 0 : 13'h0500;
                else cd_data_target_adr <= data_target_buffer ? 2 : 13'h0502;

                // With a real CD, it takes one sector to read one sector.
                // This is not the case here as the CD emulator should be
                // faster, so we wait until the next sector tick until evaluating it.
                if (use_sector_data) begin
                    assert (sector_word_index == kWordsPerSector);
                    if (sector_word_index < kWordsPerSector) fail_not_enough_words <= 1;
                    if (sector_word_index > kWordsPerSector) fail_too_much_data <= 1;

                    // Now that we use this sector, select the other buffer one for the next
                    // Offset 2 for skipping Time Code
                    if (read_cdda) cd_data_target_adr <= !data_target_buffer ? 0 : 13'h0500;
                    else cd_data_target_adr <= !data_target_buffer ? 2 : 13'h0502;

                    // Bit 0 is toggled on every received sector which
                    // indicates to the CPU which buffer was refreshed
                    // with new data.
                    // For some reason, the driver wants the first
                    // sector to have the bit set.
                    // TODO Can this be confirmed?
                    data_target_buffer <= !data_target_buffer;
                    data_buffer_register[0] <= !data_target_buffer;

                    if (read_cdda) begin
                        $display("Audio Sector delivery ended at %x", {cd_data_target_adr, 1'b0});
                    end else begin
                        $display(
                            "Sector %x %x %x delivery ended at %x. Cause IRQ. Buffer bit set to %d. %s",
                            header_timecode1[15:8], header_timecode1[7:0], header_timecode2[15:8],
                            {cd_data_target_adr, 1'b0}, !data_target_buffer,
                            (header_submode.audio && audio_channel_match) ? "Audio" : "Data");
                    end
                    // Bit 2 is reset on data sector
                    // Bit 2 is set on audio sector
                    data_buffer_register[2] <= header_submode.audio && audio_channel_match && header_mode2;

                    // Bit 14 is set on every received sector
                    data_buffer_register[14] <= 1'b1;

                    // Bit 15 is set when a sector is stored
                    // This causes an IRQ to occur
                    x_buffer_register[15] <= 1'b1;

                    // Reset Mode 1&2 cause reading to stop after reading
                    // a sector
                    if (command_register == 16'h23 || command_register == 16'h24)
                        cd_reading_active <= 0;

                    if (header_submode.audio && audio_channel_match && header_mode2) begin
                        cd_audio_start_playback <= 1;
                    end

                    if (read_cdda) begin
                        cd_audio_start_playback <= 1;
                        cd_audio_coding.rate <= k44Khz;
                        cd_audio_coding.bps <= k16Bps;
                        cd_audio_coding.chan <= kStereo;
                    end
                end

                // Request the next sector from HPS if the last one
                // is fully received
                cd_hps_req <= 1;
                use_sector_data <= 1;
            end

            if (data_buffer_register[15]) begin
                x_buffer_register[15] <= 1'b0;
                // as soon as bit 15 is set, the command is parsed and must be reset directly afterwards
                data_buffer_register[15] <= 0;

                read_mode2 <= 0;
                read_cdda <= 0;

                case (command_register)
                    16'h23: begin
                        $display("CDIC Command: Reset Mode 1");
                        cd_hps_lba <= time_register_as_lba;
                        read_mode2 <= 0;
                    end
                    16'h24: begin
                        $display("CDIC Command: Reset Mode 2");
                        cd_hps_lba <= time_register_as_lba;
                        read_mode2 <= 1;
                    end
                    16'h2b: begin
                        $display("CDIC Command: Stop CDDA");
                        cd_reading_active <= 0;
                    end
                    16'h2e: begin
                        $display("CDIC Command: Update");
                        // Just ignore that? MAME does so too...
                    end
                    16'h27: begin
                        $display("CDIC Command: Fetch TOC");
                        start_cd_reading_cnt <= kSeekTime;
                        cd_hps_lba <= time_register_as_lba;
                        read_mode2 <= 1;
                        // TODO Experimental just to deliver anything at all
                    end
                    16'h28: begin
                        $display("CDIC Command: Play CDDA");
                        cd_hps_lba <= time_register_as_lba;
                        start_cd_reading_cnt <= kSeekTime;
                        read_cdda <= 1;
                    end
                    16'h29: begin
                        $display("CDIC Command: Read Mode 1");
                        start_cd_reading_cnt <= kSeekTime;
                        cd_hps_lba <= time_register_as_lba;
                        read_mode2 <= 0;
                    end
                    16'h2c: begin
                        $display("CDIC Command: Seek");
                        // MAME and cdiemu implement seek as Read Mode 1
                        start_cd_reading_cnt <= kSeekTime;
                        cd_hps_lba <= time_register_as_lba;
                        read_mode2 <= 0;
                    end
                    16'h2a: begin
                        $display("CDIC Command: Read Mode 2");
                        start_cd_reading_cnt <= kSeekTime;
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
                    $display("CDIC Read RAM %x %x", {address[13:1], 1'b0}, dout);
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

                /*
                if (!write_strobe && address[13:1] == 13'h1FFD) begin
                    // Reading the Audio Control Register toggles the highest bit
                    audio_control_register[15] <= !audio_control_register[15];
                    // but for the moment of reading it has to still be 1
                end
                */
            end

            if (access) begin
                bus_ack <= !bus_ack;

                // Indicate an inactive audiomap by toggling the lowest bit on read.
                // Do it with !bus_ack to ensure we are reading
                // the already toggled state.
                if (!write_strobe && !bus_ack) begin
                    if (!audiomap_active && address[13:1] == 13'h1FFD)
                        audio_control_register[0] <= !audio_control_register[0];
                end

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

                            adpcm_enable_audiomap  <= din[13];
                            adpcm_disable_audiomap <= !din[13];
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
                                data_target_buffer <= 0;
                                use_sector_data <= 0;
                                sector_word_index <= 0;
                                start_cd_reading_cnt <= 0;
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

