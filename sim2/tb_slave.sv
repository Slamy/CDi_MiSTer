`timescale 1 ns / 1 ns

module tb_slave (
    input clk,
    input [7:0] porta_in,
    output bit [7:0] porta_out,
    input [7:0] portb_in,
    output bit [7:0] portb_out,
    input [7:0] portc_in,
    output bit [7:0] portc_out,
    input [7:0] portd_in,
    input irq
);

    wire [7:0] ddra;
    wire [7:0] ddrb;
    wire [7:0] ddrc;

    wire disdat_from_uc = ddrc[3] ? portc_out[3] : 1'b1;
    wire disdat_to_ic;

    wire disdat = disdat_from_uc && disdat_to_ic;
    wire disclk = ddrc[4] ? portc_out[4] : 1'b1;
    wire dtackslaven = ddrb[6] ? portb_out[6] : 1'b1;
    bit dtackn = 1;


	always_ff @( posedge clk) begin
        if (!irq) dtackn <= 0;
        else if (!dtackslaven) dtackn <= 1;
    end

    // wire disen = portc_mix[5];
    //wire resetsys = portc_mix[2];

    //wire [7:0] porta_out;
    //wire [7:0] portb_out;
    //wire [7:0] portc_out;

    uc68hc05 uc68hc05_0 (
        .clk,
        .porta_in,
        .porta_out,
        .portb_in,
        .portb_out,
        .portc_in({portc_in[7:5], disclk, disdat_to_ic, portc_in[2:0]}),
        .portc_out,
        .portd_in,
        .irq,
        .ddra,
        .ddrb,
        .ddrc
    );


    u3090mg u3090mg (
        .clk,
        .sda_in(disdat_from_uc),
        .sda_out(disdat_to_ic),
        .scl(disclk)
    );


endmodule
