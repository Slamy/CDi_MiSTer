// Include common routines
#include <verilated.h>
#include <verilated_vcd_c.h>

// Include model header, generated from Verilating "top.v"
#include "Vemu.h"
#include "Vemu___024root.h"

#include <csignal>
#include <cstdio>
#include <cstdlib>
#include <png.h>

uint64_t sim_time = 0;

static bool kDoTrace{true};

volatile sig_atomic_t status = 0;

static void catch_function(int signo) {
    status = signo;
}
const int width = 120 * 16;
const int height = 600;
const int size = width * height * 3;

uint8_t output_image[size] = {0};

void write_png_file(const char *filename) {
    int y;

    FILE *fp = fopen(filename, "wb");
    if (!fp)
        abort();

    png_structp png = png_create_write_struct(PNG_LIBPNG_VER_STRING, NULL, NULL, NULL);
    if (!png)
        abort();

    png_infop info = png_create_info_struct(png);
    if (!info)
        abort();

    if (setjmp(png_jmpbuf(png)))
        abort();

    png_init_io(png, fp);

    // Output is 8bit depth, RGBA format.
    png_set_IHDR(png, info, width, height, 8, PNG_COLOR_TYPE_RGB, PNG_INTERLACE_NONE, PNG_COMPRESSION_TYPE_DEFAULT,
                 PNG_FILTER_TYPE_DEFAULT);
    png_write_info(png, info);

    png_bytepp row_pointers = (png_bytepp)png_malloc(png, sizeof(png_bytepp) * height);

    // output_image[1] = 255;
    for (int i = 0; i < height; i++) {
        row_pointers[i] = &output_image[width * 3 * i];
    }

    png_write_image(png, row_pointers);
    png_write_end(png, NULL);

    free(row_pointers);

    fclose(fp);

    png_destroy_write_struct(&png, &info);
}

void clock(VerilatedVcdC &m_trace, Vemu &dut) {

    for (int i = 0; i < 2; i++) {
        dut.rootp->emu__DOT__clk_sys = (sim_time & 1);
        dut.eval();
        if (kDoTrace) {
            m_trace.dump(sim_time);
        }
        sim_time++;
    }
}

void loadfile(VerilatedVcdC &m_trace, Vemu &dut) {

    FILE *f = fopen("68ktest.bin", "rb");
    assert(f);

    uint16_t transferword;

    dut.rootp->emu__DOT__ioctl_addr = 0;
    dut.rootp->emu__DOT__ioctl_download = 1;
    while (fread(&transferword, 2, 1, f) == 1) {

        dut.rootp->emu__DOT__ioctl_wr = 1;
        dut.rootp->emu__DOT__ioctl_dout = transferword;

        clock(m_trace, dut);
        dut.rootp->emu__DOT__ioctl_wr = 0;

        // make some clocks to avoid asking for busy
        clock(m_trace, dut);
        clock(m_trace, dut);
        clock(m_trace, dut);
        clock(m_trace, dut);
        clock(m_trace, dut);
        clock(m_trace, dut);
        dut.rootp->emu__DOT__ioctl_addr += 2;
        clock(m_trace, dut);
    }
    fclose(f);
    dut.rootp->emu__DOT__ioctl_download = 0;
}

void do_justwait(VerilatedVcdC &m_trace, Vemu &dut) {
    dut.eval();
    kDoTrace = false;
    dut.rootp->emu__DOT__debug_uart_fake_space = false;

    FILE *f = fopen("ramdump.bin", "rb");
    assert(f);
    fread(&dut.rootp->emu__DOT__ram[0], 1, 1024 * 256 * 4, f);

    /*
        fread(&dut.rootp->emu__DOT__ram[0], 1, 1024 * 256, f);
    fread(&dut.rootp->emu__DOT__ram[2 * 1024 * 128], 1, 1024 * 256, f);
    fread(&dut.rootp->emu__DOT__ram[1 * 1024 * 128], 1, 1024 * 256, f);
    fread(&dut.rootp->emu__DOT__ram[3 * 1024 * 128], 1, 1024 * 256, f);
*/
    // 0x7FFB0  0xCD04 0xC1B9
    fclose(f);

    dut.RESET = 1;
    dut.UART_RXD = 1;

    for (int y = 0; y < 230; y++) {
        clock(m_trace, dut);
    }

    // loadfile(m_trace, dut);
    dut.RESET = 0;

    for (int y = 0; y < 780000; y++) {
        // for (int y = 0;; y++) {
        clock(m_trace, dut);

        if ((y % 10000) == 0) {
            printf("%d\n", y);
        }

        static int output_index = 0;
        // if (dut.rootp->fx68k_tb__DOT__mcd212_inst__DOT__rle_pixel_strobe) {
        // printf("%d %d\n",(output_index/3) % 384,dut.rootp->fx68k_tb__DOT__mcd212_inst__DOT__rle_pixel);

        if (output_index < size - 6) {
            if (dut.VGA_DE) {
                output_image[output_index++] = dut.VGA_R;
                output_image[output_index++] = dut.VGA_G;
                output_image[output_index++] = dut.VGA_B;
            } else {
                output_image[output_index++] = kDoTrace ? 80 : 10;
                output_image[output_index++] = 10;
                output_image[output_index++] = 10;
            }
        }

        if (y == 43000)
            kDoTrace = true;

        if (y == 53000)
            kDoTrace = false;

        if (y == 640000)
            kDoTrace = true;

        if (y == 670000)
            kDoTrace = false;

        static uint32_t pc = 0;
        static uint32_t regfile[16];

        if (status == SIGINT)
            break;
    }

    write_png_file("video.png");

    // printf("ICA1 %x\n",dut.rootp->fx68k_tb__DOT__mcd212_inst__DOT__testram[ica1>>1]);
}

int main(int argc, char **argv) {
    // Initialize Verilators variables
    Verilated::commandArgs(argc, argv);

    if (kDoTrace)
        Verilated::traceEverOn(true);

    VerilatedVcdC m_trace;
    Vemu dut;

    if (signal(SIGINT, catch_function) == SIG_ERR) {
        fputs("An error occurred while setting a signal handler.\n", stderr);
        return EXIT_FAILURE;
    }

    dut.trace(&m_trace, 5);

    if (kDoTrace)
        m_trace.open("/tmp/waveform.vcd");

    // do_selftest_dram(m_trace, dut);
    //  do_selftest_lowlevelpcb(m_trace, dut);
    //  do_selftest_cdic(m_trace, dut);
    //  do_selftest_slave(m_trace, dut);
    do_justwait(m_trace, dut);

    fprintf(stderr, "Closing...\n");
    fflush(stdout);

    return 0;
}
