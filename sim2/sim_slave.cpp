// Include common routines
#include <verilated.h>
#include <verilated_vcd_c.h>

// Include model header, generated from Verilating "top.v"
#include "Vtb_slave.h"
#include "Vtb_slave___024root.h"

#include <csignal>
#include <cstdio>
#include <cstdlib>

int sim_time = 0;

static bool kDoTrace{true};

volatile sig_atomic_t status = 0;

static void catch_function(int signo) {
    status = signo;
}

int main(int argc, char **argv) {
    // Initialize Verilators variables
    Verilated::commandArgs(argc, argv);

    if (kDoTrace)
        Verilated::traceEverOn(true);

    VerilatedVcdC m_trace;
    Vtb_slave dut;

    if (signal(SIGINT, catch_function) == SIG_ERR) {
        fputs("An error occurred while setting a signal handler.\n", stderr);
        return EXIT_FAILURE;
    }

    dut.trace(&m_trace, 5);

    if (kDoTrace)
        m_trace.open("waveform.vcd");

    dut.irq = 1;

    dut.portc_in = 0b11111111;
    dut.portd_in = 0x7f;

    for (int y = 0; y < 301030; y++) {
        dut.clk = !dut.clk;
        dut.eval();

        if (status == SIGINT)
            break;
    }

    for (int y = 0; y < 601030; y++) {
        dut.clk = !dut.clk;
        dut.eval();

        if (status == SIGINT)
            break;
    }

    for (int y = 0; y < 101030; y++) {
        dut.clk = !dut.clk;
        dut.eval();
        if (kDoTrace) {
            m_trace.dump(sim_time);
            sim_time++;
        }
        if (status == SIGINT)
            break;
    }

    dut.irq = 0;
    dut.porta_in = 0xf0;

    for (int y = 0; y < 10; y++) {
        dut.clk = !dut.clk;
        dut.eval();
        if (kDoTrace) {
            m_trace.dump(sim_time);
            sim_time++;
        }
    }
    dut.irq = 1;

    for (int y = 0; y < 18800; y++) {
        dut.clk = !dut.clk;
        dut.eval();
        if (kDoTrace) {
            m_trace.dump(sim_time);
            sim_time++;
        }

        if (status == SIGINT)
            break;
    }

    dut.irq = 0;
    dut.porta_in = 0xf0;
    dut.portc_in = 0b11111111;
    dut.portd_in = 0xff;

    for (int y = 0; y < 20; y++) {
        dut.clk = !dut.clk;
        dut.eval();
        if (kDoTrace) {
            m_trace.dump(sim_time);
            sim_time++;
        }
    }
    dut.irq = 1;
    for (int y = 0; y < 8800; y++) {
        dut.clk = !dut.clk;
        dut.eval();
        if (kDoTrace) {
            m_trace.dump(sim_time);
            sim_time++;
        }
        if (status == SIGINT)
            break;
    }

    fprintf(stderr, "Closing...\n");
    fflush(stdout);

    return 0;
}
