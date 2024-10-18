`include "bus.svh"
`include "videotypes.svh"


module delta_yuv_decoder (
    input clk,
    input reset,
    pixelstream src,
    input yuv_s absolute_start_yuv,
    output rgb888_s rgb_out,
    output write,
    input strobe
);

    bit signed [9:0] r;
    bit signed [9:0] g;
    bit signed [9:0] b;
    bit signed [9:0] r_q;
    bit signed [9:0] g_q;
    bit signed [9:0] b_q;

    enum bit [3:0] {
        IDLE,
        STATE_UY,
        STATE_VY
    } state = IDLE;

    // Dequantizer Table according to Table 7-1
    bit [7:0] dyuv_deltas[16] = '{
        0,
        1,
        4,
        9,
        16,
        27,
        44,
        79,
        128,
        177,
        212,
        229,
        240,
        247,
        252,
        255
    };

    yuv_s current_color;

    // Counting the words. Might be not the best solution.
    bit [8:0] wordcnt;
    always_ff @(posedge clk) begin
        if (reset) wordcnt <= 384;
        else if (src.write && src.strobe) wordcnt <= wordcnt - 1;
    end

    function [7:0] clamp8(input signed [9:0] val);
        if (val > 255) clamp8 = 255;
        else if (val < 0) clamp8 = 0;
        else clamp8 = val[7:0];
    endfunction

    function [7:0] clamp_int8(input int val);
        if (val > 255) clamp_int8 = 255;
        else if (val < 0) clamp_int8 = 0;
        else clamp_int8 = val[7:0];
    endfunction

    always_comb begin
        bit signed [9:0] y, u, v;

        y = {2'b00, current_color.y};
        u = {2'b00, current_color.u};
        v = {2'b00, current_color.v};

        // According to chapter 7.1 DELTA YUV DECODER
        r = (y * 256 + 351 * (v - 128)) / 256;
        g = (y * 256 - 86 * (u - 128) - 179 * (v - 128)) / 256;
        b = (y * 256 + 444 * (u - 128)) / 256;

        rgb_out.r = clamp8(r);
        rgb_out.g = clamp8(g);
        rgb_out.b = clamp8(b);
    end

    always_ff @(posedge clk) begin
        r_q <= r;
        g_q <= g;
        b_q <= b;
    end

`ifdef VERILATOR
    // Compare 32 bit int against shorter signed registers
    // to validate resultse
    rgb888_s verify_rgb;
    always_comb begin
        int y, u, v;
        int r, g, b;

        y = int'({2'b00, current_color.y});
        u = int'({2'b00, current_color.u});
        v = int'({2'b00, current_color.v});

        // According to chapter 7.1 DELTA YUV DECODER
        r = (y * 256 + 351 * (v - 128)) / 256;
        g = (y * 256 - 86 * (u - 128) - 179 * (v - 128)) / 256;
        b = (y * 256 + 444 * (u - 128)) / 256;
        verify_rgb.r = clamp_int8(r);
        verify_rgb.g = clamp_int8(g);
        verify_rgb.b = clamp_int8(b);
    end

    always_ff @(posedge clk) begin
        assert (verify_rgb == rgb_out);
    end
`endif

    // According to chapter 7.1 DELTA YUV DECODER
    // Pixel Format is
    // Delta U0 Delta Y0
    // Delta V0 Delta Y1
    // Delta U2 Delta Y2
    // Delta V2 Delta Y3
    // Y is available for every pixel
    // UV is only updated every other pixel
    // UV is interpolated between those pixels

    always_comb begin
        src.strobe = 0;
        if (src.write && !write && wordcnt != 0) begin
            if (state == STATE_UY || state == STATE_VY) src.strobe = 1;
        end
    end

    yuv_s storage_color;

    always_ff @(posedge clk) begin
        if (strobe) write <= 0;

        if (reset) begin
            state <= IDLE;
        end else begin

            case (state)
                IDLE: begin
                    if (src.write && wordcnt != 0) begin
                        //When the first data arrives we can be sure that ICA/DCA has
                        // updated the Absolute Start YUV
                        current_color <= absolute_start_yuv;
                        storage_color <= absolute_start_yuv;

                        state <= STATE_UY;
                    end
                end
                STATE_UY: begin
                    if (src.write && !write && wordcnt != 0) begin
                        // First byte contains U0 and Y0

                        // delay Y and U with storage
                        storage_color.y <= storage_color.y + dyuv_deltas[src.pixel[3:0]];
                        storage_color.u <= storage_color.u + dyuv_deltas[src.pixel[7:4]];
                        current_color.y <= storage_color.y;

                        // update U and V from interpolation
                        current_color.u <= 8'(({1'b0,storage_color.u + dyuv_deltas[src.pixel[7:4]]} + {1'b0,storage_color.u})>>1);
                        //current_color.v <= 0;
                        write <= 1;
                        state <= STATE_VY;
                    end
                end
                STATE_VY: begin
                    if (src.write && !write) begin
                        // Second byte contains V0 and Y1

                        // activate storage Y and U with current V
                        // update all 3 components
                        current_color.y <= storage_color.y;
                        current_color.u <= storage_color.u;
                        current_color.v <= current_color.v + dyuv_deltas[src.pixel[7:4]];

                        // put Y into storage
                        storage_color.y <= storage_color.y + dyuv_deltas[src.pixel[3:0]];
                        storage_color.v <= current_color.v + dyuv_deltas[src.pixel[7:4]];
                        write <= 1;
                        state <= STATE_UY;
                    end
                end

                default: begin
                end
            endcase

        end
    end

endmodule

