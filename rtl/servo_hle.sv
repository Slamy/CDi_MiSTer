
module servo_hle (
    input clk,
    parallelel_spi.slave spi,
    output bit quirk_force_mode_fault
);

    typedef enum bit [6:0] {
        IDLE,
        PROVIDE_RELEASE0,
        PROVIDE_RELEASE1,
        PROVIDE_RELEASE2,
        PROVIDE_RELEASE3,
        PROVIDE_RELEASE4,
        PROVIDE_RELEASE5,
        PROVIDE_UNKNOWN0_0,
        PROVIDE_UNKNOWN0_1,
        PROVIDE_UNKNOWN0_2,
        PROVIDE_UNKNOWN0_3,
        PROVIDE_UNKNOWN0_4,
        PROVIDE_UNKNOWN0_5,
        PROVIDE_UNKNOWN1_0,
        PROVIDE_UNKNOWN1_1,
        PROVIDE_UNKNOWN1_2,
        PROVIDE_UNKNOWN1_3,
        PROVIDE_UNKNOWN1_4,
        PROVIDE_UNKNOWN1_5,
        PROVIDE_UNKNOWN2_0,
        PROVIDE_UNKNOWN2_1,
        PROVIDE_UNKNOWN2_2,
        PROVIDE_UNKNOWN2_3,
        PROVIDE_UNKNOWN2_4,
        PROVIDE_UNKNOWN2_5,
        PROVIDE_UNKNOWN3_0,
        PROVIDE_UNKNOWN3_1,
        PROVIDE_UNKNOWN3_2,
        PROVIDE_UNKNOWN3_3,
        PROVIDE_UNKNOWN3_4,
        PROVIDE_UNKNOWN3_5,
        PROVIDE_B0_0,
        PROVIDE_B0_1,
        PROVIDE_B0_2,
        PROVIDE_B0_3,
        PROVIDE_B0_10,
        PROVIDE_B0_11,
        PROVIDE_B0_12,
        PROVIDE_B0_13,
        PROVIDE_B0_14,
        PROVIDE_B0_15
    } e_state;

    e_state state;
    bit [14:0] mode_fault_cnt = 0;
    bit [14:0] perform_mode_fault;

    always_comb begin
        spi.miso = 8'hff;
        perform_mode_fault = 0;

        if (state == IDLE && spi.write && spi.mosi == 8'hdd) begin
            spi.miso = 8'hee;
            perform_mode_fault = 15'h2ff;
        end

        // verilog_format: off
        if (state == PROVIDE_RELEASE0 && spi.write && spi.mosi == 8'haa) begin spi.miso = 8'hbb; perform_mode_fault = 80; end
        if (state == PROVIDE_RELEASE1 && spi.write && spi.mosi == 8'haa) begin spi.miso = 8'ha3; perform_mode_fault = 80; end
        if (state == PROVIDE_RELEASE2 && spi.write && spi.mosi == 8'haa) begin spi.miso = 8'h41; perform_mode_fault = 80; end
        if (state == PROVIDE_RELEASE3 && spi.write && spi.mosi == 8'haa) begin spi.miso = 8'h00; perform_mode_fault = 80; end
        if (state == PROVIDE_RELEASE4 && spi.write && spi.mosi == 8'haa) begin spi.miso = 8'h00; perform_mode_fault = 80; end
        if (state == PROVIDE_RELEASE5 && mode_fault_cnt==0) begin perform_mode_fault = 15'h2ff; end

        if (state == PROVIDE_UNKNOWN0_0 && spi.write && spi.mosi == 8'haa) begin spi.miso = 8'hab; perform_mode_fault = 80; end
        if (state == PROVIDE_UNKNOWN0_1 && spi.write && spi.mosi == 8'haa) begin spi.miso = 8'haa; perform_mode_fault = 80; end
        if (state == PROVIDE_UNKNOWN0_2 && spi.write && spi.mosi == 8'haa) begin spi.miso = 8'h02; perform_mode_fault = 80; end
        if (state == PROVIDE_UNKNOWN0_3 && spi.write && spi.mosi == 8'haa) begin spi.miso = 8'h00; perform_mode_fault = 80; end
        if (state == PROVIDE_UNKNOWN0_4 && spi.write && spi.mosi == 8'haa) begin spi.miso = 8'h00; perform_mode_fault = 80; end
        if (state == PROVIDE_UNKNOWN0_5 && mode_fault_cnt==0) begin perform_mode_fault = 15'h2ff; end

        if (state == PROVIDE_UNKNOWN1_0 && spi.write && spi.mosi == 8'haa) begin spi.miso = 8'hab; perform_mode_fault = 80; end
        if (state == PROVIDE_UNKNOWN1_1 && spi.write && spi.mosi == 8'haa) begin spi.miso = 8'hb0; perform_mode_fault = 80; end
        if (state == PROVIDE_UNKNOWN1_2 && spi.write && spi.mosi == 8'haa) begin spi.miso = 8'h00; perform_mode_fault = 80; end
        if (state == PROVIDE_UNKNOWN1_3 && spi.write && spi.mosi == 8'haa) begin spi.miso = 8'h00; perform_mode_fault = 80; end
        if (state == PROVIDE_UNKNOWN1_4 && spi.write && spi.mosi == 8'haa) begin spi.miso = 8'h02; perform_mode_fault = 80; end
        if (state == PROVIDE_UNKNOWN1_5 && mode_fault_cnt==0) begin perform_mode_fault = 15'hfff; end

        if (state == PROVIDE_UNKNOWN2_0 && spi.write && spi.mosi == 8'haa) begin spi.miso = 8'hab; perform_mode_fault = 80; end
        if (state == PROVIDE_UNKNOWN2_1 && spi.write && spi.mosi == 8'haa) begin spi.miso = 8'hb0; perform_mode_fault = 80; end
        if (state == PROVIDE_UNKNOWN2_2 && spi.write && spi.mosi == 8'haa) begin spi.miso = 8'h00; perform_mode_fault = 80; end
        if (state == PROVIDE_UNKNOWN2_3 && spi.write && spi.mosi == 8'haa) begin spi.miso = 8'h00; perform_mode_fault = 80; end
        if (state == PROVIDE_UNKNOWN2_4 && spi.write && spi.mosi == 8'haa) begin spi.miso = 8'h11; perform_mode_fault = 80; end
        if (state == PROVIDE_UNKNOWN2_5 && mode_fault_cnt==0) begin perform_mode_fault = 15'h2ff; end

        if (state == PROVIDE_UNKNOWN3_0 && spi.write && spi.mosi == 8'haa) begin spi.miso = 8'hab; perform_mode_fault = 80; end
        if (state == PROVIDE_UNKNOWN3_1 && spi.write && spi.mosi == 8'haa) begin spi.miso = 8'hb0; perform_mode_fault = 80; end
        if (state == PROVIDE_UNKNOWN3_2 && spi.write && spi.mosi == 8'haa) begin spi.miso = 8'h00; perform_mode_fault = 80; end
        if (state == PROVIDE_UNKNOWN3_3 && spi.write && spi.mosi == 8'haa) begin spi.miso = 8'h00; perform_mode_fault = 80; end
        if (state == PROVIDE_UNKNOWN3_4 && spi.write && spi.mosi == 8'haa) begin spi.miso = 8'h0b; perform_mode_fault = 80; end


        if (state == IDLE && spi.write && spi.mosi == 8'hb0)  begin spi.miso = 8'h55; perform_mode_fault = 80; end
        if (state == PROVIDE_B0_0 && spi.write) begin spi.miso = 8'h61; perform_mode_fault = 80; end
        if (state == PROVIDE_B0_1 && spi.write) begin spi.miso = 8'h01; perform_mode_fault = 80; end
        if (state == PROVIDE_B0_2 && spi.write) begin spi.miso = 8'h01; perform_mode_fault = 80; end
        if (state == PROVIDE_B0_3 && mode_fault_cnt==0) begin perform_mode_fault = 15'h2ff; end
        
        if (state == PROVIDE_B0_10 && spi.write) begin spi.miso = 8'h03; perform_mode_fault = 80; end
        if (state == PROVIDE_B0_11 && spi.write) begin spi.miso = 8'hB0; perform_mode_fault = 80; end
        if (state == PROVIDE_B0_12 && spi.write) begin spi.miso = 8'h00; perform_mode_fault = 80; end
        if (state == PROVIDE_B0_13 && spi.write) begin spi.miso = 8'h00; perform_mode_fault = 80; end
        if (state == PROVIDE_B0_14 && spi.write) begin spi.miso = 8'h0B; perform_mode_fault = 80; end

        //if (state == PROVIDE_UNKNOWN1_5 && mode_fault_cnt==0) begin perform_mode_fault = 15'h2ff; end
        // verilog_format: on


        if (spi.write) $display("SERVO %x %x", spi.mosi, spi.miso);
    end

    always_ff @(posedge clk) begin
        if (perform_mode_fault != 0) begin
            mode_fault_cnt <= perform_mode_fault;
        end else if (mode_fault_cnt != 0) begin
            mode_fault_cnt <= mode_fault_cnt - 1;
        end

        quirk_force_mode_fault <= mode_fault_cnt == 1;

        case (state)
            // After some 0xff, the first requerst by SLAVE is 0xDD. We answer with 0xEE
            IDLE: begin
                if (spi.write && spi.mosi == 8'hdd) state <= PROVIDE_RELEASE0;
                if (spi.write && spi.mosi == 8'hb0) begin
                    state <= PROVIDE_B0_0;
                    $display("SERVO was asked B0");
                end
            end

            // Directly afterwards the servo requests communication to the slave
            // It wants to transmit the release number
            PROVIDE_RELEASE0: if (spi.write) state <= PROVIDE_RELEASE1;
            PROVIDE_RELEASE1: if (spi.write) state <= PROVIDE_RELEASE2;
            PROVIDE_RELEASE2: if (spi.write) state <= PROVIDE_RELEASE3;
            PROVIDE_RELEASE3: if (spi.write) state <= PROVIDE_RELEASE4;
            PROVIDE_RELEASE4: if (spi.write) state <= PROVIDE_RELEASE5;
            PROVIDE_RELEASE5: if (mode_fault_cnt == 0) state <= PROVIDE_UNKNOWN0_0;

            // MOSI 0xAA AA AA AA AA
            // MISO 0xAB AA 02 00 00
            PROVIDE_UNKNOWN0_0: if (spi.write) state <= PROVIDE_UNKNOWN0_1;
            PROVIDE_UNKNOWN0_1: if (spi.write) state <= PROVIDE_UNKNOWN0_2;
            PROVIDE_UNKNOWN0_2: if (spi.write) state <= PROVIDE_UNKNOWN0_3;
            PROVIDE_UNKNOWN0_3: if (spi.write) state <= PROVIDE_UNKNOWN0_4;
            PROVIDE_UNKNOWN0_4: if (spi.write) state <= PROVIDE_UNKNOWN0_5;
            PROVIDE_UNKNOWN0_5: if (mode_fault_cnt == 0) state <= PROVIDE_UNKNOWN1_0;

            // MOSI 0xAA AA AA AA AA
            // MISO 0xAB B0 00 00 02
            PROVIDE_UNKNOWN1_0: if (spi.write) state <= PROVIDE_UNKNOWN1_1;
            PROVIDE_UNKNOWN1_1: if (spi.write) state <= PROVIDE_UNKNOWN1_2;
            PROVIDE_UNKNOWN1_2: if (spi.write) state <= PROVIDE_UNKNOWN1_3;
            PROVIDE_UNKNOWN1_3: if (spi.write) state <= PROVIDE_UNKNOWN1_4;
            PROVIDE_UNKNOWN1_4: if (spi.write) state <= PROVIDE_UNKNOWN1_5;
            PROVIDE_UNKNOWN1_5: if (mode_fault_cnt == 0) state <= PROVIDE_UNKNOWN2_0;

            // MOSI 0xAA AA AA AA AA
            // MISO 0xAB B0 00 00 11
            PROVIDE_UNKNOWN2_0: if (spi.write) state <= PROVIDE_UNKNOWN2_1;
            PROVIDE_UNKNOWN2_1: if (spi.write) state <= PROVIDE_UNKNOWN2_2;
            PROVIDE_UNKNOWN2_2: if (spi.write) state <= PROVIDE_UNKNOWN2_3;
            PROVIDE_UNKNOWN2_3: if (spi.write) state <= PROVIDE_UNKNOWN2_4;
            PROVIDE_UNKNOWN2_4: if (spi.write) state <= PROVIDE_UNKNOWN2_5;
            PROVIDE_UNKNOWN2_5: if (mode_fault_cnt == 0) state <= PROVIDE_UNKNOWN3_0;

            // MOSI 0xAA AA AA AA AA
            // MISO 0xAB B0 00 00 0B
            PROVIDE_UNKNOWN3_0: if (spi.write) state <= PROVIDE_UNKNOWN3_1;
            PROVIDE_UNKNOWN3_1: if (spi.write) state <= PROVIDE_UNKNOWN3_2;
            PROVIDE_UNKNOWN3_2: if (spi.write) state <= PROVIDE_UNKNOWN3_3;
            PROVIDE_UNKNOWN3_3: if (spi.write) state <= PROVIDE_UNKNOWN3_4;
            PROVIDE_UNKNOWN3_4: if (spi.write) state <= PROVIDE_UNKNOWN3_5;
            PROVIDE_UNKNOWN3_5: if (mode_fault_cnt == 0) state <= IDLE;

            // MOSI 0xB0 00 00 00
            // MISO 0x55 61 01 01
            PROVIDE_B0_0:  if (spi.write) state <= PROVIDE_B0_1;
            PROVIDE_B0_1:  if (spi.write) state <= PROVIDE_B0_2;
            PROVIDE_B0_2:  if (spi.write) state <= PROVIDE_B0_3;
            PROVIDE_B0_3:  if (mode_fault_cnt == 0) state <= PROVIDE_B0_10;
            // MOSI 0xAA AA AA AA AA
            // MISO 0x03 B0 00 00 0B
            PROVIDE_B0_10: if (spi.write) state <= PROVIDE_B0_11;
            PROVIDE_B0_11: if (spi.write) state <= PROVIDE_B0_12;
            PROVIDE_B0_12: if (spi.write) state <= PROVIDE_B0_13;
            PROVIDE_B0_13: if (spi.write) state <= PROVIDE_B0_14;
            PROVIDE_B0_14: if (spi.write) state <= PROVIDE_B0_15;
            PROVIDE_B0_15: if (mode_fault_cnt == 0) state <= IDLE;

            default: begin
            end
        endcase
    end

endmodule
