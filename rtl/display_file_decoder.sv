

module display_file_decoder (
    input clk,
    input reset,
    output bit [21:0] address,
    output bit as,
    input [15:0] din,
    input bus_ack,

    input reload_vsr,
    input [21:0] vsr_in,
    input read_pixels,

    input burstdata_valid,

    pixelstream.source out
);

    bit debug_print_file  /*verilator public_flat_rw*/ = 0;

    bit [21:0] vsr = 22'h0076370;

    assign address = vsr;

    enum {
        IDLE,
        READ
    } state = IDLE;

    bit [2:0] count;
    wire fifo_can_hold_burst = count < 4 && !reset;

    always_ff @(posedge clk) begin
        if (reset) begin
            as <= 0;
            state <= IDLE;
            vsr <= 22'h0;
        end else if (reload_vsr) begin
            state <= IDLE;
            vsr   <= vsr_in;
        end else begin
            case (state)
                IDLE: begin
                    if (read_pixels && fifo_can_hold_burst) begin
                        state <= READ;
                        as <= 1;
                        if (debug_print_file) $display("FILE0: read %x", vsr);
                    end
                end
                READ: begin
                    if (bus_ack) begin
                        vsr <= vsr + 8;
                        as <= 0;
                        state <= IDLE;
                    end
                end
            endcase
        end
    end

    bit [15:0] mem[8];
    bit [2:0] read_index_d;
    bit [2:0] read_index_q;
    bit [2:0] write_index;
    bit [15:0] mem_read;

    bit lower_byte;

    // The memory introduces one cycle delay. This is an issue
    // when the FIFO is empty. We want to avoid using the memory readout
    // when reading from a value that is just written
    bit indizes_equal_during_write_d;
    bit indizes_equal_during_write_q;

    assign out.write = count != 0 && !reset && !indizes_equal_during_write_q;

    always_comb begin
        read_index_d = read_index_q;
        if (out.strobe && lower_byte) read_index_d = read_index_q + 1;

        indizes_equal_during_write_d = write_index == read_index_d && burstdata_valid;
    end

    always_ff @(posedge clk) begin

        if (reset || reload_vsr) begin
            write_index <= 0;
            read_index_q <= 0;
            count <= 0;
            lower_byte <= 0;
            indizes_equal_during_write_q <= 0;
        end else begin
            if (burstdata_valid && !(out.strobe && lower_byte)) count <= count + 1;
            if (!burstdata_valid && (out.strobe && lower_byte)) count <= count - 1;

            if (burstdata_valid) begin
                mem[write_index] <= din;
                write_index <= write_index + 1;
                if (debug_print_file) $display("FILE0: got %x", din);

            end

            if (out.strobe) lower_byte <= !lower_byte;

            mem_read <= mem[read_index_d];
            read_index_q <= read_index_d;
            indizes_equal_during_write_q <= indizes_equal_during_write_d;
        end
    end

    assign out.pixel = lower_byte ? mem_read[7:0] : mem_read[15:8];


endmodule
