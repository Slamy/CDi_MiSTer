`include "bus.svh"

// MCD 212 - DRAM and Video
// TODO Remove internal memory which cannot be synthesized. Replace with external bus
// TODO Attach an SDRAM controller

module mcd212 (
    input clk,
    input reset,
    input [22:1] cpu_address,
    input [15:0] cpu_din,
    output bit [15:0] cpu_dout,
    input cpu_uds,
    input cpu_lds,
    input cpu_write_strobe,
    output bit cpu_bus_ack,
    input cs,

    output     [7:0] r,
    output     [7:0] g,
    output     [7:0] b,
    output           hsync,
    output           vsync,
    output bit       hblank,
    output           vblank,

    output bit [24:0] sdram_addr,
    output bit        sdram_rd,
    output bit        sdram_wr,
    output bit        sdram_word,
    output bit [15:0] sdram_din,
    input      [15:0] sdram_dout,
    input             sdram_busy,
    output bit        sdram_burst,
    output bit        sdram_refresh,
    input             sdram_burstdata_valid
);

    // Memory Swapping according to chapter 3.4
    // of MCD212 datasheet.
    bit [3:0] early_rom_cnt = 0;
    wire cs_early_rom = early_rom_cnt < 4;
    always_ff @(posedge clk) begin
        // first 4 memory accesses must be mapped to ROM
        if (reset) begin
            early_rom_cnt <= 0;
        end else if (cs && cpu_uds && cs_early_rom && cpu_bus_ack) begin
            early_rom_cnt <= early_rom_cnt + 1;
        end
    end


    wire [22:0] cpu_addressb = {cpu_address[22:1], 1'b0};
    // implementation of memory map according to MCD212 datasheet
    wire cs_ram = cpu_addressb <= 23'h3fffff && cs && !cs_early_rom;  // 4MB
    wire cs_rom = cpu_addressb >= 23'h400000 && cpu_addressb <= 23'h4ffbff && cs;
    wire cs_system_io = cpu_addressb >= 23'h4ffc00 && cpu_addressb <= 23'h4fffdf && cs;
    wire cs_channel2 = cpu_addressb >= 23'h4fffe0 && cpu_addressb <= 23'h4fffef && cs;
    wire cs_channel1 = cpu_addressb >= 23'h4ffff0 && cpu_addressb <= 23'h4fffff && cs;

    wire cs_rom_fused = (cs_rom || cs_early_rom) && cs;

    // Bit 18 is the Bank selection for TD=0
    // CAS1 if A18=0, CAS2 if A18=1
    // TODO This might be not accurate. Investigation needed
    //wire [19:1] ram_address = {cpu_address[18], cpu_address[21], cpu_address[17:1]};
    wire [19:1] ram_address = {cpu_address[21], cpu_address[18], cpu_address[17:1]};

    bit cs_q = 0;
    bit cpu_lds_q = 0;
    bit cpu_uds_q = 0;
    bit sdram_busy_q = 0;
    bit parity = 0;

    bit [21:0] ica0_adr;
    bit ica0_as;
    bit ica0_bus_ack;

    bit [21:0] file0_adr;
    bit file0_as;
    bit file0_bus_ack;
    bit file0_burstdata_valid;

    wire cpu_sdram_access = (cs_ram || cs_rom_fused) && (cpu_uds || cpu_lds);
    wire sdram_refresh_request;

    typedef enum bit [3:0] {
        REFRESH,  // most important
        VIDEO0,
        VIDEO1,
        CPU       // least important
    } e_arbit_target;

    // must only be changed if sdram_busy == false
    e_arbit_target sdram_owner;
    e_arbit_target sdram_owner_q;
    e_arbit_target sdram_owner_next;

`ifdef VERILATOR
    // add a check to assert that sdram_owner is never changed during memory access
    always_ff @(posedge clk) begin
        if (sdram_busy) assert (sdram_owner_q == sdram_owner);
    end
