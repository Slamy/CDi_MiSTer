`include "../util.svh"

module yuv_frame_adr_fifo (
    input clk,
    input reset,
    // Input
    input planar_yuv_s wdata,
    input we,
    // Output
    input strobe,
    output bit valid,
    output planar_yuv_s q,
    // State
    output [4:0] cnt
);

    planar_yuv_s ram[32];

    // Clock domain of output
    bit [4:0] raddr;

    // Clock domain of input
    bit [4:0] waddr;

    assign cnt = waddr - raddr;

    always_ff @(posedge clk) begin
        if (reset) begin
            waddr <= 0;
            raddr <= 0;
        end else if (we) begin
            ram[waddr] <= wdata;
            waddr <= waddr + 1;

            assert (cnt < 28);
            assert (cnt < 28);
        end

        if (strobe) begin
            raddr <= raddr + 1;

            assert (cnt > 0);
            assert (cnt > 0);
        end

        q <= ram[raddr];
        valid <= raddr != waddr;
    end

endmodule : yuv_frame_adr_fifo

