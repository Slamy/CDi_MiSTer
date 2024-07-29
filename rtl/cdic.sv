// CD-Interface Controller
// TODO implement audio
// TODO implement CD reading

module cdic (
    input clk,
    input reset,
    input [23:1] address,
    input [15:0] din,
    output bit [15:0] dout,
    input uds,
    input lds,
    input write_strobe,
    input cs,
    output bit bus_ack
);

    // most info is from https://github.com/cdifan/cdichips/blob/master/ims66490cdic.md
    // or MAME
    // CDIC memory should be from 0x0000 ot 0x3C7F according to the low level test
    // All access must be word aligned according to ims66490cdic.md

    // 16 kB of CDIC memory
    bit [15:0] ram[8192];
    bit [15:0] ram_readout;

    wire access = cs && uds && lds;
    bit access_q = 0;

    always_ff @(posedge clk) begin
        if (reset) begin
            bus_ack <= 0;
        end else begin
            if (address[13:1] <= 13'h1E3F && access && write_strobe && !bus_ack) begin
                ram[address[13:1]] <= din;
                $display("CDIC Write RAM %x %x", address[13:1], din);
            end else begin
                ram_readout <= ram[address[13:1]];

                if (access && address[13:1] <= 13'h1E3F && bus_ack)
                    $display("CDIC Read RAM %x %x", address[13:1], dout);
            end

            if (bus_ack) bus_ack <= 0;
            else if (access) begin
                bus_ack <= 1;
            end
        end
    end


    always_ff @(posedge clk) begin
        access_q <= access;
    end

    always_comb begin
        dout = 16'h0;

        case (address[13:1])
            13'h001FFA: begin  // 0x3FF4  ABUF	Audio buffer register
                dout = 16'h0;
            end
            13'h001FFB: begin  // 0x3FF6  XBUF	Extra buffer register
                dout = 16'h0;
            end
            13'h001FFD: begin  // 0x3FFA  AUDCTL	Audio control register
                //$display("Audio control!");
                dout = 16'hd7fe;
            end
            13'h001FFE: begin  // 0x3FFC  IVEC	Interrupt vector register
                //$display("IVEC");
                dout = 16'h0;
            end
            13'h001FFF: begin  // 0x3FFE  DBUF	Data buffer register
                //$display("DBUF");
                dout = 16'h0;
            end
            default: begin
                dout = ram_readout;
            end
        endcase
    end

endmodule
