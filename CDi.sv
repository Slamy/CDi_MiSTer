//============================================================================
//
//  This program is free software; you can redistribute it and/or modify it
//  under the terms of the GNU General Public License as published by the Free
//  Software Foundation; either version 2 of the License, or (at your option)
//  any later version.
//
//  This program is distributed in the hope that it will be useful, but WITHOUT
//  ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
//  FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
//  more details.
//
//  You should have received a copy of the GNU General Public License along
//  with this program; if not, write to the Free Software Foundation, Inc.,
//  51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
//
//============================================================================

module emu (
    //Master input clock
    input CLK_50M,

    //Async reset from top-level module.
    //Can be used as initial reset.
    input RESET,

    //Must be passed to hps_io module
    inout [48:0] HPS_BUS,

    //Base video clock. Usually equals to CLK_SYS.
    output CLK_VIDEO,

    //Multiple resolutions are supported using different CE_PIXEL rates.
    //Must be based on CLK_VIDEO
    output CE_PIXEL,

    //Video aspect ratio for HDMI. Most retro systems have ratio 4:3.
    //if VIDEO_ARX[12] or VIDEO_ARY[12] is set then [11:0] contains scaled size instead of aspect ratio.
    output [12:0] VIDEO_ARX,
    output [12:0] VIDEO_ARY,

    output [7:0] VGA_R,
    output [7:0] VGA_G,
    output [7:0] VGA_B,
    output       VGA_HS,
    output       VGA_VS,
    output       VGA_DE,      // = ~(VBlank | HBlank)
    output       VGA_F1,
    output [1:0] VGA_SL,
    output       VGA_SCALER,  // Force VGA scaler
    output       VGA_DISABLE, // analog out is off

    input  [11:0] HDMI_WIDTH,
    input  [11:0] HDMI_HEIGHT,
    output        HDMI_FREEZE,
    output        HDMI_BLACKOUT,

`ifdef MISTER_FB
    // Use framebuffer in DDRAM
    // FB_FORMAT:
    //    [2:0] : 011=8bpp(palette) 100=16bpp 101=24bpp 110=32bpp
    //    [3]   : 0=16bits 565 1=16bits 1555
    //    [4]   : 0=RGB  1=BGR (for 16/24/32 modes)
    //
    // FB_STRIDE either 0 (rounded to 256 bytes) or multiple of pixel size (in bytes)
    output        FB_EN,
    output [ 4:0] FB_FORMAT,
    output [11:0] FB_WIDTH,
    output [11:0] FB_HEIGHT,
    output [31:0] FB_BASE,
    output [13:0] FB_STRIDE,
    input         FB_VBL,
    input         FB_LL,
    output        FB_FORCE_BLANK,

`ifdef MISTER_FB_PALETTE
    // Palette control for 8bit modes.
    // Ignored for other video modes.
    output        FB_PAL_CLK,
    output [ 7:0] FB_PAL_ADDR,
    output [23:0] FB_PAL_DOUT,
    input  [23:0] FB_PAL_DIN,
    output        FB_PAL_WR,
`endif
`endif

    output LED_USER,  // 1 - ON, 0 - OFF.

    // b[1]: 0 - LED status is system status OR'd with b[0]
    //       1 - LED status is controled solely by b[0]
    // hint: supply 2'b00 to let the system control the LED.
    output [1:0] LED_POWER,
    output [1:0] LED_DISK,

    // I/O board button press simulation (active high)
    // b[1]: user button
    // b[0]: osd button
    output [1:0] BUTTONS,

    input         CLK_AUDIO,  // 24.576 MHz
    output [15:0] AUDIO_L,
    output [15:0] AUDIO_R,
    output        AUDIO_S,    // 1 - signed audio samples, 0 - unsigned
    output [ 1:0] AUDIO_MIX,  // 0 - no mix, 1 - 25%, 2 - 50%, 3 - 100% (mono)

    //ADC
    inout [3:0] ADC_BUS,

    //SD-SPI
    output SD_SCK,
    output SD_MOSI,
    input  SD_MISO,
    output SD_CS,
    input  SD_CD,

    //High latency DDR3 RAM interface
    //Use for non-critical time purposes
    output        DDRAM_CLK,
    input         DDRAM_BUSY,
    output [ 7:0] DDRAM_BURSTCNT,
    output [28:0] DDRAM_ADDR,
    input  [63:0] DDRAM_DOUT,
    input         DDRAM_DOUT_READY,
    output        DDRAM_RD,
    output [63:0] DDRAM_DIN,
    output [ 7:0] DDRAM_BE,
    output        DDRAM_WE,

    //SDRAM interface with lower latency
    output        SDRAM_CLK,
    output        SDRAM_CKE,
    output [12:0] SDRAM_A,
    output [ 1:0] SDRAM_BA,
`ifndef VERILATOR
    inout  [15:0] SDRAM_DQ,
`endif
    output        SDRAM_DQML,
    output        SDRAM_DQMH,
    output        SDRAM_nCS,
    output        SDRAM_nCAS,
    output        SDRAM_nRAS,
    output        SDRAM_nWE,

`ifdef MISTER_DUAL_SDRAM
    //Secondary SDRAM
    //Set all output SDRAM_* signals to Z ASAP if SDRAM2_EN is 0
    input         SDRAM2_EN,
    output        SDRAM2_CLK,
    output [12:0] SDRAM2_A,
    output [ 1:0] SDRAM2_BA,
    inout  [15:0] SDRAM2_DQ,
    output        SDRAM2_nCS,
    output        SDRAM2_nCAS,
    output        SDRAM2_nRAS,
    output        SDRAM2_nWE,
`endif

    input  UART_CTS,
    output UART_RTS,
    input  UART_RXD,
    output UART_TXD,
    output UART_DTR,
    input  UART_DSR,

    // Open-drain User port.
    // 0 - D+/RX
    // 1 - D-/TX
    // 2..6 - USR2..USR6
    // Set USER_OUT to 1 to read from USER_IN.
    input  [6:0] USER_IN,
    output [6:0] USER_OUT,

    input OSD_STATUS
);

    ///////// Default values for ports not used in this core /////////

