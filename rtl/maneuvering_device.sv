module maneuvering_device (
    input clk,
    input wire [15:0] mister_joystick,
    input rts,
    bytestream.source serial_out
);

    typedef enum bit [1:0] {
        DEVICE_ID,  // Always start with this after RTS is asserted
        BYTE0,  // 1 1 B1 B2 Y7 Y6 X7 X6
        BYTE1,  // 1 0 X5 X4 X3 X2 X1 X0
        BYTE2  // 1 0 Y5 Y4 Y3 Y2 Y1 Y0
    } e_state;

    e_state state;
    bit [18:0] cnt;
    bit [7:0] frame[3];

    bit perform_transmit;

    wire b1 = mister_joystick[5];
    wire b2 = mister_joystick[4];

    bit b1_q, b2_q;

    bit signed [7:0] x;
    bit signed [7:0] y;

    bit signed [7:0] x_q;
    bit signed [7:0] y_q;
    bit [3:0] speed;

    always_comb begin
        x = 0;
        y = 0;

        // The spoon has a short amount of time where it moves 2 ticks per frame
        // After a while it switches itself to 8 ticks per frame
        // We are overclocking the spoon, changing 8 to 2 and 2 to 1
        if (speed >= 5) begin
            if (mister_joystick[0]) x = 2;
            if (mister_joystick[2]) y = 2;
            if (mister_joystick[1]) x = -2;
            if (mister_joystick[3]) y = -2;
        end else begin
            if (mister_joystick[0]) x = 1;
            if (mister_joystick[2]) y = 1;
            if (mister_joystick[1]) x = -1;
            if (mister_joystick[3]) y = -1;
        end

        // Only transmit when buttons have changed or when we are moving the cursor
        // Even so, the speed is not changed, we must transmit permanently.
        perform_transmit = (b1 != b1_q) || (b2 != b2_q) || (x != x_q) || (y != y_q) || (x !=0 ) || (y !=0 );
    end

    always_ff @(posedge clk) begin
        if (serial_out.write) $display("INPUT SERIAL %x", serial_out.data);
    end
    always_ff @(posedge clk) begin
        serial_out.write <= 0;

        if (rts) begin
            state <= DEVICE_ID;
            cnt   <= 225000 / 4;  // Not accurate but feels better
        end else if (cnt != 0) begin
            cnt <= cnt - 1;
        end else begin
            cnt <= 225000 / 4;  // Not accurate but feels better

            case (state)
                DEVICE_ID: begin
                    serial_out.data <= 8'hCA;
                    state <= BYTE0;
                    serial_out.write <= 1;

                end
                BYTE0: begin
                    if (perform_transmit) begin
                        serial_out.data <= frame[0];
                        state <= BYTE1;
                        serial_out.write <= 1;

                        // store for next comparsion
                        x_q <= x;
                        y_q <= y;
                        b1_q <= b1;
                        b2_q <= b2;
                    end
                end
                BYTE1: begin
                    serial_out.data <= frame[1];
                    state <= BYTE2;
                    serial_out.write <= 1;

                end
                BYTE2: begin
                    serial_out.data <= frame[2];
                    state <= BYTE0;
                    serial_out.write <= 1;

                end
            endcase
        end


        // change whole frame at the same time before transmitting the next
        if (cnt == 10 && state == BYTE0) begin
            frame[0] <= {2'b11, b1, b2, y[7:6], x[7:6]};
            frame[1] <= {2'b10, x[5:0]};
            frame[2] <= {2'b10, y[5:0]};

            if (mister_joystick[3:0] == 0) begin
                speed <= 0;
            end else if (mister_joystick[3:0] != 0 && speed < 7) begin
                speed <= speed + 1;
            end
        end
    end
endmodule