`endif

    always_comb begin
        sdram_owner_next = CPU;
        if (file0_as || ica0_as) sdram_owner_next = VIDEO0;
        if (sdram_refresh_request) sdram_owner_next = REFRESH;

        if (sdram_busy) sdram_owner = sdram_owner_q;
        else sdram_owner = sdram_owner_next;
    end

    bit video_fail = 0;

    always_comb begin
        cpu_dout = 0;
        sdram_burst = 0;
        sdram_refresh = 0;

        // per default everything is acked but not SDRAM
        cpu_bus_ack = !cpu_sdram_access;
        file0_bus_ack = 0;
        ica0_bus_ack = 0;
        file0_burstdata_valid = 0;

        sdram_rd = 0;
        sdram_wr = 0;
        sdram_word = 0;
        sdram_addr = 0;

        if (!reset) begin
            case (sdram_owner)
                REFRESH: begin
                    // keep reading the same address to force auto refresh
                    sdram_refresh = 1;
                    sdram_rd = !sdram_busy;
                end
                VIDEO0: begin
                    sdram_word = 1;

                    if (ica0_as) begin
                        sdram_addr[19:1] = ica0_adr[19:1];
                        sdram_rd = !sdram_busy && !sdram_busy_q;
                    end

                    if (file0_as) begin
                        sdram_addr[19:1] = file0_adr[19:1];
                        sdram_rd = !sdram_busy && !sdram_busy_q;
                        sdram_burst = 1;
                    end

                end
                CPU: begin
                    if (cpu_sdram_access) begin
                        if (cs_rom_fused) begin
                            sdram_word = 1;
                            sdram_addr[24:1] = {3'b001, cpu_address[21:1]};
                            sdram_addr[0] = 1'b0;
                            sdram_rd = !sdram_busy && !sdram_busy_q;
                            sdram_wr = 1'b0;
                        end else begin
                            sdram_addr[24:1] = {5'b0, ram_address[19:1]};
                            sdram_addr[0] = cpu_write_strobe ? !cpu_lds && cpu_uds : 1'b0;  // only active on odd byte accesses
                            sdram_word = (cpu_lds && cpu_uds) || !cpu_write_strobe;
                            sdram_rd = cs_ram && !cpu_write_strobe && !sdram_busy && !sdram_busy_q;
                            sdram_wr = cs_ram && cpu_write_strobe && !sdram_busy && !sdram_busy_q;
                        end

                    end
                end
                default: begin
                end
            endcase

            case (sdram_owner_q)
                CPU: begin
                    if (cpu_sdram_access) begin
                        cpu_bus_ack = !sdram_busy && sdram_busy_q;
                    end
                end
                VIDEO0: begin
                    if (file0_as) begin
                        file0_bus_ack = !sdram_busy && sdram_busy_q;
                        file0_burstdata_valid = sdram_burstdata_valid;
                    end
                    if (ica0_as) ica0_bus_ack = !sdram_busy && sdram_busy_q;
                end
                default: begin
                end

            endcase
        end
        // only the CPU writes to SDRAM
        sdram_din = cpu_din;

        if (cs_ram || cs_rom_fused) begin
            cpu_dout = sdram_dout;
        end else if (cs_channel1) begin
            case (cpu_addressb[7:0])
                8'hf0: begin
                    cpu_dout = {8'h0, !vblank, 1'b0, parity, 5'b0};
                end
                default: cpu_dout = 16'h0;
            endcase
        end else if (cs_channel2) begin
            case (cpu_addressb[7:0])
                default: cpu_dout = 16'h0;
            endcase
        end
    end

    always_ff @(posedge clk) begin
        if (reset) begin
            cs_q <= 0;
            cpu_uds_q <= 0;
            cpu_lds_q <= 0;
            sdram_busy_q <= 0;
            sdram_owner_q <= CPU;
            video_fail <= 0;
        end else begin
            cs_q <= cs;
            cpu_uds_q <= cpu_uds;
            cpu_lds_q <= cpu_lds;
            sdram_busy_q <= sdram_busy;
            sdram_owner_q <= sdram_owner;

            if (file0_as && ica0_as) video_fail <= 1;
        end

        /*
        if ((cpu_lds || cpu_uds) && cs_ram && !cpu_write_strobe && cpu_bus_ack) 
            $display("Read DRAM %x %x", cpu_addressb, cpu_dout);
        
        if (cpu_lds && cpu_uds && cs_ram && cpu_write_strobe) begin
            $display("Write DRAM %x %x", cpu_addressb, cpu_din);
            assert (!(cpu_addressb==0 && cpu_din ==16'h5aa5));
        end else if (cpu_lds && cs_ram && cpu_write_strobe)
            $display("Write Lower Byte RAM %x %x", cpu_addressb, cpu_din);
        else if (cpu_uds && cs_ram && cpu_write_strobe)
            $display("Write Upper Byte RAM %x %x", cpu_addressb, cpu_din);
        */

        if ((cpu_lds || cpu_uds) && cs_channel1 && cpu_write_strobe)
            $display("Write Channel 1 %x %x", cpu_addressb, cpu_din);

        if ((cpu_lds || cpu_uds) && cs_channel1 && !cpu_write_strobe)
            $display("Read Channel 1 %x %x", cpu_addressb, cpu_dout);

        if ((cpu_lds || cpu_uds) && cs_channel2 && cpu_write_strobe)
            $display("Write Channel 2 %x %x", cpu_addressb, cpu_din);

        if ((cpu_lds || cpu_uds) && cs_channel2 && !cpu_write_strobe)
            $display("Read Channel 2 %x %x", cpu_addressb, cpu_dout);

        if ((cpu_lds || cpu_uds) && cs_system_io && cpu_write_strobe)
            $display("Write Sys %x %x", cpu_addressb, cpu_din);
    end


    bit sm = 0;
    bit cf = 1;
    bit st = 0;
    bit fd = 0;
    bit cm = 0;
    wire [8:0] video_y;
    wire [12:0] video_x;
    wire new_frame  /*verilator public_flat_rd*/;
    wire new_line;
    wire new_pixel;
    bit hblank_vt;
    bit hblank_vt_q;


    // we should have 8-9 refresh cycles per horizontal line
    // to fulfill 8192 refreshes per 64ms 
    assign sdram_refresh_request = video_x < 80;

    video_timing vt (
        .clk,
        .reset,
        .sm(sm),
        .cf(cf),
        .st(st),
        .cm(cm),
        .fd(fd),
        .video_y(video_y),
        .video_x(video_x),
        .hsync(hsync),
        .vsync(vsync),
        .hblank(hblank_vt),
        .vblank(vblank),
        .new_frame(new_frame),
        .new_line(new_line),
        .new_pixel(new_pixel)
    );


    struct packed {
        bit de;
        bit cf;
        bit fd;
        bit sm;
        bit cm1;
        bit reserved1;
        bit ic1;
        bit dc1;
        bit [1:0] reserved2;
        bit [5:0] adr;
    } command_register_dcr1;

    always_ff @(posedge clk) begin
        if (reset) begin
            command_register_dcr1 <= 0;
        end else begin
            if ((cpu_lds || cpu_uds) && cs_channel1 && cpu_write_strobe) begin
                if (cpu_addressb[3:0] == 4'h2) begin
                    command_register_dcr1 <= cpu_din;
                end
            end
        end
    end

    typedef struct packed {
        bit [5:0] r;
        bit [5:0] g;
        bit [5:0] b;
    } clut_entry;

    typedef struct packed {
        bit [3:0] op;
        bit rf;
        bit [5:0] wf;
        bit [9:0] x;
    } region_entry;

    region_entry region_control[8];

    clut_entry clut[256];
    clut_entry trans_color_plane_a;
    clut_entry trans_color_plane_b;
    clut_entry mask_color_plane_a;
    clut_entry mask_color_plane_b;
    clut_entry clut_out;


    wire ica0_reset = new_frame;
    wire [15:0] ica0_din = sdram_dout;

    bit [6:0] register_adr;
    bit [23:0] register_data;
    bit register_write;

    bit ica0_reload_vsr;
    bit [21:0] ica0_vsr;


    ica_dca_ctrl ica0 (
        .clk,
        .reset(ica0_reset || reset || !command_register_dcr1.ic1),
        .address(ica0_adr),
        .as(ica0_as),
        .din(ica0_din),
        .bus_ack(ica0_bus_ack),
        .register_adr(register_adr),
        .register_data(register_data),
        .register_write(register_write),
        .reload_vsr(ica0_reload_vsr),
        .vsr(ica0_vsr)
    );


    wire [15:0] file0_din = sdram_dout;
    always_ff @(posedge clk) begin
        if (reset) begin
            hblank_vt_q <= 0;
            hblank <= 0;
            parity <= 0;
        end else begin
            hblank_vt_q <= hblank_vt;
            hblank <= hblank_vt_q;

            // TODO Remove this
            if (new_frame) parity <= !parity;
        end

    end

    pixelstream file0out (.clk);

    display_file_decoder file0 (
        .clk,
        .reset(ica0_reset || reset || !command_register_dcr1.ic1),
        .address(file0_adr),
        .as(file0_as),
        .din(file0_din),
        .bus_ack(file0_bus_ack),
        .reload_vsr(ica0_reload_vsr),
        .burstdata_valid(file0_burstdata_valid),
        .vsr_in(ica0_vsr),
        .out(file0out),
        .read_pixels(!vblank)
    );

    pixelstream rle0out (.clk);

    clut_rle rle (
        .clk,
        .reset(vblank || reset),
        .src  (file0out),
        .dst  (rle0out)
    );
    assign rle0out.strobe = new_pixel;

    bit [7:0] synchronized_pixel;
    bit fail = 0;

    always_ff @(posedge clk) begin
        if (reset) fail <= 0;
        else if (new_pixel && !rle0out.write) fail <= 1;

        if (new_line) synchronized_pixel <= 0;
        else if (rle0out.write && rle0out.strobe) synchronized_pixel <= rle0out.pixel;

        clut_out <= clut[synchronized_pixel];
    end

    assign r = {clut_out.r, 2'b00};
    assign g = {clut_out.g, 2'b00};
    assign b = {clut_out.b, 2'b00};

    always_ff @(posedge clk) begin
        if (ica0_reload_vsr) $display("Reload VSR %x", ica0_vsr);
    end

    bit [15:0] cursor[16];

    bit [1:0] clut_bank;
    bit [9:0] cursor_x;
    bit [9:0] cursor_y;

    always_ff @(posedge clk) begin
        if (register_write) begin
            case (register_adr)
                7'h40: begin
                    // Image Coding Method
                    $display("Coding %b %b", register_data[11:8], register_data[3:0]);
                end
                7'h41: begin
                    // Transparency Control
                end
                7'h42: begin
                    // Plane Order
                end
                7'h43: begin
                    // CLUT Bank
                    clut_bank <= register_data[1:0];
                end
                7'h44: begin
                    trans_color_plane_a <= {
                        register_data[23:18], register_data[15:10], register_data[7:2]
                    };
                end
                7'h46: begin
                    trans_color_plane_b <= {
                        register_data[23:18], register_data[15:10], register_data[7:2]
                    };
                end
                7'h47: begin
                    mask_color_plane_a <= {
                        register_data[23:18], register_data[15:10], register_data[7:2]
                    };
                end
                7'h49: begin
                    mask_color_plane_b <= {
                        register_data[23:18], register_data[15:10], register_data[7:2]
                    };
                end
                7'h4a: begin
                    // DYUV Abs. Start Value for Plane A
                end
                7'h4b: begin
                    // DYUV Abs. Start Value for Plane B
                end
                7'h4d: begin
                    // Cursor Position
                    cursor_x <= register_data[9:0];
                    cursor_y <= register_data[21:12];
                end
                7'h4e: begin
                    // Cursor Control
                end

                7'h4f: begin
                    // Cursor Pattern
                    cursor[register_data[19:16]] <= register_data[15:0];

                    // $display("Cursor %x %b", register_data[19:16], register_data[15:0]);
                end

                7'h58: begin
                    // Backdrop Color
                end
                7'h59: begin
                    // Mosaic Pixel Hold for Plane A
                end
                7'h5b: begin
                    // Weight Factor for Plane A
                end
                default: begin
                    /*
                    if (register_adr >= 7'h40) begin
                        $display("Ignored %x", register_adr);
                    end
                    */
                end
            endcase

            if (register_adr[6:3] == 4'b1010) begin
                //$display("Region %d %b", register_adr[2:0], register_data);
                region_control[register_adr[2:0]] <= {register_data[23:20], register_data[16:0]};
            end

            if (register_adr <= 7'h3f) begin
                // CLUT Color 0 to 63
                /*
                $display("CLUT  %d  %d %d %d", {clut_bank, register_adr[5:0]},
                         register_data[23:18], register_data[15:10], register_data[7:2]);
                         */
                clut[{
                    clut_bank, register_adr[5:0]
                }] <= {
                    register_data[23:18], register_data[15:10], register_data[7:2]
                };
            end
        end
    end

endmodule

