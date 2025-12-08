
module ddr_to_byte_fifo (
    // Input
    input clk_in,
    input reset_in,
    input [63:0] wdata,
    input we,
    output half_empty,  // True if a space of 128 bit is available
    // Output
    input reset_out,
    input clk_out,
    input strobe,
    output bit valid,
    output bit [7:0] q
);

    bit [7:0][7:0] ram[64];

    // Clock domain of output
    bit [8:0] raddr;  // 512 x 8

    // Clock domain of input
    bit [5:0] waddr;  // 64 x 64

    // verilog_format: off
    // Transfer waddr from clk_in to clk_out
    bit [5:0] waddr_gray;
    b2g_converter #(.WIDTH(6)) waddr_to_gray1 (.binary(waddr),.gray(waddr_gray));
    bit [5:0] waddr_q;
    bit [5:0] waddr_q2;
    bit [5:0] waddr_q3;
    always @(posedge clk_in) waddr_q <= waddr_gray;
    always @(posedge clk_out) waddr_q2 <= waddr_q;
    always @(posedge clk_out) waddr_q3 <= waddr_q2;
    bit [5:0] waddr_clkout;
    g2b_converter #(.WIDTH(6)) waddr_to_binary1 (.binary(waddr_clkout),.gray(waddr_q3));

    // Transfer raddr from clk_out to clk_in
    bit [8:0] raddr_gray;
    b2g_converter #(.WIDTH(9)) raddr_to_gray2 (.binary(raddr),.gray(raddr_gray));
    bit [8:0] raddr_q;
    bit [8:0] raddr_q2;
    bit [8:0] raddr_q3;
    always @(posedge clk_out) raddr_q <= raddr_gray;
    always @(posedge clk_in) raddr_q2 <= raddr_q;
    always @(posedge clk_in) raddr_q3 <= raddr_q2;
    bit [8:0] raddr_clkin;
    g2b_converter #(.WIDTH(9)) raddr_to_binary2 (.binary(raddr_clkin),.gray(raddr_q3));
    
    // verilog_format: on

    wire [8:0] cnt_clkin = {waddr, 3'b0} - raddr_clkin;
    wire [8:0] cnt_clkout = {waddr_clkout, 3'b0} - raddr;

    // The threshold can't be set to exactly half.
    // There is a latency of this signal because of the clock synchronization above
    // The supplying machine might always provide more than requested because of this!
    assign half_empty = cnt_clkin < 100;

    always_ff @(posedge clk_in) begin
        if (reset_in) waddr <= 0;
        else if (we) begin
            ram[waddr] <= wdata;
            waddr <= waddr + 1;

            assert (cnt_clkout < 500);
            assert (cnt_clkin < 500);
        end
    end

    always_ff @(posedge clk_out) begin
        if (reset_out) raddr <= 0;
        else if (strobe) begin
            raddr <= raddr + 1;

            assert (cnt_clkout > 16);
            assert (cnt_clkin > 16);
        end

        q <= ram[raddr[8:3]][raddr[2:0]];
        valid <= cnt_clkout != 0;
    end

endmodule : ddr_to_byte_fifo

