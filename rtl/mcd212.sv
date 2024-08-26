`include "bus.svh"


typedef struct packed {
    bit [5:0] r;
    bit [5:0] g;
    bit [5:0] b;
} clut_entry;

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

    output bit [7:0] r,
    output bit [7:0] g,
    output bit [7:0] b,
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

    bit sdram_busy_q = 0;
    bit parity = 0;

    bit [21:0] ica0_adr;
    bit ica0_as;
    bit ica0_bus_ack;

    bit [21:0] file0_adr;
    bit file0_as;
    bit file0_bus_ack;
    bit file0_burstdata_valid;

    bit [21:0] ica1_adr;
    bit ica1_as;
    bit ica1_bus_ack;

    bit [21:0] file1_adr;
    bit file1_as;
    bit file1_bus_ack;
    bit file1_burstdata_valid;

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
        if (file1_as || ica1_as) sdram_owner_next = VIDEO1;
        if (sdram_refresh_request) sdram_owner_next = REFRESH;

        if (sdram_busy) sdram_owner = sdram_owner_q;
        else sdram_owner = sdram_owner_next;
    end

    bit video_fail = 0;

    struct packed {
        bit [7:0] reserved3;
        bit da;  // display active
        bit reserved2;
        bit pa;  // parity, 1 odd, 0 even frame
        bit [4:0] reserved1;
    } status_register1;

    always_comb begin
        status_register1 = 0;
        // TODO This might not be accurate
        status_register1.da = video_y == 0;
        status_register1.pa = parity;
    end

    always_comb begin
        cpu_dout = 0;
        sdram_burst = 0;
        sdram_refresh = 0;

        // per default everything is acked but not SDRAM
        cpu_bus_ack = !cpu_sdram_access;
        file0_bus_ack = 0;
        ica0_bus_ack = 0;
        file0_burstdata_valid = 0;

        file1_bus_ack = 0;
        ica1_bus_ack = 0;
        file1_burstdata_valid = 0;

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
                VIDEO1: begin
                    sdram_word = 1;

                    if (ica1_as) begin
                        sdram_addr[18:1] = ica1_adr[18:1];
                        sdram_addr[19] = 1;  // TODO
                        sdram_rd = !sdram_busy && !sdram_busy_q;
                    end

                    if (file1_as) begin
                        sdram_addr[18:1] = file1_adr[18:1];
                        sdram_addr[19] = 1;  // TODO
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
                VIDEO1: begin
                    if (file1_as) begin
                        file1_bus_ack = !sdram_busy && sdram_busy_q;
                        file1_burstdata_valid = sdram_burstdata_valid;
                    end
                    if (ica1_as) ica1_bus_ack = !sdram_busy && sdram_busy_q;
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
                    cpu_dout = status_register1;
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
            sdram_busy_q <= 0;
            sdram_owner_q <= CPU;
            video_fail <= 0;
        end else begin
            sdram_busy_q  <= sdram_busy;
            sdram_owner_q <= sdram_owner;

            if (file0_as && ica0_as) video_fail <= 1;
            if (file1_as && ica1_as) video_fail <= 1;

            // Ensure ICA list has ended before FILE access
            assert (!(file0_as && ica0_as));
            assert (!(file1_as && ica1_as));
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


        if ((cpu_lds || cpu_uds) && cs_channel1 && !cpu_write_strobe)
            $display("Read Channel 1 %x %x", cpu_addressb, cpu_dout);

        if ((cpu_lds || cpu_uds) && cs_channel2 && !cpu_write_strobe)
            $display("Read Channel 2 %x %x", cpu_addressb, cpu_dout);

        if ((cpu_lds || cpu_uds) && cs_system_io && cpu_write_strobe)
            $display("Write Sys %x %x", cpu_addressb, cpu_din);
        */

        if ((cpu_lds || cpu_uds) && cs_channel1 && cpu_write_strobe)
            $display("Write Channel 1 %x %x", cpu_addressb, cpu_din);

        if ((cpu_lds || cpu_uds) && cs_channel2 && cpu_write_strobe)
            $display("Write Channel 2 %x %x", cpu_addressb, cpu_din);
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
    wire new_pixel_lores;
    wire new_pixel_hires;
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
        .new_pixel(new_pixel),
        .new_pixel_lores(new_pixel_lores),
        .new_pixel_hires(new_pixel_hires)
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
    } command_register_dcr1  /*verilator public_flat_rw*/;

    struct packed {
        bit [3:0] reserved1;
        bit cm2;
        bit reserved2;
        bit ic2;
        bit dc2;
        bit [1:0] reserved3;
        bit [5:0] adr;
    } command_register_dcr2;


    always_ff @(posedge clk) begin
        if (reset) begin
            command_register_dcr1 <= 0;
            command_register_dcr2 <= 0;
        end else begin
            if ((cpu_lds || cpu_uds) && cs_channel1 && cpu_write_strobe) begin
                if (cpu_addressb[3:0] == 4'h2) begin
                    command_register_dcr1 <= cpu_din;
                end
            end

            if ((cpu_lds || cpu_uds) && cs_channel2 && cpu_write_strobe) begin
                if (cpu_addressb[3:0] == 4'h2) begin
                    command_register_dcr2 <= cpu_din;
                end
            end
        end
    end


    typedef struct packed {
        bit [3:0] op;
        bit rf;
        bit [5:0] wf;
        bit [9:0] x;
    } region_entry;

    region_entry region_control[8];


    clut_entry clut_out0;
    clut_entry clut_out1;

    clut_entry clut_wr_data0;
    clut_entry clut_wr_data1;
    bit [7:0] clut_wr_addr0;
    bit [7:0] clut_wr_addr1;

    bit [7:0] clut_addr0;
    bit [7:0] clut_addr1;
    bit clut_we0;
    bit clut_we1;

    clut_dual_port_memory clutmem (
        .clk(clk),
        .data_a(clut_wr_data0),
        .data_b(clut_wr_data1),
        .addr_a(clut_addr0),
        .addr_b(clut_addr1),
        .we_a(clut_we0),
        .we_b(clut_we1),
        .q_a(clut_out0),
        .q_b(clut_out1)
    );

    clut_entry trans_color_plane_a;
    clut_entry trans_color_plane_b;
    clut_entry mask_color_plane_a;
    clut_entry mask_color_plane_b;

    wire [15:0] ica0_din = sdram_dout;
    wire [15:0] ica1_din = sdram_dout;

    bit [6:0] ch0_register_adr;
    bit [23:0] ch0_register_data;
    bit ch0_register_write;

    bit ica0_reload_vsr;
    bit [21:0] ica0_vsr;

    bit [6:0] ch1_register_adr;
    bit [23:0] ch1_register_data;
    bit ch1_register_write;

    bit ica1_reload_vsr;
    bit [21:0] ica1_vsr;

    ica_dca_ctrl #(
        .odd_ica_start (22'h400),
        .even_ica_start(22'h404)
    ) ica0 (
        .clk,
        .reset(new_frame || reset || !command_register_dcr1.ic1),
        .address(ica0_adr),
        .as(ica0_as),
        .din(ica0_din),
        .bus_ack(ica0_bus_ack),
        .register_adr(ch0_register_adr),
        .register_data(ch0_register_data),
        .register_write(ch0_register_write),
        .reload_vsr(ica0_reload_vsr),
        .vsr(ica0_vsr)
    );

    ica_dca_ctrl #(
        .odd_ica_start (22'h200400),
        .even_ica_start(22'h200404)
    ) ica1 (
        .clk,
        .reset(new_frame || reset || !command_register_dcr2.ic2),
        .address(ica1_adr),
        .as(ica1_as),
        .din(ica1_din),
        .bus_ack(ica1_bus_ack),
        .register_adr(ch1_register_adr),
        .register_data(ch1_register_data),
        .register_write(ch1_register_write),
        .reload_vsr(ica1_reload_vsr),
        .vsr(ica1_vsr)
    );

    wire [15:0] file0_din = sdram_dout;
    wire [15:0] file1_din = sdram_dout;

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
        .reset(new_frame || reset || !command_register_dcr1.ic1),
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


    pixelstream file1out (.clk);

    display_file_decoder file1 (
        .clk,
        .reset(new_frame || reset || !command_register_dcr2.ic2),
        .address(file1_adr),
        .as(file1_as),
        .din(file1_din),
        .bus_ack(file1_bus_ack),
        .reload_vsr(ica1_reload_vsr),
        .burstdata_valid(file1_burstdata_valid),
        .vsr_in(ica1_vsr),
        .out(file1out),
        .read_pixels(!vblank)
    );

    pixelstream rle0out (.clk);

    clut_rle rle (
        .clk,
        .reset(vblank || reset),
        .src  (file0out),
        .dst  (rle0out)
    );
    assign rle0out.strobe  = new_pixel;

    assign file1out.strobe = new_pixel;


    bit [7:0] synchronized_pixel0;
    bit [7:0] synchronized_pixel1;
    bit fail = 0;

    always_comb begin
        clut_addr0 = synchronized_pixel0;

        // Setting highest bit according to Figure 7-2 for CLUT7
        // TODO Might not be correct
        clut_addr1 = {1'b1, synchronized_pixel1[6:0]};

        if (clut_we0) clut_addr0 = clut_wr_addr0;
        if (clut_we1) clut_addr1 = clut_wr_addr1;
    end

    always_ff @(posedge clk) begin
        if (reset) fail <= 0;
        else if (new_pixel && !file1out.write) fail <= 1;

        if (new_line) begin
            synchronized_pixel0 <= 0;
            synchronized_pixel1 <= 0;
        end else begin
            if (rle0out.write && rle0out.strobe) synchronized_pixel0 <= rle0out.pixel;
            if (file1out.write && file1out.strobe) synchronized_pixel1 <= file1out.pixel;
        end

    end

    always_ff @(posedge clk) begin
        if (ica0_reload_vsr) $display("Reload VSR %x", ica0_vsr);
    end

    bit [15:0] cursor[16];
    bit [1:0] clut_bank0;
    bit [1:0] clut_bank1;

    struct packed {
        bit [1:0] reserved1;
        bit [9:0] y;
        bit [1:0] reserved2;
        bit [9:0] x;
    } cursor_position_reg;

    struct packed {
        bit en;
        bit blkc;  // blink type
        bit [2:0] con;
        bit [2:0] cof;
        bit cuw;
        bit [10:0] reserved1;
        bit y;  // 1 full brightness, 0 half brightness
        bit r;
        bit g;
        bit b;
    } cursor_control_register;

    struct packed {
        bit y;  // 1 full brightness, 0 half brightness
        bit r;
        bit g;
        bit b;
    } backdrop_color_register;

    struct packed {
        bit cs;
        bit nr;
        bit ev;
        bit [3:0] cm23_20_planeb;
        bit [3:0] cm13_10_planea;
    } image_coding_method_register;

    struct packed {
        bit mx;
        bit [3:0] tb;
        bit [3:0] ta;
    } transparency_control_register;

    bit [5:0] weight_a;
    bit [5:0] weight_b;

    bit [9:0] active_line = 0;
    bit [9:0] active_pixel = 0;

    bit [15:0] active_cursor_line;
    bit cursor_pixel;
    bit inside_cursor_window;


    // mouse cursor
    always_ff @(posedge clk) begin
        // TODO Initial values might not be correct. Adapt to rest of video timing.
        // TODO I'm also very unsure about the width of sprites. What is double? What is normal?
        // Accoring to chapter 7.6 the position is always based on double resolution
        if (hblank) active_pixel <= 1;
        else if (new_pixel_hires) active_pixel <= active_pixel + 1;

        if (vblank) active_line <= -1;
        else if (new_line) active_line <= active_line + 1;

        active_cursor_line <= cursor[4'(active_line-cursor_position_reg.y)];

        if (cursor_control_register.cuw) begin
            // Double Resolution
            inside_cursor_window <= (active_line >= cursor_position_reg.y) && (active_line < cursor_position_reg.y + 16) && 
                                    (active_pixel > cursor_position_reg.x) && (active_pixel <= cursor_position_reg.x + 16);
            cursor_pixel <= active_cursor_line[4'(cursor_position_reg.x-active_pixel)];

        end else begin
            // Normal Resolution - double the width
            inside_cursor_window <= (active_line >= cursor_position_reg.y) && (active_line < cursor_position_reg.y + 16) && 
                                    (active_pixel > cursor_position_reg.x) && (active_pixel <= cursor_position_reg.x + 32);
            cursor_pixel <= active_cursor_line[4'((cursor_position_reg.x-active_pixel)>>1)];
        end
    end

    // color mixing
    always_comb begin
        // start with the backdrop color
        // TODO implement correctly
        r = backdrop_color_register.r ? 8'hff : 0;
        g = backdrop_color_register.g ? 8'hff : 0;
        b = backdrop_color_register.b ? 8'hff : 0;
        if (!backdrop_color_register.y) begin
            // Half brightness
            r[7] = 0;
            g[7] = 0;
            b[7] = 0;
        end

        // file0
        if (clut_out0 != trans_color_plane_a) begin
            r = {clut_out0.r, 2'b00};
            g = {clut_out0.g, 2'b00};
            b = {clut_out0.b, 2'b00};

            r = 8'((15'(r) * (15'(weight_a) + 15'd1)) >> 6);
            g = 8'((15'(g) * (15'(weight_a) + 15'd1)) >> 6);
            b = 8'((15'(b) * (15'(weight_a) + 15'd1)) >> 6);
        end

        // file1
        if (clut_out1 != trans_color_plane_b) begin
            r = {clut_out1.r, 2'b00};
            g = {clut_out1.g, 2'b00};
            b = {clut_out1.b, 2'b00};

            r = 8'((15'(r) * (15'(weight_b) + 15'd1)) >> 6);
            g = 8'((15'(g) * (15'(weight_b) + 15'd1)) >> 6);
            b = 8'((15'(b) * (15'(weight_b) + 15'd1)) >> 6);
        end

        // if (inside_cursor_window) g = 100;

        // cursor
        if (cursor_pixel && inside_cursor_window && cursor_control_register.en) begin
            // TODO correct color
            r = cursor_control_register.r ? 8'hff : 0;
            g = cursor_control_register.g ? 8'hff : 0;
            b = cursor_control_register.b ? 8'hff : 0;

            if (!cursor_control_register.y) begin
                // Half brightness
                r[7] = 0;
                g[7] = 0;
                b[7] = 0;
            end
        end
    end

    // Implementation of Table 5-13 Register Map
    always_ff @(posedge clk) begin
        if (reset) begin
            clut_bank0 <= 0;
            cursor_position_reg <= 0;
            cursor_control_register <= 0;
            backdrop_color_register <= 0;
            image_coding_method_register <= 0;
            transparency_control_register <= 0;
        end else begin
            if (ch0_register_write) begin
                case (ch0_register_adr)
                    7'h40: begin
                        // Image Coding Method
                        $display("Coding %b %b", ch0_register_data[11:8], ch0_register_data[3:0]);
                        image_coding_method_register.cs <= ch0_register_data[22];
                        image_coding_method_register.nr <= ch0_register_data[19];
                        image_coding_method_register.ev <= ch0_register_data[18];
                        image_coding_method_register.cm23_20_planeb <= ch0_register_data[11:8];
                        image_coding_method_register.cm13_10_planea <= ch0_register_data[3:0];
                    end
                    7'h41: begin
                        // Transparency Control
                        $display("Transparency Control MX:%b TB:%b TA:%b", ch0_register_data[23],
                                 ch0_register_data[11:8], ch0_register_data[3:0]);

                        transparency_control_register.mx <= ch0_register_data[23];
                        transparency_control_register.tb <= ch0_register_data[11:8];
                        transparency_control_register.ta <= ch0_register_data[3:0];

                    end
                    7'h42: begin
                        // Plane Order
                        if (ch0_register_data[0]) $display("Plane B in front of Plane A");
                        else $display("Plane A in front of Plane B");
                    end
                    7'h43: begin
                        // CLUT Bank
                        clut_bank0 <= ch0_register_data[1:0];
                    end
                    7'h44: begin
                        $display("Trans Color Plane A %d %d %d", ch0_register_data[23:18],
                                 ch0_register_data[15:10], ch0_register_data[7:2]);
                        trans_color_plane_a <= {
                            ch0_register_data[23:18],
                            ch0_register_data[15:10],
                            ch0_register_data[7:2]
                        };
                    end
                    7'h47: begin
                        $display("Mask Color Plane A %d %d %d", ch0_register_data[23:18],
                                 ch0_register_data[15:10], ch0_register_data[7:2]);
                        mask_color_plane_a <= {
                            ch0_register_data[23:18],
                            ch0_register_data[15:10],
                            ch0_register_data[7:2]
                        };
                    end
                    7'h4a: begin
                        // DYUV Abs. Start Value for Plane A
                    end
                    7'h4d: begin
                        // Cursor Position
                        cursor_position_reg <= ch0_register_data;
                        $display("Cursor X:%d Y:%d", ch0_register_data[9:0],
                                 ch0_register_data[21:12]);
                    end
                    7'h4e: begin
                        // Cursor Control
                        cursor_control_register <= ch0_register_data;
                        $display("Cursor Control %b", ch0_register_data);
                    end

                    7'h4f: begin
                        // Cursor Pattern
                        cursor[ch0_register_data[19:16]] <= ch0_register_data[15:0];
                        $display("Cursor %x %b", ch0_register_data[19:16], ch0_register_data[15:0]);
                    end

                    7'h58: begin
                        // Backdrop Color
                        $display("Backdrop Color %b", ch0_register_data[3:0]);
                        backdrop_color_register <= ch0_register_data[3:0];
                    end
                    7'h59: begin
                        // Mosaic Pixel Hold for Plane A
                    end
                    7'h5b: begin
                        // Weight Factor for Plane A
                        weight_a <= ch0_register_data[5:0];
                        $display("Weight A %d", ch0_register_data[5:0]);
                    end
                    default: begin
                        /*
                    if (register_adr >= 7'h40) begin
                        $display("Ignored %x", register_adr);
                    end
                    */
                    end
                endcase

                if (ch0_register_adr[6:3] == 4'b1010) begin
                    //$display("Region %d %b", register_adr[2:0], ch0_register_data);
                    region_control[ch0_register_adr[2:0]] <= {
                        ch0_register_data[23:20], ch0_register_data[16:0]
                    };
                end

                if (ch0_register_adr <= 7'h3f) begin
                    // CLUT Color 0 to 63
                    /*
                $display("CLUT  %d  %d %d %d", {clut_bank, register_adr[5:0]},
                         ch0_register_data[23:18], ch0_register_data[15:10], ch0_register_data[7:2]);
                         */
                end
            end
        end
    end

    assign clut_wr_addr0 = {clut_bank0, ch0_register_adr[5:0]};
    assign clut_wr_addr1 = {clut_bank1, ch1_register_adr[5:0]};

    assign clut_wr_data0 = {
        ch0_register_data[23:18], ch0_register_data[15:10], ch0_register_data[7:2]
    };
    assign clut_wr_data1 = {
        ch1_register_data[23:18], ch1_register_data[15:10], ch1_register_data[7:2]
    };

    assign clut_we0 = (ch0_register_adr <= 7'h3f) && ch0_register_write;
    assign clut_we1 = (ch1_register_adr <= 7'h3f) && ch1_register_write;

    always_ff @(posedge clk) begin
        if (reset) begin
            clut_bank1 <= 0;
        end else begin

            if (ch1_register_write) begin
                case (ch1_register_adr)
                    7'h43: begin
                        // CLUT Bank
                        clut_bank1 <= ch1_register_data[1:0];

                        // The second channel can only write to banks 2 and 3
                        assert (ch1_register_data[1]);
                    end
                    7'h46: begin
                        $display("Trans Color Plane B %d %d %d", ch1_register_data[23:18],
                                 ch1_register_data[15:10], ch1_register_data[7:2]);
                        trans_color_plane_b <= {
                            ch1_register_data[23:18],
                            ch1_register_data[15:10],
                            ch1_register_data[7:2]
                        };
                    end
                    7'h49: begin
                        $display("Mask Color Plane B %d %d %d", ch1_register_data[23:18],
                                 ch1_register_data[15:10], ch1_register_data[7:2]);
                        mask_color_plane_b <= {
                            ch1_register_data[23:18],
                            ch1_register_data[15:10],
                            ch1_register_data[7:2]
                        };
                    end
                    7'h4b: begin
                        // DYUV Abs. Start Value for Plane B
                    end

                    7'h5c: begin
                        // Weight Factor for Plane B
                        weight_b <= ch1_register_data[5:0];
                        $display("Weight B %d", ch1_register_data[5:0]);
                    end

                    default: begin
                        /*
                    if (register_adr >= 7'h40) begin
                        $display("Ignored %x", register_adr);
                    end
                    */
                    end
                endcase

                if (ch1_register_adr[6:3] == 4'b1010) begin
                    //$display("Region %d %b", register_adr[2:0], ch1_register_data);
                    region_control[ch1_register_adr[2:0]] <= {
                        ch1_register_data[23:20], ch1_register_data[16:0]
                    };
                end

                if (ch1_register_adr <= 7'h3f) begin
                    // CLUT Color 0 to 63

                    /*$display("CLUT  %d  %d %d %d", {clut_bank1, ch1_register_adr[5:0]},
                         ch1_register_data[23:18], ch1_register_data[15:10],
                         ch1_register_data[7:2]);*/
                end
            end
        end

    end

endmodule


// According to
// https://www.intel.com/content/www/us/en/docs/programmable/683082/22-1/true-dual-port-synchronous-ram.html
// to ensure that this is indeed a True Dual-Port RAM with Single Clock
module clut_dual_port_memory (
    input clk,
    input clut_entry data_a,
    input clut_entry data_b,
    input [7:0] addr_a,
    input [7:0] addr_b,
    input we_a,
    input we_b,
    output clut_entry q_a,
    output clut_entry q_b
);
    // Declare the RAM variable
    clut_entry ram[256];

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
