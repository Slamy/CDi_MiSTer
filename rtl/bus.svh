

interface bus68k (
    input clk
);
    bit write_strobe;
    bit as;
    bit lds;
    bit uds;
    bit [15:0] data_out;
    bit [23:1] addr;
    bit bus_ack;
    bit [15:0] data_in;

    modport master(output write_strobe, as, lds, uds, data_out, addr, input bus_ack, data_in);
    modport slave(input write_strobe, as, lds, uds, data_out, addr, output bus_ack, data_in);

endinterface


interface pixelstream (
    input clk
);

    bit write;
    bit strobe;
    bit [7:0] pixel;

    modport source(output write, pixel, input strobe);
    modport sink(input write, pixel, output strobe);
endinterface
