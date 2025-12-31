`timescale 1 ns / 1 ps

`include "../util.svh"

// LUT derived from 10^(dezibel/20)*256 in localc
// Before rounding to integer, a factor of 9/16 is applied to match
// the volume and clipping behavior of the real CDIC output
function [7:0] db_to_linear(bit [7:0] db);
    case (db)
        0: db_to_linear = 8'd144;
        1: db_to_linear = 8'd128;
        2: db_to_linear = 8'd114;
        3: db_to_linear = 8'd102;
        4: db_to_linear = 8'd91;
        5: db_to_linear = 8'd81;
        6: db_to_linear = 8'd72;
        7: db_to_linear = 8'd64;
        8: db_to_linear = 8'd57;
        9: db_to_linear = 8'd51;
        10: db_to_linear = 8'd46;
        11: db_to_linear = 8'd41;
        12: db_to_linear = 8'd36;
        13: db_to_linear = 8'd32;
        14: db_to_linear = 8'd29;
        15: db_to_linear = 8'd26;
        16: db_to_linear = 8'd23;
        17: db_to_linear = 8'd20;
        18: db_to_linear = 8'd18;
        19: db_to_linear = 8'd16;
        20: db_to_linear = 8'd14;
        21: db_to_linear = 8'd13;
        22: db_to_linear = 8'd11;
        23: db_to_linear = 8'd10;
        24: db_to_linear = 8'd9;
        25: db_to_linear = 8'd8;
        26: db_to_linear = 8'd7;
        27: db_to_linear = 8'd6;
        28: db_to_linear = 8'd6;
        29: db_to_linear = 8'd5;
        30: db_to_linear = 8'd5;
        31: db_to_linear = 8'd4;
        32: db_to_linear = 8'd4;
        33: db_to_linear = 8'd3;
        34: db_to_linear = 8'd3;
        35: db_to_linear = 8'd3;
        36: db_to_linear = 8'd2;
        37: db_to_linear = 8'd2;
        38: db_to_linear = 8'd2;
        39: db_to_linear = 8'd2;
        40: db_to_linear = 8'd1;
        41: db_to_linear = 8'd1;
        42: db_to_linear = 8'd1;
        43: db_to_linear = 8'd1;
        44: db_to_linear = 8'd1;
        45: db_to_linear = 8'd1;
        46: db_to_linear = 8'd1;
        47: db_to_linear = 8'd1;
        48: db_to_linear = 8'd1;
        49: db_to_linear = 8'd1;
        50: db_to_linear = 8'd0;
        51: db_to_linear = 8'd0;
        52: db_to_linear = 8'd0;
        53: db_to_linear = 8'd0;
        54: db_to_linear = 8'd0;
        55: db_to_linear = 8'd0;
        56: db_to_linear = 8'd0;
        57: db_to_linear = 8'd0;
        58: db_to_linear = 8'd0;
        59: db_to_linear = 8'd0;
        60: db_to_linear = 8'd0;
        default: db_to_linear = 0;
    endcase
endfunction

module dsp_registers (
    input clk,
    input reset,

    input [7:0] dspa,
    input [7:0] dspd,
    input dspd_strobe,

    output linear_volume_s volume
);

    bit [7:0] mode;
    bit [7:0] target;

    // DEBUG(ma_cntrl(maPath, maMapId, 0x42434445, 0));
    // results into {0x44, 0x43, 0x45, 0x42}; which is
    // {R2R, L2R, R2L, L2L} in dB per digit
    // If [7]==1, then mute
    // If [7]==0, then [6:0] dB attenuation
    // Typical examples use 0x00800080, resulting into
    // L2L full volume, R2R full volume, L2R and R2L are mute
    bit [7:0] volume_reg[4];
    assign volume = {volume_reg[0], volume_reg[1], volume_reg[2], volume_reg[3]};

    bit [1:0] attenuation_write_index;
    bit attenuation_valid;

    always_ff @(posedge clk) begin
        if (dspd_strobe) begin
            case (dspa)
                0: mode <= dspd;
                1: begin
                    target <= dspd;
                    // These values are distilled from cdiemu
                    if (mode == 8'h80 && target == 8'h93) begin
                        attenuation_valid <= 0;
                        attenuation_write_index <= 0;
                    end
                end
            endcase

            if (mode == 8'h80 && target == 8'h93 && dspa == 7) begin
                volume_reg[attenuation_write_index] <= db_to_linear(dspd);
                attenuation_write_index <= attenuation_write_index + 1;
                if (attenuation_write_index == 2'b11) attenuation_valid <= 1;
            end
        end
    end

endmodule