`ifdef VERILATOR
    bit [15:0] SDRAM_DQ_in;
    bit [15:0] SDRAM_DQ_out;
`endif

    assign ADC_BUS = 'Z;
    assign USER_OUT = '1;
    assign {UART_RTS, UART_DTR} = 0;
    assign {SD_SCK, SD_MOSI, SD_CS} = 'Z;
`ifdef VERILATOR
    assign {SDRAM_A, SDRAM_BA, SDRAM_CLK, SDRAM_CKE, SDRAM_DQML, SDRAM_DQMH, SDRAM_nWE, SDRAM_nCAS, SDRAM_nRAS, SDRAM_nCS} = 'Z;
`else
    assign {SDRAM_DQ, SDRAM_A, SDRAM_BA, SDRAM_CLK, SDRAM_CKE, SDRAM_DQML, SDRAM_DQMH, SDRAM_nWE, SDRAM_nCAS, SDRAM_nRAS, SDRAM_nCS} = 'Z;
`endif

    assign {DDRAM_CLK, DDRAM_BURSTCNT, DDRAM_ADDR, DDRAM_DIN, DDRAM_BE, DDRAM_RD, DDRAM_WE} = '0;

    assign VGA_SL = 0;
    assign VGA_F1 = 0;
    assign VGA_SCALER = 0;
    assign VGA_DISABLE = 0;
    assign HDMI_FREEZE = 0;
    assign HDMI_BLACKOUT = 0;

    assign AUDIO_S = 0;
    assign AUDIO_L = 0;
    assign AUDIO_R = 0;
    assign AUDIO_MIX = 0;

    assign LED_DISK = 0;
    assign LED_POWER = 0;
    assign BUTTONS = 0;

    //////////////////////////////////////////////////////////////////

    wire [1:0] ar = status[122:121];

`ifndef VERILATOR
    assign VIDEO_ARX = (!ar) ? 12'd4 : (ar - 1'd1);
    assign VIDEO_ARY = (!ar) ? 12'd3 : 12'd0;
