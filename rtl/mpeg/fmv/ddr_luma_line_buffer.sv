
// For buffering of a Y line
module ddr_luma_line_buffer (
    // Input
    input clk_in,
    input reset,
    input [63:0] wdata,
    input we,
    // Output
    input clk_out,
    input [9:0] raddr,  // 640 x 8
    output bit [7:0] q
);

    // The maximum resolution for MPEG should be 384 for the CD-i
    // But games like Christmas Crisis have a 528 pixel wide frame and crop it
    // We will go for 640 pixels here, to be safe.

    bit [6:0] waddr;  // 128 x 64
    bit [7:0][7:0] ram[640/8];

    always_ff @(posedge clk_in) begin
        if (reset) waddr <= 0;

        if (we) begin
            ram[waddr] <= wdata;
            waddr <= waddr + 1;
        end
    end

    always_ff @(posedge clk_out) begin
        q <= ram[raddr[9:3]][raddr[2:0]];
    end

endmodule : ddr_luma_line_buffer

