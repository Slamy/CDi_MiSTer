`timescale 1 ns / 1 ns
// CD-Interface Controller
// TODO implement audio

module cdic (
    input clk,
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

    output [31:0] cd_hps_lba,
    output cd_hps_req,
    input cd_hps_ack,
    input cd_hps_data_valid,
    input [15:0] cd_hps_data
);

    // some info is from https://github.com/cdifan/cdichips/blob/master/ims66490cdic.md
    // behaviour is reconstructed from MAME
    // https://github.com/mamedev/mame/blob/master/src/mame/philips/cdicdic.cpp
    // CDIC memory should be from 0x0000 ot 0x3C7F according to the low level test
    // All access must be word aligned according to ims66490cdic.md

    // 16 kB of CDIC memory

    bit [15:0] mem_cpu_readout;
    wire [12:0] mem_cpu_addr = (req && ack) ? dma_control_register[13:1] : address[13:1];
    wire [15:0] mem_cpu_data = din;
    wire mem_cpu_we = address[13:1] <= 13'h1E3F && access && write_strobe && bus_ack;
    wire mem_cd_hps_we = cd_hps_data_valid && sector_word_index >= 6;

    cdic_dual_port_memory mem (
        .clk(clk),
        .data_a(mem_cpu_data),
        .addr_a(mem_cpu_addr),
        .we_a(mem_cpu_we),
        .q_a(mem_cpu_readout),
        .data_b(cd_hps_data),
        .addr_b(cd_data_target_adr),
        .we_b(mem_cd_hps_we),
        .q_b()
    );

`ifdef VERILATOR
    always_ff @(posedge clk) begin
        if (cd_hps_data_valid)
            $display("CDIC CD Data %x %x %d", cd_data_target_adr, cd_hps_data, mem_cd_hps_we);
    end
`endif

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

    // When clocked at 30 MHz and a sector rate of 75 Hz
    // 30e6/75 = 400000
    localparam bit [23:0] kSectorPeriod = 400000;
    // 2352 bytes per sector. Always.
    localparam bit [13:0] kWordsPerSector = 2352 / 2;
    // Simulates the speed of a CD
    bit [23:0] sector_timer  /*verilator public_flat_rd*/ = 0;
    bit [13:0] sector_word_index = 0;
    bit [12:0] cd_data_target_adr = 0;
    bit cd_reading_active = 0;

    always_ff @(posedge clk) begin
        if (reset) begin
            sector_timer <= kSectorPeriod - 1;
        end else if (sector_timer == 0) begin
            sector_timer <= kSectorPeriod - 1;
        end else begin
            sector_timer <= sector_timer - 1;
        end
    end
    assign intreq = x_buffer_register[15] | audio_buffer_register[15];

    assign req = dma_control_register[15];

    always_ff @(posedge clk) begin
        bus_ack <= 0;
        rdy <= 0;

        if (reset) begin
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
        end else begin
            if (cd_hps_ack) cd_hps_req <= 0;

            if (cd_hps_data_valid) begin
                if (sector_word_index == kWordsPerSector - 1) begin
                    x_buffer_register[15] <= 1'b1;
                    //data_buffer_register[14] <= 1'b1;
                    data_buffer_register[0] <= !data_buffer_register[0];
                    cd_hps_lba <= cd_hps_lba + 1;

                    // Reset Mode 1&2 cause reading to stop
                    if (command_register == 16'h23 || command_register == 16'h24)
                        cd_reading_active <= 0;
                end
                sector_word_index <= sector_word_index + 1;

                if (sector_word_index >= 6) begin
                    // cut of the sync pattern
                    cd_data_target_adr <= cd_data_target_adr + 1;
                end
            end

            if (done_in) dma_control_register[15] <= 0;

            if (cd_reading_active && sector_timer == 1) begin
                cd_hps_req <= 1;
                cd_data_target_adr <= data_buffer_register[0] ? 0 : 13'h500;
                sector_word_index <= 0;
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
                    end
                    16'h24: begin
                        $display("CDIC Command: Reset Mode 2");
                        //cd_reading_active <= 1;
                        cd_hps_lba <= time_register_as_lba;
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
                    end
                    16'h2c: $display("CDIC Command: Seek");
                    16'h2a: begin
                        $display("CDIC Command: Read Mode 2");
                        cd_reading_active <= 1;
                        cd_hps_lba <= time_register_as_lba;
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
    bit [15:0] ram[8192];

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