`endif

    `include "build_id.v"
    localparam CONF_STR = {
        "CD-i;UART115200;",
        "-;",
        "F1,BIN;",
        "O[122:121],Aspect ratio,Original,Full Screen,[ARC1],[ARC2];",
        "O[2],UART Loopback,No,Yes;",
        "O[3],UART Fake Space,No,Yes;",
        "-;",
        "-;",
        "T[0],Reset;",
        "R[0],Reset and close OSD;",
        "v,0;",  // [optional] config version 0-99. 
                 // If CONF_STR options are changed in incompatible way, then change version number too,
        // so all options will get default values on first start.
        "V,v",
        `BUILD_DATE
    };

    wire         forced_scandoubler;
    wire [  1:0] buttons;
    wire [127:0] status;
    wire [ 10:0] ps2_key;

    wire         ioctl_download  /*verilator public_flat_rw*/;
    wire         ioctl_wr  /*verilator public_flat_rw*/;
    wire [ 24:0] ioctl_addr  /*verilator public_flat_rw*/;
    wire [ 15:0] ioctl_dout  /*verilator public_flat_rw*/;
    wire [  7:0] ioctl_index  /*verilator public_flat_rw*/;
    wire         ioctl_wait  /*verilator public_flat_rw*/;

    //wire rom_download = ioctl_download & (ioctl_index[5:0] <= 6'h00);
    wire         rom_download = ioctl_download;
    bit          rom_download_not_yet = 1;

`ifndef VERILATOR
    hps_io #(
        .CONF_STR(CONF_STR),
        .WIDE(1)
    ) hps_io (
        .clk_sys  (clk_sys),
        .HPS_BUS  (HPS_BUS),
        .EXT_BUS  (),
        .gamma_bus(),

        .forced_scandoubler(forced_scandoubler),

        .buttons(buttons),
        .status(status),
        .status_menumask(),

        .ioctl_download(ioctl_download),
        .ioctl_index(ioctl_index),
        .ioctl_wr(ioctl_wr),
        .ioctl_addr(ioctl_addr),
        .ioctl_dout(ioctl_dout),
        .ioctl_wait(ioctl_wait),

        .ps2_key(ps2_key)
    );
`endif

    ///////////////////////   CLOCKS   ///////////////////////////////

    (* keep *) wire clk_sys  /*verilator public_flat_rw*/;
`ifndef VERILATOR
    pll pll (
        .refclk(CLK_50M),
        .rst(0),
        .outclk_0(clk_sys)  // 30 MHz
    );
