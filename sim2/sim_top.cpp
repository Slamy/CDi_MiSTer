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

#include "hle.h"

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



void printstate(Vemu &dut) {

    static uint32_t regfile[16];

    uint32_t pc = dut.rootp->emu__DOT__cditop__DOT__scc68070_0__DOT__tg68__DOT__tg68kdotcinst__DOT__exe_pc;
    // d0 = dut.rootp->fx68k_tb__DOT__d0;
    memcpy(regfile, &dut.rootp->emu__DOT__cditop__DOT__scc68070_0__DOT__tg68__DOT__tg68kdotcinst__DOT__regfile[0],
           sizeof(regfile));

    printf("%x", pc);
    for (int i = 0; i < 16; i++)
        printf(" %x", regfile[i]);
    printf("\n");
}

void do_justwait(VerilatedVcdC &m_trace, Vemu &dut) {
    dut.eval();
    kDoTrace = false;
    dut.rootp->emu__DOT__debug_uart_fake_space = false;

    if (0) {
        FILE *f = fopen("ramdump.bin", "rb");
        assert(f);
        fread(&dut.rootp->emu__DOT__ram[0], 1, 1024 * 256 * 4, f);
        fclose(f);
    }
    /*
        fread(&dut.rootp->emu__DOT__ram[0], 1, 1024 * 256, f);
    fread(&dut.rootp->emu__DOT__ram[2 * 1024 * 128], 1, 1024 * 256, f);
    fread(&dut.rootp->emu__DOT__ram[1 * 1024 * 128], 1, 1024 * 256, f);
    fread(&dut.rootp->emu__DOT__ram[3 * 1024 * 128], 1, 1024 * 256, f);
    */
    // 0x7FFB0  0xCD04 0xC1B9

    dut.RESET = 1;
    dut.UART_RXD = 1;

    for (int y = 0; y < 230; y++) {
        clock(m_trace, dut);
    }

    // loadfile(m_trace, dut);
    dut.RESET = 0;

    // for (int y = 0; y < 780000; y++) {
    for (int y = 0;; y++) {
        clock(m_trace, dut);

        if ((y % 100000) == 0) {
            printf("%d\n", y);
        }
        /*
        if (y == 151000000)
            kDoTrace = true;
        if (y == 151800000)
            kDoTrace = false;
*/

        if (dut.rootp->emu__DOT__cditop__DOT__scc68070_0__DOT__uart_transmit_holding_valid) {
            fputc(dut.rootp->emu__DOT__cditop__DOT__scc68070_0__DOT__uart_transmit_holding_register, stderr);
            dut.rootp->emu__DOT__cditop__DOT__scc68070_0__DOT__uart_transmit_holding_valid = 0;
        }
        static uint32_t print_instructions = 0;
        static uint32_t prevpc = 0;
        static uint32_t leave_sys_callpc = 0;

        // if (dut.rootp->fx68k_tb__DOT__mcd212_inst__DOT__rle_pixel_strobe) {
        // printf("%d %d\n",(output_index/3) % 384,dut.rootp->fx68k_tb__DOT__mcd212_inst__DOT__rle_pixel);

        if (dut.rootp->emu__DOT__cditop__DOT__scc68070_0__DOT__tg68__DOT__tg68kdotcinst__DOT__decodeopc &&
            dut.rootp->emu__DOT__cditop__DOT__scc68070_0__DOT__clkena_in) {

            uint32_t m_pc = dut.rootp->emu__DOT__cditop__DOT__scc68070_0__DOT__tg68__DOT__tg68kdotcinst__DOT__exe_pc;

            if (m_pc == 0x62c) {
                assert((prevpc & 1) == 0);
                uint32_t callpos = ((prevpc & 0x3fffff) >> 1) + 1;
                uint32_t call = dut.rootp->emu__DOT__rom[callpos];
                printf("Syscall %x %x %s\n", prevpc, call, systemCallNameToString(static_cast<SystemCallType>(call)));
                leave_sys_callpc = prevpc + 4;
            }

            if (m_pc == leave_sys_callpc) {
                printf("Return from Syscall %x %x\n",
                       dut.rootp->emu__DOT__cditop__DOT__scc68070_0__DOT__tg68__DOT__tg68kdotcinst__DOT__flags,
                       dut.rootp->emu__DOT__cditop__DOT__scc68070_0__DOT__tg68__DOT__tg68kdotcinst__DOT__flagssr);
                printstate(dut);
            }

            prevpc = m_pc;

            // clang-format off
            if (m_pc == 0x00400f3a) printf("** Mark VSync Start 0\n");
			if (m_pc == 0x00401012) printf("** Mark VSync Stop 0\n");
			if (m_pc == 0x0041c77e) printf("** Mark VSync Stop 1\n");
			if (m_pc == 0x0041c734) printf("** Mark VSync Start 1\n");
			if (m_pc == 0x0041c77e) printf("** Mark VSync Stop 1\n");
			if (m_pc == 0x0041c48c) printf("** Mark VSync Start 2\n");
			if (m_pc == 0x0041c4ac) {printf("** Mark VSync Stop 2\n");}
			if (m_pc == 0x0041d618) {printf("** Mark 7\n"); print_instructions=0;}
			if (m_pc == 0x0041c3be) printf("** Mark 9\n");
			if (m_pc == 0x0041e84a) printf("** Mark memset Stop\n");
			if (m_pc == 0x0041e80a) printf("** Mark memset Start\n");
			if (m_pc == 0x0047afc8) printf("** Mark memcpy Start\n");
			if (m_pc == 0x004758d4) printf("** Mark Copy Framebuffer\n");
			if (m_pc == 0x00404b02) printf("** Mark 6\n");
			if (m_pc == 0x00404aa0) printf("** Mark 5\n");
			if (m_pc == 0x00404a46) printf("** Mark 4\n");
			if (m_pc == 0x00404902) printf("** Mark 3\n");
			if (m_pc == 0x004048f2) printf("** Mark 2\n");
			if (m_pc == 0x00404874) printf("** Mark 1\n");
			if (m_pc == 0x0040469c) printf("** Mark 0\n");
			if (m_pc == 0x00475970) printf("** Mark CopyThing\n");
			if (m_pc == 0x004759de) printf("** Mark CopyThing 2\n");
			if (m_pc == 0x004758ba) printf("** Mark 8 before CopyThing\n");
			if (m_pc == 0x0041839a) printf("** Mark Set mouse cursor sprite\n");
            // clang-format on
        }

        if (dut.rootp->emu__DOT__cditop__DOT__scc68070_0__DOT__tg68__DOT__tg68kdotcinst__DOT__decodeopc &&
            print_instructions && dut.rootp->emu__DOT__cditop__DOT__scc68070_0__DOT__clkena_in) {

            printstate(dut);

            // d1 = dut.rootp->fx68k_tb__DOT__d1;
            /*
            printf("%x %x %x %x %x %x\n", pc, dut.rootp->fx68k_tb__DOT__d0, dut.rootp->fx68k_tb__DOT__d1,
                   regfile[8 + 0], regfile[8 + 2], regfile[8 + 6]);
            */
        }

        static int output_index = 0;
        static int frame_index = 0;

        if (dut.rootp->emu__DOT__cditop__DOT__mcd212_inst__DOT__new_frame) {
            char filename[100];

            if (frame_index == 251) {
               // dut.rootp->emu__DOT__cditop__DOT__mcd212_inst__DOT__file0__DOT__debug_print_file = 1;
            }

            if (output_index > 100) {
                sprintf(filename, "video_%02d.png", frame_index);
                write_png_file(filename);
                printf("Written %s %d\n", filename, output_index);
                fprintf(stderr, "Written %s\n", filename);
                frame_index++;
            }
            output_index = 0;
        }

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

        if (status == SIGINT)
            break;
    }

    if (1) {
        printf("Writing rampdump!\n");
        FILE *f = fopen("ramdump2.bin", "wb");
        assert(f);
        fwrite(&dut.rootp->emu__DOT__ram[0], 1, 1024 * 256 * 4, f);
        fclose(f);
    }

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
