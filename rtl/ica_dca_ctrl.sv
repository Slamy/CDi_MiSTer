`include "bus.svh"

module ica_dca_ctrl (
    input clk,
    input reset,
    output bit [21:0] address,
    output bit as,
    input [15:0] din,
    input bus_ack,

    output [6:0] register_adr,
    output [23:0] register_data,
    output register_write,

    output reload_vsr,
    output [21:0] vsr,

    output bit irq,
    output display_parameters_s disp_params
);

    parameter bit unit_index = 0;
    localparam bit [21:0] odd_ica_start = 22'h400;
    localparam bit [21:0] even_ica_start = 22'h404;

    (* keep *) bit [21:0] ica_pointer;
    bit [21:0] dca_pointer;
    (* keep *) bit [31:0] instruction;

    enum bit [3:0] {
        IDLE,
        READ0,
        READ1,
        EXECUTE,
        STOPPED
    } state;

    assign register_adr = instruction[30:24];
    assign register_data = instruction[23:0];
    assign register_write = state == EXECUTE && instruction[31];

    assign vsr = instruction[21:0];
    assign reload_vsr = state == EXECUTE && instruction[31:28] == 5;

    always_ff @(posedge clk) begin
        if (register_write)
            $display(
                "ICA%d Write %x %x %b",
                unit_index,
                {
                    1'b1, register_adr
                },
                register_data,
                register_data
            );
    end

    bit cm;
    bit mf1;
    bit mf2;
    bit ft1;
    bit ft2;

    always_ff @(posedge clk) begin
        irq <= 0;
        disp_params.strobe <= 0;

        if (reset) begin
            ica_pointer <= odd_ica_start;
            as <= 0;
            state <= IDLE;

            disp_params.cm <= 0;
            disp_params.mf1 <= 0;
            disp_params.mf2 <= 0;
            disp_params.ft1 <= 0;
            disp_params.ft2 <= 0;
            instruction <= 0;
        end else begin
            case (state)
                IDLE: begin
                    state <= READ0;
                    address <= ica_pointer;
                    ica_pointer <= ica_pointer + 2;
                    $display("ICA%d Start reading at %x", unit_index, ica_pointer);
                    as <= 1;
                end
                READ0: begin
                    if (bus_ack) begin
                        instruction[31:16] <= din;
                        state <= READ1;
                        address <= ica_pointer;
                        ica_pointer <= ica_pointer + 2;
                    end
                end
                READ1: begin
                    if (bus_ack) begin
                        instruction[15:0] <= din;
                        state <= EXECUTE;
                        as <= 0;
                    end
                end
                EXECUTE: begin
                    $display("ICA%d instruction %x", unit_index, instruction);

                    case (instruction[31:28])
                        0: begin
                            // stop until next field
                            state <= STOPPED;
                            $display("ICA%d STOP", unit_index);

                        end
                        1: begin
                            // no operation
                            state <= IDLE;
                            $display("ICA%d NOP", unit_index);
                        end
                        2: begin
                            // reload dcp
                            dca_pointer <= instruction[21:0];
                            $display("ICA%d Reload DCP %x", unit_index, instruction[21:0]);
                            state <= IDLE;
                        end
                        3: begin
                            // reload dcp and stop
                            dca_pointer <= instruction[21:0];
                            $display("ICA%d Reload DCP and STOP %x", unit_index, instruction[21:0]);
                            state <= STOPPED;
                        end
                        4: begin
                            // reload ica pointer
                            ica_pointer <= instruction[21:0];
                            $display("ICA%d Reload ICA %x", unit_index, instruction[21:0]);
                            state <= IDLE;
                        end
                        5: begin
                            // reload vsr pointer and stop
                            $display("ICA%d Reload VSR and STOP %x", unit_index, instruction[21:0]);
                            state <= STOPPED;
                        end
                        6: begin
                            // interrupt
                            $display("ICA%d INTERRUPT", unit_index);
                            state <= IDLE;
                            irq   <= 1;
                        end
                        7: begin
                            // reload display parameters
                            //assert(instruction[27]);
                            //assert(!instruction[5]);

                            if (instruction[27]) begin
                                disp_params.cm <= instruction[4];
                                disp_params.mf1 <= instruction[3];
                                disp_params.mf2 <= instruction[2];
                                disp_params.ft1 <= instruction[1];
                                disp_params.ft2 <= instruction[0];
                                disp_params.strobe <= 1;

                                $display("ICA%d RELOAD DISPLAY PARAMETERS %b", unit_index,
                                         instruction[4:0]);
                            end

                            state <= IDLE;
                        end
                        default: begin
                            // no command but probably a register write
                            state <= IDLE;
                        end
                    endcase
                end
                STOPPED: begin
                    // Do nothing until reset
                end
                default: begin
                end

            endcase
        end
    end

endmodule
