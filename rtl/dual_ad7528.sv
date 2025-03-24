module dual_ad7528_attenuation (
    input clk,
    input datadac,  // Selects DAC A/B and is data for shift register
    input csdac2n,  // Latches DAC for attenuation of right Audio
    input csdac1n,  // Latches DAC for attenuation of left Audio
    input clkdac,   // Clocks shift register
    //input kill, // grounds audio if true

    input signed [15:0] audio_left_in,
    input signed [15:0] audio_right_in,
    output bit signed [15:0] audio_left_out,
    output bit signed [15:0] audio_right_out
);

    enum {
        LEFT_A,
        LEFT_B,
        RIGHT_A,
        RIGHT_B
    } state;

    bit clkdac_q;
    // Implements 7512, a 74HC164
    // Data is shifted in Q0 and continues to Q7
    bit [7:0] shiftreg;
    always_ff @(posedge clk) begin
        clkdac_q <= clkdac;

        if (!clkdac_q && clkdac) begin
            shiftreg <= {shiftreg[6:0], datadac};
        end
    end

    // for both AD7528, the input A is the same side while the input B is the other side
    // 7530 AD7528 produces Audio Right
    //    VrefA is DAC Right
    //    VrefB is DAC Left
    // 7550 AD7528 produces Audio Left
    //    VrefA is DAC Left
    //    VrefB is DAC Right
    bit [7:0] factor_left_a;
    bit [7:0] factor_left_b;
    bit [7:0] factor_right_a;
    bit [7:0] factor_right_b;

    bit csdac1n_q;
    bit csdac2n_q;

    // Limit volume to a certain degree
    // A factor of 9/16 fits by the rule of thumb with the clipping behavior
    // observed on a 210/05. The real machine has two 16 bit channels which are
    // summed together using an analog circuit. This is something
    // we can't do here since our output only has 16 bit.
    // We are losing a little bit of resolution with this...
    wire [7:0] scaled_shiftreg = shiftreg * 9 / 16;

    always_ff @(posedge clk) begin
        csdac1n_q <= csdac1n;
        csdac2n_q <= csdac2n;

        if (!csdac1n && csdac1n_q) begin
            $display("DAC Left %d %d", datadac, shiftreg);
            if (datadac) factor_left_a <= scaled_shiftreg;
            else factor_left_b <= scaled_shiftreg;
        end

        if (!csdac2n && csdac2n_q) begin
            $display("DAC Right %d %d", datadac, shiftreg);
            if (datadac) factor_right_a <= scaled_shiftreg;
            else factor_right_b <= scaled_shiftreg;
        end
    end

    // MAC register
    // To save some ressources, we use only one DSP block for all 4 multiplications here
    bit signed [25:0] temp;
    bit signed [23:8] temp_clipped;

    always_comb begin
        if (signed'(temp[25:8]) > signed'(18'h7fff)) temp_clipped[23:8] = 16'h7fff;
        else if (signed'(temp[25:8]) < signed'(-18'h7fff)) temp_clipped[23:8] = -16'h7fff;
        else temp_clipped[23:8] = temp[23:8];
    end

    // Left and Right might be swapped here. There is a reason for that:
    // According to an internal memo http://icdia.co.uk/docs/mono2status.zip
    // there was discrepancy between left and right on Mono I and Mono II
    // hardware. This configuration shall establish the order which
    // one would expect from an Audio CD which is also consistent
    // with the panning of Zelda's Adventure
    always_ff @(posedge clk) begin
        case (state)
            LEFT_A: begin
                audio_left_out <= temp_clipped[23:8];

                state <= LEFT_B;
                temp <= signed'({1'b0, factor_left_a}) * audio_left_in;
            end
            LEFT_B: begin
                state <= RIGHT_A;
                temp  <= temp + signed'({1'b0, factor_left_b}) * audio_right_in;
            end
            RIGHT_A: begin
                audio_right_out <= temp_clipped[23:8];

                state <= RIGHT_B;
                temp <= signed'({1'b0, factor_right_a}) * audio_right_in;
            end
            RIGHT_B: begin
                state <= LEFT_A;
                temp  <= temp + signed'({1'b0, factor_right_b}) * audio_left_in;
            end
        endcase
    end

endmodule
