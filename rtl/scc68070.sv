// SCC68070
// Uses https://github.com/Slamy/TG68K.C as a fork of TG68k core with some modifications
// TODO UART implementation which can be used on a real MiSTer to run the selftest
// TODO MMU (not required for system boot)
// TODO DMA (not required for system boot)

module scc68070 (
    input clk,
    input reset,
    output write_strobe,
    output as,
    output lds,
    output uds,
    input bus_ack,
    input bus_err,
    input int1,  // latched interrupt input
    input int2,  // latched interrupt input
    input in2,  // decoded interrupt priority
    input in4,  // decoded interrupt priority
    input in5,  // decoded interrupt priority
    input [15:0] data_in,
    output [15:0] data_out,
    output [23:1] addr,
    output uart_tx,
    input uart_rx,
    input debug_uart_loopback,
    input debug_uart_fake_space
);

    wire nResetOut;
    wire skipFetch;
    wire [1:0] busstate;
    wire [2:0] fc;
    wire [31:0] internal_addr;

    wire internal_LDSn;
    wire internal_UDSn;
    wire internal_nWr;
    bit clkena_in  /*verilator public_flat_rd*/;

    assign addr = internal_addr[23:1];


    struct packed {
        bit [2:0] int1n_ipl;
        bit [2:0] int2n_ipl;
    } lir;

    struct packed {
        bit [2:0] i2c_ipl;
        bit [2:0] timer_ipl;
    } picr1;

    struct packed {
        bit [2:0] uart_rx_ipl;
        bit [2:0] uart_tx_ipl;
    } picr2;

    struct packed {
        bit [1:0] t1_event;
        bit [1:0] t1_mode;
        bit [1:0] t2_event;
        bit [1:0] t2_mode;
    } timer_control_register;

    struct packed {
        bit t0_ov;
        bit t1_ma;
        bit t1_cap;
        bit t1_ov;
        bit t2_ma;
        bit t2_cap;
        bit t2_ov;
        bit reserved;
    } timer_status_register;



    (* keep *) bit [15:0] internal_data_in;

    // UART is from 0x1008 to 0x100D
    wire soc_periph = internal_addr[31];

    wire internal_lds = !internal_LDSn;
    wire internal_uds = !internal_UDSn;

    assign as = !soc_periph && !skipFetch;
    assign lds = !soc_periph && internal_lds;
    assign uds = !soc_periph && internal_uds;
    assign write_strobe = !internal_nWr;

    wire lir_cs = soc_periph && addr[15:1] == 15'h0800;
    wire i2c_cs = soc_periph && addr[15:1] >= 15'h1000 && addr[15:1] <= 15'h1004;
    wire uart_cs = soc_periph && addr[15:1] >= 15'h1008 && addr[15:1] <= 15'h100D;
    wire timer_cs = soc_periph && addr[15:1] >= 15'h1010 && addr[15:1] <= 15'h1014;
    wire picr1_cs = soc_periph && addr[15:1] == 15'h1022;
    wire picr2_cs = soc_periph && addr[15:1] == 15'h1023;
    wire dma_cs = soc_periph && addr[15:1] >= 15'h2000 && addr[15:1] <= 15'h2036;
    wire mmu_cs = soc_periph && addr[15:1] >= 15'h4000 && addr[15:1] <= 15'h403F;

    bit [2:0] ipl;
    bit [2:0] ipl_q;
    bit [7:0] autovector_lut;

    wire irq_ack = (fc == 3'b111);
    wire [2:0] ack_ipl = addr[3:1];

    wire autovector = autovector_lut[ack_ipl];
    bit autovector_q;

    always_comb begin
        ipl = 0;
        autovector_lut = 8'hff;

        // IPL 1, 3 and 6 are only internal
        // IPL 2, 4, 5 and 7 are external
        if (in2) ipl = 2;
        if (in4) ipl = 4;
        if (in5) ipl = 5;

        if (timer_status_register.t0_ov && picr1.timer_ipl != 0) begin
            ipl = picr1.timer_ipl;
            autovector_lut[ipl] = 0;
        end
    end

    always_ff @(posedge clk) begin
        ipl_q <= ipl;
        autovector_q <= autovector;

        if (ipl_q != ipl) $display("IPL %d", ipl);
    end


    tg68kdotc_verilog_wrapper tg68 (
        .clk(clk),
        .nReset(!reset),
        .clkena_in(clkena_in),
        .data_in(internal_data_in),
        .IPL(~ipl),
        .IPL_autovector(autovector_q),
        .berr(bus_err),
        .addr_out(internal_addr),
        .FC(fc),
        .data_write(data_out),
        .busstate(busstate),
        .nWr(internal_nWr),
        .nUDS(internal_UDSn),
        .nLDS(internal_LDSn),
        .nResetOut(nResetOut),
        .skipFetch(skipFetch)
    );

    struct packed {
        bit [1:0] channel_mode;
        bit reserved;
        bit ctsn_enable;
        bit parity_control;
        bit parity_type;
        bit stop_bit_length;
        bit character_length;
    } uart_mode_register;

    struct packed {
        bit received_break;
        bit framing_error;
        bit parity_error;
        bit overrun_error;
        bit tx_emt;
        bit tx_rdy;
        bit reserved;
        bit rx_rdy;
    } uart_status_register  /*verilator public_flat_rw*/;

    bit [7:0] uart_receive_holding_register  /*verilator public_flat_rw*/ = 0;
    bit uart_receive_holding_valid = 0;
    bit [7:0] uart_transmit_holding_register  /*verilator public_flat_rd*/ = 0;
    bit uart_transmit_holding_valid  /*verilator public_flat_rw*/ = 0;
    wire uart_tx_data_ready;

    always_comb begin
        uart_status_register = 0;
        uart_status_register.rx_rdy = uart_receive_holding_valid;
        uart_status_register.tx_rdy = !uart_transmit_holding_valid;
        uart_status_register.tx_emt = uart_tx_data_ready;
    end

    bit [15:0] timer_reload_register  /*verilator public_flat_rd*/;
    bit [15:0] timer0  /*verilator public_flat_rd*/;
    bit [15:0] timer1;
    bit [15:0] timer2;

    always_ff @(posedge clk) begin
        if (reset) begin
            timer_status_register.t0_ov <= 0;
        end else if (timer0 == 16'hffff) begin
            timer_status_register.t0_ov <= 1;
            if (timer_status_register.t0_ov == 0) $display("Timer 0 Overflow On!");

        end else if (timer_cs && internal_uds && write_strobe && addr[3:1] == 3'd0 && data_out[15]) begin
            timer_status_register.t0_ov <= 0;
            if (timer_status_register.t0_ov == 1) $display("Timer 0 Overflow Off!");
        end
    end

    bit [6:0] timer0_internal_cnt = 0;

    always_ff @(posedge clk) begin
        if (reset) begin
            timer0 <= 0;
            timer0_internal_cnt <= 0;
        end else if (timer0 == 16'hffff) begin
            timer0 <= timer_reload_register;
            timer0_internal_cnt <= 0;
            // $display("Reload Timer 0 with %x", timer_reload_register);
        end else if (timer_cs && (internal_lds || internal_uds) && write_strobe && addr[3:1] == 3'd2) begin
            timer0 <= data_out;
            timer0_internal_cnt <= 0;
            $display("Load Timer 0 with %x", data_out);
        end else if (timer0_internal_cnt == 95) begin
            timer0 <= timer0 + 1;
            timer0_internal_cnt <= 0;
        end else begin
            timer0_internal_cnt <= timer0_internal_cnt + 1;
        end
    end

    bit  debug_print_active  /*verilator public_flat_rd*/ = 0;

    wire memory_access = !skipFetch && bus_ack && (internal_lds || internal_uds);

    always_ff @(posedge clk) begin
        if (reset) begin
            lir <= 0;
        end else if (lir_cs && internal_lds && write_strobe) begin
            lir.int2n_ipl <= data_out[2:0];
            lir.int1n_ipl <= data_out[6:4];
        end

        if (debug_print_active) begin
            if (memory_access && !write_strobe && !reset) begin
                $display("CPU Read Access %x %x", internal_addr, internal_data_in);
            end

            if (memory_access && write_strobe && !reset) begin
                $display("CPU Write Access %x %x", internal_addr, data_out);
            end
        end

        if (memory_access && internal_addr == 32'h00002cc4) begin
            if (!write_strobe && !reset) begin
                $display("CPU Read Access %x %x", internal_addr, internal_data_in);
            end

            if (write_strobe && !reset) begin
                $display("CPU Write Access %x %x", internal_addr, data_out);
            end
        end

        if (lir_cs && (internal_lds || internal_uds)) begin
            $display("LIR Access %x %x %d %d %d", addr[3:1], data_out[7:0], write_strobe,
                     internal_uds, internal_lds);
        end
        if (picr2_cs && (internal_lds || internal_uds)) begin
            $display("PICR2 Access %x %x %d %d %d", addr[3:1], data_out[7:0], write_strobe,
                     internal_uds, internal_lds);

            if (write_strobe && internal_lds) begin
                picr2.uart_rx_ipl <= data_out[5:3];
                picr2.uart_tx_ipl <= data_out[2:0];
            end
        end
        if (picr1_cs && (internal_lds || internal_uds)) begin
            $display("PICR1 Access %x %x %d %d %d", addr[3:1], data_out[7:0], write_strobe,
                     internal_uds, internal_lds);

            if (write_strobe && internal_lds) begin
                picr1.i2c_ipl   <= data_out[5:3];
                picr1.timer_ipl <= data_out[2:0];
                $display("Timer IPL set to %d", data_out[2:0]);
            end
        end
        if (i2c_cs && (internal_lds || internal_uds)) begin
            $display("I2C Access %x %x %d", addr[3:1], data_out[7:0], write_strobe);
        end
        if (timer_cs && (internal_lds || internal_uds) && write_strobe) begin
            $display("Timer Write %x %x %d %d %d", addr[3:1], data_out, write_strobe, internal_uds,
                     internal_lds);

            if (write_strobe && addr[3:1] == 3'b1 && internal_uds)
                timer_reload_register[15:8] <= data_out[15:8];
            if (write_strobe && addr[3:1] == 3'b1 && internal_lds)
                timer_reload_register[7:0] <= data_out[7:0];
        end
        if (timer_cs && (internal_lds || internal_uds) && !write_strobe) begin
            $display("Timer Read %x %x %d %d %d", addr[3:1], internal_data_in, write_strobe,
                     internal_uds, internal_lds);
        end
        if (dma_cs && (internal_lds || internal_uds)) begin
            $display("DMA Access %x %x %d", addr[3:1], data_out[7:0], write_strobe);
        end
        if (mmu_cs && (internal_lds || internal_uds)) begin
            $display("MMU Access %x %x %d", addr[3:1], data_out[7:0], write_strobe);
        end

        /* UART Memory map A[3:1]
           0 Mode Register
           1 Status Register
           2 Clock Select Register
           3 Command Register
           4 Transmit Holding Register
           5 Receive Holding Register
        */
        if (uart_cs && internal_lds && write_strobe) begin
            $display("UART Write %x %x %x", addr[3:1], data_out[7:0], {addr, 1'b0});

            case (addr[3:1])
                3'd0: uart_mode_register <= data_out[7:0];
                3'd4: begin
                    $display("UART char %c", data_out[7:0]);
                end
                default: ;
            endcase
        end

        if (uart_cs && internal_lds && !write_strobe) begin
            //$display("UART Read %x %x", addr[3:1], internal_data_in[7:0]);
        end
    end

    bit [7:0] uart_rx_data  /*verilator public_flat_rw*/;
    bit uart_rx_data_valid  /*verilator public_flat_rw*/;

    bit [17:0] debug_uart_fake_space_cnt = 0;
    bit debug_uart_fake_space_timed = 0;
    always_ff @(posedge clk) begin
        if (reset) begin
            debug_uart_fake_space_cnt <= 0;
        end else if (debug_uart_fake_space_cnt < 40000) begin
            debug_uart_fake_space_cnt   <= debug_uart_fake_space_cnt + 1;
            debug_uart_fake_space_timed <= debug_uart_fake_space;
        end else begin
            debug_uart_fake_space_timed <= 0;
        end
    end

    uart_rx #(
        .CLK_FRE  (30),
        .BAUD_RATE(115200)
    ) uart_rx_inst (
        .clk          (clk),
        .rst_n        (!reset),
        .rx_data      (uart_rx_data),
        .rx_data_valid(uart_rx_data_valid),
        .rx_data_ready(1'b1),                // always ready
        .rx_pin       (uart_rx)
    );

    uart_tx #(
        .CLK_FRE  (30),
        .BAUD_RATE(115200)
    ) uart_tx_inst (
        .clk(clk),
        .rst_n(!reset),
        .tx_data(debug_uart_loopback ? uart_rx_data : uart_transmit_holding_register),
        .tx_data_valid(debug_uart_loopback ? uart_rx_data_valid : (uart_transmit_holding_valid && uart_tx_data_ready)),
        .tx_data_ready(uart_tx_data_ready),
        .tx_pin(uart_tx)
    );

    always_ff @(posedge clk) begin
        if (reset) begin
            uart_receive_holding_register <= 0;
            uart_receive_holding_valid <= 0;
            uart_transmit_holding_valid <= 0;
            uart_transmit_holding_register <= 0;
        end else begin
            if (debug_uart_fake_space_timed) begin
                uart_receive_holding_register <= 8'h20;
                uart_receive_holding_valid <= 1;
            end else if (uart_rx_data_valid) begin
                uart_receive_holding_register <= uart_rx_data;
                uart_receive_holding_valid <= 1;
            end else if (uart_cs && addr[3:1] == 3'd5 && internal_lds && !write_strobe) begin
                uart_receive_holding_valid <= 0;
            end

            if (uart_cs && addr[3:1] == 3'd4 && internal_lds && write_strobe) begin
                uart_transmit_holding_register <= data_out[7:0];
                uart_transmit_holding_valid <= 1;
            end else if (uart_transmit_holding_valid && uart_tx_data_ready)
                uart_transmit_holding_valid <= 0;
        end
    end



    always_comb begin
        internal_data_in = data_in;
        clkena_in = bus_ack || skipFetch || (!internal_lds && !internal_uds);

        if (internal_addr == 32'hffff_fffc) begin
            // On-Chip Autovector for Timer
            internal_data_in = 16'd62;
        end

        if (uart_cs) begin
            clkena_in = 1;
            internal_data_in[15:8] = 0;

            case (addr[3:1])
                3'd1: internal_data_in[7:0] = uart_status_register;
                3'd5: internal_data_in[7:0] = uart_receive_holding_register;
                default: internal_data_in[7:0] = 8'h00;
            endcase
        end else if (picr1_cs) begin
            internal_data_in[15:8] = {1'b0, picr1.i2c_ipl, 1'b0, picr1.timer_ipl};
            internal_data_in[7:0]  = {1'b0, picr1.i2c_ipl, 1'b0, picr1.timer_ipl};
        end else if (picr2_cs) begin
            internal_data_in[15:8] = {1'b0, picr2.uart_rx_ipl, 1'b0, picr2.uart_tx_ipl};
            internal_data_in[7:0]  = {1'b0, picr2.uart_rx_ipl, 1'b0, picr2.uart_tx_ipl};


        end else if (timer_cs) begin
            case (addr[3:1])
                3'd0: internal_data_in = {timer_status_register, timer_control_register};
                3'd1: internal_data_in = timer_reload_register;
                3'd2: internal_data_in = timer0;
                3'd3: internal_data_in = timer1;
                3'd4: internal_data_in = timer2;
                default: internal_data_in = 0;
            endcase
        end
    end
endmodule
