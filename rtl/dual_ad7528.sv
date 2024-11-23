module dual_ad7528_attenuation (
    input clk,
    input datadac,  // Selects DAC A/B and is data for shift register
    input [1:0] csdacn,  // Latches DAC for attenuation of left/right Audio
    input clkdac,  // Clocks shift register
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

    always_ff @(posedge clk) begin
        if (!csdacn[0]) begin
            $display("DAC Left %d %d", datadac, shiftreg);
            if (!datadac) factor_left_a <= shiftreg;
            else factor_left_b <= shiftreg;
        end

        if (!csdacn[1]) begin
            $display("DAC Right %d %d", datadac, shiftreg);
            if (!datadac) factor_right_a <= shiftreg;
            else factor_right_b <= shiftreg;
        end
    end

    // MAC register
    // To save some ressources, we use only one DSP block for all 4 multiplications here
    bit signed [23:0] temp;

    always_ff @(posedge clk) begin
        case (state)
            LEFT_A: begin
                audio_right_out <= temp[23:8];

                state <= LEFT_B;
                temp <= signed'({1'b0, factor_left_a[7:1]}) * audio_left_in;
            end
            LEFT_B: begin
                state <= RIGHT_A;
                temp  <= temp + signed'({1'b0, factor_left_b[7:1]}) * audio_right_in;
            end
            RIGHT_A: begin
                audio_left_out <= temp[23:8];

                state <= RIGHT_B;
                temp <= signed'({1'b0, factor_right_a[7:1]}) * audio_right_in;
            end
            RIGHT_B: begin
                state <= LEFT_A;
                temp  <= temp + signed'({1'b0, factor_right_b[7:1]}) * audio_left_in;
            end
        endcase
    end

endmodule