`endif

    wire [24:0] sdram_addr;
    wire        sdram_rd;
    wire        sdram_wr;
    wire        sdram_word;
    wire [15:0] sdram_din;
    wire [15:0] sdram_dout;
    wire        sdram_busy;
    assign ioctl_wait = sdram_busy;

    sdram sdram (
        .*,
        .init(0),  //~clock_locked),
        .clk(clk_sys),

        .addr(rom_download ? {3'b001, ioctl_addr[21:1], 1'b0} : sdram_addr),
        .din (rom_download ? {ioctl_dout[7:0], ioctl_dout[15:8]} : sdram_din),
        .dout(sdram_dout),
        .rd  (rom_download ? 1'b0 : sdram_rd),
        .wr  (rom_download ? ioctl_wr : sdram_wr),
        .word(rom_download ? 1'b1 : sdram_word),
        .busy(sdram_busy)
    );

`ifdef VERILATOR
    bit [15:0] rom[262144]  /*verilator public_flat_rw*/;
    bit [15:0] ram[262144*2]  /*verilator public_flat_rw*/;
    bit [25:0] sdram_real_addr;
    initial begin
        $readmemh("cdi200.mem", rom);
    end

    always_comb begin
        if (sdram_real_addr[21]) SDRAM_DQ_in = rom[sdram_real_addr[17:0]];
        else SDRAM_DQ_in = ram[sdram_real_addr[18:0]];
    end

    bit SDRAM_nWE_q;
    bit SDRAM_DQMH_q;
    bit SDRAM_DQML_q;

    always_ff @(posedge clk_sys) begin
        SDRAM_nWE_q  <= SDRAM_nWE;
        SDRAM_DQMH_q <= SDRAM_DQMH;
        SDRAM_DQML_q <= SDRAM_DQML;

        if (!SDRAM_nCAS) sdram_real_addr[25:13] <= SDRAM_A;
        if (!SDRAM_nRAS) sdram_real_addr[12:0] <= SDRAM_A;

        if (sdram_real_addr[21]) begin
            if (!SDRAM_nWE_q) assert (ioctl_download);

            if (!SDRAM_nWE_q && !SDRAM_DQML_q)
                rom[sdram_real_addr[17:0]][15:8] <= SDRAM_DQ_out[15:8];
            if (!SDRAM_nWE_q && !SDRAM_DQMH_q) rom[sdram_real_addr[17:0]][7:0] <= SDRAM_DQ_out[7:0];
        end else begin
            if (!SDRAM_nWE_q && !SDRAM_DQML_q)
                ram[sdram_real_addr[18:0]][15:8] <= SDRAM_DQ_out[15:8];
            if (!SDRAM_nWE_q && !SDRAM_DQMH_q) ram[sdram_real_addr[18:0]][7:0] <= SDRAM_DQ_out[7:0];
        end

    end
`endif

    (* keep *) wire reset = RESET || status[0] || buttons[1] || rom_download;

    always_ff @(posedge clk_sys) begin
        if (rom_download) rom_download_not_yet <= 0;

        //assert (sdram_wr == 0);
    end

    wire [1:0] col = status[4:3];
    wire debug_uart_fake_space  /*verilator public_flat_rw*/ = status[3];

    wire HBlank;
    wire HSync;
    wire VBlank;
    wire VSync;
    wire ce_pix;
    wire [7:0] r  /*verilator public_flat_rd*/;
    wire [7:0] g  /*verilator public_flat_rd*/;
    wire [7:0] b  /*verilator public_flat_rd*/;

    cditop cditop (
        .clk30(clk_sys),
        .reset(reset),

        .debug_uart_loopback(status[2]),
        .debug_uart_fake_space,
        .scandouble(forced_scandoubler),

        .ce_pix(ce_pix),

        .HBlank(HBlank),
        .HSync (HSync),
        .VBlank(VBlank),
        .VSync (VSync),

        .r(r),
        .g(g),
        .b(b),

        .sdram_addr(sdram_addr),
        .sdram_rd(sdram_rd),
        .sdram_wr(sdram_wr),
        .sdram_word(sdram_word),
        .sdram_din(sdram_din),
        .sdram_dout(sdram_dout),
        .sdram_busy(sdram_busy),
        .scc68_uart_tx(UART_TXD),
        .scc68_uart_rx(UART_RXD)
    );

    assign CLK_VIDEO = clk_sys;
    assign CE_PIXEL = ce_pix;

    assign VGA_DE = ~(HBlank | VBlank);
    assign VGA_HS = HSync;
    assign VGA_VS = VSync;
    assign VGA_R = UART_RXD ? r : 0;
    assign VGA_G = UART_TXD ? g : 0;
    assign VGA_B = b;

    reg [26:0] act_cnt;
    always @(posedge clk_sys) act_cnt <= act_cnt + 1'd1;
    assign LED_USER = act_cnt[26] ? act_cnt[25:18] > act_cnt[7:0] : act_cnt[25:18] <= act_cnt[7:0];

endmodule
