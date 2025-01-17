
module servo_hle (
    input clk,
    input reset,
    parallelel_spi.slave spi,
    output bit quirk_force_mode_fault,
    input debug_audio_cd_in_tray
);

    typedef enum bit [6:0] {
        IDLE,
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
            // After some 0xff, the first requerst by SLAVE is 0xDD. We answer with 0xEE
            spi.miso = 8'hee;
        end

        // verilog_format: off
        if (state == IDLE && spi.write && spi.mosi == 8'hb0)  begin spi.miso = 8'h55; perform_mode_fault = 80; end
        if (state == PROVIDE_B0_0 && spi.write) begin spi.miso = 8'h61; perform_mode_fault = 80; end
        if (state == PROVIDE_B0_1 && spi.write) begin spi.miso = 8'h01; perform_mode_fault = 80; end
        if (state == PROVIDE_B0_2 && spi.write) begin spi.miso = 8'h01; perform_mode_fault = 80; end
        if (state == PROVIDE_B0_3 && mode_fault_cnt==0) begin perform_mode_fault = 15'h2ff; end

        // MOSI 0xAA AA AA AA AA
        // MISO 0x03 B0 00 02 15 to fake closed try with CD-i inside
        if (state == PROVIDE_B0_10 && spi.write) begin spi.miso = 8'h03; perform_mode_fault = 80; end
        if (state == PROVIDE_B0_11 && spi.write) begin spi.miso = 8'hB0; perform_mode_fault = 80; end
        if (state == PROVIDE_B0_12 && spi.write) begin spi.miso = 8'h00; perform_mode_fault = 80; end
        if (state == PROVIDE_B0_13 && spi.write) begin spi.miso = debug_audio_cd_in_tray ? 8'h01 : 8'h02 ; perform_mode_fault = 80; end
        if (state == PROVIDE_B0_14 && spi.write) begin spi.miso = 8'h25; perform_mode_fault = 80; end
        // verilog_format: on
        if (spi.write) $display("SERVO %x %x", spi.mosi, spi.miso);
    end

    always_ff @(posedge clk) begin

        if (reset) begin
            mode_fault_cnt <= 0;
            quirk_force_mode_fault <= 0;
            state <= IDLE;
        end else begin
            if (perform_mode_fault != 0) begin
                mode_fault_cnt <= perform_mode_fault;
            end else if (mode_fault_cnt != 0) begin
                mode_fault_cnt <= mode_fault_cnt - 1;
            end

            quirk_force_mode_fault <= mode_fault_cnt == 1;

            case (state)
                IDLE: begin
                    if (spi.write && spi.mosi == 8'hb0) begin
                        state <= PROVIDE_B0_0;
                        $display("SERVO was asked B0");
                    end
                end

                // MOSI 0xB0 00 00 00
                // MISO 0x55 61 01 01
                PROVIDE_B0_0: if (spi.write) state <= PROVIDE_B0_1;
                PROVIDE_B0_1: if (spi.write) state <= PROVIDE_B0_2;
                PROVIDE_B0_2: if (spi.write) state <= PROVIDE_B0_3;
                PROVIDE_B0_3: if (mode_fault_cnt == 0) state <= PROVIDE_B0_10;

                // MOSI 0xAA AA AA AA AA
                // MISO 0x03 B0 00 02 15 to fake closed try with CD-i inside
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
    end

endmodule
