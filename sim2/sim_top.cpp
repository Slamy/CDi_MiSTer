// Include common routines
#include <verilated.h>
#include <verilated_fst_c.h>
#include <verilated_vcd_c.h>

// Include model header, generated from Verilating "top.v"
#include "Vemu.h"
#include "Vemu___024root.h"

#include <chrono>
#include <csignal>
#include <cstdint>
#include <png.h>
#include <queue>

#include "hle.h"
#include <byteswap.h>

#define SCC68070

typedef VerilatedFstC tracetype_t;

static bool do_trace{false};
volatile sig_atomic_t status = 0;

const int width = 120 * 16;
const int height = 312;
const int size = width * height * 3;

FILE *f_cd_bin{nullptr};

template <typename T, typename U> constexpr T BIT(T x, U n) noexcept {
    return (x >> n) & T(1);
}

static void catch_function(int signo) {
    status = signo;
}

// got from mame
uint32_t lba_from_time(uint32_t m_time) {
    const uint8_t bcd_mins = (m_time >> 24) & 0xff;
    const uint8_t mins_upper_digit = bcd_mins >> 4;
    const uint8_t mins_lower_digit = bcd_mins & 0xf;
    const uint8_t raw_mins = (mins_upper_digit * 10) + mins_lower_digit;

    const uint8_t bcd_secs = (m_time >> 16) & 0xff;
    const uint8_t secs_upper_digit = bcd_secs >> 4;
    const uint8_t secs_lower_digit = bcd_secs & 0xf;
    const uint8_t raw_secs = (secs_upper_digit * 10) + secs_lower_digit;

    uint32_t lba = ((raw_mins * 60) + raw_secs) * 75;

    const uint8_t bcd_frac = (m_time >> 8) & 0xff;
    const bool even_second = BIT(bcd_frac, 7);
    if (!even_second) {
        const uint8_t frac_upper_digit = bcd_frac >> 4;
        const uint8_t frac_lower_digit = bcd_frac & 0xf;
        const uint8_t raw_frac = (frac_upper_digit * 10) + frac_lower_digit;
        lba += raw_frac;
    }

    if (lba >= 150)
        lba -= 150;

    return lba;
}

class CDi {
  public:
    Vemu dut;
    uint64_t step = 0;
    uint64_t sim_time = 0;
    int frame_index = 0;

  private:
    FILE *f_audio_left{nullptr};
    FILE *f_audio_right{nullptr};

    std::queue<int16_t> mame_audio[2];
    std::queue<int16_t> mame_audio2[2];
    std::queue<int16_t> mame_sample_in[2];

    // std::queue<int16_t> dut_audio[2];

    uint8_t output_image[size] = {0};
    uint32_t regfile[16];

    tracetype_t m_trace;

    uint32_t print_instructions = 0;
    uint32_t prevpc = 0;
    uint32_t leave_sys_callpc = 0;

    int pixel_index = 0;

    uint16_t sector_buffer[0x1000];
    uint16_t sector_buffer_index = 0;

    int instanceid;

    std::chrono::_V2::system_clock::time_point start;
    int sd_rd_q;
    static constexpr uint32_t kSectorHeaderSize{12};
    static constexpr uint32_t kSectorSize{0x930};

    uint32_t get_pixel_value(uint32_t x, uint32_t y) {
        uint8_t *pixel = &output_image[(width * y + x) * 3];
        uint32_t r = static_cast<uint32_t>(*pixel++) << 16;
        uint32_t g = static_cast<uint32_t>(*pixel++) << 8;
        uint32_t b = static_cast<uint32_t>(*pixel++);
        return r | g | b;
    }

    void write_png_file(const char *filename) {
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

    void clock() {

        for (int i = 0; i < 2; i++) {
            dut.rootp->emu__DOT__clk_sys = (sim_time & 1);
            dut.rootp->emu__DOT__clk_audio = (sim_time & 1);
            dut.eval();
            if (do_trace) {
                m_trace.dump(sim_time);
            }
            sim_time++;
        }
    }

  public:
    void loadfile(uint16_t index, const char *path) {

        FILE *f = fopen(path, "rb");
        assert(f);

        uint16_t transferword;

        dut.rootp->emu__DOT__ioctl_addr = 0;
        dut.rootp->emu__DOT__ioctl_index = index;

        // make some clocks before starting
        for (int step = 0; step < 300; step++) {
            clock();
        }

        while (fread(&transferword, 2, 1, f) == 1) {
            dut.rootp->emu__DOT__ioctl_wr = 1;
            dut.rootp->emu__DOT__ioctl_dout = transferword;

            clock();
            dut.rootp->emu__DOT__ioctl_wr = 0;

            // make some clocks to avoid asking for busy
            // the real MiSTer has 31 clocks between writes
            // we are going for ~20 to put more stress on it.
            for (int i = 0; i < 20; i++) {
                clock();
            }
            dut.rootp->emu__DOT__ioctl_addr += 2;
            clock();
        }
        fclose(f);
    }

    void printstate() {
#ifdef SCC68070
        uint32_t pc = dut.rootp->emu__DOT__cditop__DOT__scc68070_0__DOT__tg68__DOT__tg68kdotcinst__DOT__exe_pc;
        // d0 = dut.rootp->fx68k_tb__DOT__d0;
        memcpy(regfile, &dut.rootp->emu__DOT__cditop__DOT__scc68070_0__DOT__tg68__DOT__tg68kdotcinst__DOT__regfile[0],
               sizeof(regfile));

        printf("%x", pc);
        for (int i = 0; i < 16; i++)
            printf(" %x", regfile[i]);
        printf("\n");
#endif
    }

    enum : uint8_t { DISC_NONE, DISC_MODE1, DISC_MODE2, DISC_CDDA, DISC_TOC };

    enum {
        SECTOR_SYNC = 0,

        SECTOR_HEADER = 12,

        SECTOR_MINUTES = 12,
        SECTOR_SECONDS = 13,
        SECTOR_FRACS = 14,
        SECTOR_MODE = 15,

        SECTOR_FILE1 = 16,
        SECTOR_CHAN1 = 17,
        SECTOR_SUBMODE1 = 18,
        SECTOR_CODING1 = 19,

        SECTOR_FILE2 = 20,
        SECTOR_CHAN2 = 21,
        SECTOR_SUBMODE2 = 22,
        SECTOR_CODING2 = 23,

        SECTOR_DATA = 24,

        SECTOR_SIZE = 2352,
        SECTOR_AUDIO_SIZE = 2304,

        SECTOR_DATASIZE = 2048,
        SECTOR_AUDIOSIZE = 2304,
        SECTOR_VIDEOSIZE = 2324,

        SUBMODE_EOF = 0x80,
        SUBMODE_RT = 0x40,
        SUBMODE_FORM = 0x20,
        SUBMODE_TRIG = 0x10,
        SUBMODE_DATA = 0x08,
        SUBMODE_AUDIO = 0x04,
        SUBMODE_VIDEO = 0x02,
        SUBMODE_EOR = 0x01,

        CODING_BPS_MASK = 0x30,
        CODING_4BPS = 0x00,
        CODING_8BPS = 0x10,
        CODING_16BPS = 0x20,
        CODING_BPS_MPEG = 0x30,

        CODING_RATE_MASK = 0x0c,
        CODING_37KHZ = 0x00,
        CODING_18KHZ = 0x04,
        CODING_RATE_RESV = 0x08,
        CODING_44KHZ = 0x0c,

        CODING_CHAN_MASK = 0x03,
        CODING_MONO = 0x00,
        CODING_STEREO = 0x01,
        CODING_CHAN_RESV = 0x02,
        CODING_CHAN_MPEG = 0x03,

        SUBCODE_Q_CONTROL = 12,
        SUBCODE_Q_TRACK = 13,
        SUBCODE_Q_INDEX = 14,
        SUBCODE_Q_MODE1_MINS = 15,
        SUBCODE_Q_MODE1_SECS = 16,
        SUBCODE_Q_MODE1_FRAC = 17,
        SUBCODE_Q_MODE1_ZERO = 18,
        SUBCODE_Q_MODE1_AMINS = 19,
        SUBCODE_Q_MODE1_ASECS = 20,
        SUBCODE_Q_MODE1_AFRAC = 21,
        SUBCODE_Q_CRC0 = 22,
        SUBCODE_Q_CRC1 = 23
    };

    void play_audio_sector(const uint8_t coding, const uint8_t *data) {
        if ((coding & CODING_CHAN_MASK) > CODING_STEREO || (coding & CODING_BPS_MASK) == CODING_BPS_MPEG ||
            (coding & CODING_RATE_MASK) == CODING_RATE_RESV) {
            printf("Invalid coding (%02x), ignoring\n", coding);
            return;
        }

        int channels = 2;
        // offs_t buffer_length = 1;
        if (!(coding & CODING_STEREO)) {
            channels = 1;
            // buffer_length *= 2;
        }

        int bits = 4;
        switch (coding & CODING_BPS_MASK) {
        case CODING_8BPS:
            bits = 8;
            break;
        case CODING_16BPS:
            bits = 16;
            printf("play_audio_sector: unhandled 16-bit coding mode\n");
            break;
        default:
            bits = 4;
            // buffer_length *= 2;
            break;
        }

        int32_t sample_frequency = 0;
        switch (coding & CODING_RATE_MASK) {
        case CODING_37KHZ:
            break;
        case CODING_18KHZ:
            break;
        case CODING_44KHZ:
            printf("play_audio_sector: unhandled 44KHz coding mode\n");
            break;
        default:
            // Can't happen due to above early-out
            break;
        }

        printf("Coding %02x, %d channels, %d bits, %08x frequency\n", coding, channels, bits, sample_frequency);

        if (bits == 16 && channels == 2) {
            for (uint16_t i = 0; i < SECTOR_AUDIO_SIZE; i += 112, data += 112) {
            }
        } else {
            for (uint16_t i = 0; i < SECTOR_AUDIO_SIZE; i += 128, data += 128) {

                /*
                int printsinline = 0;
                for (int i = 0; i < 128; i++) {
                    printf("%02x", data[i]);
                    printsinline++;
                    if (printsinline == 8) {
                        printsinline = 0;
                        printf("\n");
                    }
                }
                printf("\n");
                */

                play_xa_group(coding, data);
            }
        }
    }

    const int16_t s_xa_filter_coef[4][2] = {{0x000, 0x000}, {0x0F0, 0x000}, {0x1CC, -0x0D0}, {0x188, -0x0DC}};
    int16_t m_xa_last[4]{0};

    void decode_8bit_xa_unit(int channel, uint8_t param, const uint8_t *data, int16_t *out_buffer) {
        int gain_shift = 8 - (param & 0xf);

        const int16_t *filter = s_xa_filter_coef[(param >> 4) & 3];
        int16_t *old_samples = &m_xa_last[channel << 1];

        for (int i = 0; i < 28; i++) {
            int32_t sample = *data;
            if (sample >= 128)
                sample -= 256;
            data += 4;

            sample <<= gain_shift;
            printf("%s inbetween %d\n", __func__, sample);
            mame_sample_in[channel].push(sample);
            sample += (filter[0] * old_samples[0] + filter[1] * old_samples[1] + 128) / 256;

            int16_t sample16 = (int16_t)sample;
            if (sample < -32768)
                sample16 = -32768;
            else if (sample > 32767)
                sample16 = 32767;

            old_samples[1] = old_samples[0];
            old_samples[0] = sample16;

            out_buffer[i] = sample16;
            mame_audio[channel].push(sample16);
            mame_audio2[channel].push(sample16);
            printf("%s %d sample16 %d\n", __func__, channel, sample16);
        }
    }

    void decode_4bit_xa_unit(int channel, uint8_t param, const uint8_t *data, uint8_t shift, int16_t *out_buffer) {
        // printf("%s channel %d param %x\n", __func__, channel, param);

        int gain_shift = 12 - (param & 0xf);

        const int16_t *filter = s_xa_filter_coef[(param >> 4) & 3];
        int16_t *old_samples = &m_xa_last[channel << 1];

        for (int i = 0; i < 28; i++) {
            int32_t sample = (*data >> shift) & 0xf;
            if (BIT(sample, 3))
                sample -= 16;

            data += 4;

            sample <<= gain_shift;
            // printf("%s inbetween %d\n", __func__, sample);
            mame_sample_in[channel].push(sample);
            sample += (filter[0] * old_samples[0] + filter[1] * old_samples[1] + 128) / 256;

            int16_t sample16 = (int16_t)(uint16_t)(sample & 0xffff);
            if (sample < -32768)
                sample16 = -32768;
            else if (sample > 32767)
                sample16 = 32767;

            old_samples[1] = old_samples[0];
            old_samples[0] = sample16;

            out_buffer[i] = sample16;
            mame_audio[channel].push(sample16);
            mame_audio2[channel].push(sample16);
            // printf("%s %d sample16 %d\n", __func__, channel, sample16);
        }
    }

    void play_xa_group(const uint8_t coding, const uint8_t *data) {
        // printf("%s\n", __func__);
        static const uint16_t s_4bit_header_offsets[8] = {0, 1, 2, 3, 8, 9, 10, 11};
        static const uint16_t s_8bit_header_offsets[4] = {0, 1, 2, 3};
        static const uint16_t s_4bit_data_offsets[8] = {16, 16, 17, 17, 18, 18, 19, 19};
        static const uint16_t s_8bit_data_offsets[4] = {16, 17, 18, 19};

        int16_t samples[28];

        switch (coding & (CODING_BPS_MASK | CODING_CHAN_MASK)) {
        case CODING_4BPS | CODING_MONO:
            for (uint8_t i = 0; i < 8; i++) {
                decode_4bit_xa_unit(0, data[s_4bit_header_offsets[i]], data + s_4bit_data_offsets[i], (i & 1) ? 4 : 0,
                                    samples);
                // m_dmadac[0]->transfer(0, 1, 1, 28, samples);
                // m_dmadac[1]->transfer(0, 1, 1, 28, samples);
            }
            return;

        case CODING_4BPS | CODING_STEREO:
            for (uint8_t i = 0; i < 8; i++) {
                decode_4bit_xa_unit(i & 1, data[s_4bit_header_offsets[i]], data + s_4bit_data_offsets[i],
                                    (i & 1) ? 4 : 0, samples);
                // m_dmadac[i & 1]->transfer(0, 1, 1, 28, samples);
            }
            return;

        case CODING_8BPS | CODING_MONO:
            for (uint8_t i = 0; i < 4; i++) {
                decode_8bit_xa_unit(0, data[s_8bit_header_offsets[i]], data + s_8bit_data_offsets[i], samples);
                // m_dmadac[0]->transfer(0, 1, 1, 28, samples);
                // m_dmadac[1]->transfer(0, 1, 1, 28, samples);
            }
            return;

        case CODING_8BPS | CODING_STEREO:
            for (uint8_t i = 0; i < 4; i++) {
                decode_8bit_xa_unit(i & 1, data[s_8bit_header_offsets[i]], data + s_8bit_data_offsets[i], samples);
                // m_dmadac[i & 1]->transfer(0, 1, 1, 28, samples);
            }
            return;
        }
    }

    void modelstep() {
        step++;
        clock();

        if ((step % 100000) == 0) {
            printf("%d\n", step);
        }

#ifdef SCC68070
        // Abort on illegal Instructions
        if (dut.rootp->emu__DOT__cditop__DOT__scc68070_0__DOT__tg68__DOT__tg68kdotcinst__DOT__trap_illegal) {
            fprintf(stderr, "Illegal Instruction!\n");
            exit(1);
        }
#endif

        // Simulate CD data delivery from HPS
        if (dut.rootp->emu__DOT__sd_rd && sd_rd_q == 0) {
            assert(dut.rootp->emu__DOT__sd_ack == 0);
            dut.rootp->emu__DOT__sd_ack = 1;

            uint32_t lba = dut.rootp->emu__DOT__sd_lba0;
            uint32_t m_time = dut.rootp->emu__DOT__cditop__DOT__cdic_inst__DOT__time_register;

            uint32_t reference_lba = lba_from_time(m_time);
            // assert(lba == reference_lba);

            uint32_t file_offset = (lba - 150) * kSectorSize;

            printf("Request Sector %x %x %x\n", m_time, lba, file_offset);

            int res = fseek(f_cd_bin, file_offset, SEEK_SET);
            assert(res == 0);

            fread(sector_buffer, 1, 0x930, f_cd_bin);
            sector_buffer_index = 0;
        }

        dut.rootp->emu__DOT__sd_buff_wr = 0;
        if (dut.rootp->emu__DOT__sd_ack && (step % 200) == 15) {
            if (sector_buffer_index == kSectorSize / 2) {
                dut.rootp->emu__DOT__sd_ack = 0;
                printf("Sector transferred!\n");
            } else {
                dut.rootp->emu__DOT__sd_buff_dout = sector_buffer[sector_buffer_index];
                dut.rootp->emu__DOT__sd_buff_wr = 1;
                sector_buffer_index++;
            }
        }

        sd_rd_q = dut.rootp->emu__DOT__sd_rd;

        /*
        if (dut.rootp->emu__DOT__cditop__DOT__scc68070_0__DOT__uart_transmit_holding_valid) {
            fputc(dut.rootp->emu__DOT__cditop__DOT__scc68070_0__DOT__uart_transmit_holding_register, stderr);
            dut.rootp->emu__DOT__cditop__DOT__scc68070_0__DOT__uart_transmit_holding_valid = 0;
        }
        */

        // Trace System Calls
        if (dut.rootp->emu__DOT__cditop__DOT__scc68070_0__DOT__tg68__DOT__tg68kdotcinst__DOT__decodeopc &&
            dut.rootp->emu__DOT__cditop__DOT__scc68070_0__DOT__clkena_in) {

            uint32_t m_pc = dut.rootp->emu__DOT__cditop__DOT__scc68070_0__DOT__tg68__DOT__tg68kdotcinst__DOT__exe_pc;

            if (m_pc == 0x62c) {
                assert((prevpc & 1) == 0);
                uint32_t callpos = ((prevpc & 0x3fffff) >> 1) + 1;
                uint32_t call = dut.rootp->emu__DOT__rom[callpos];
                printf("Syscall %x %x %s\n", prevpc, call, systemCallNameToString(static_cast<SystemCallType>(call)));
                leave_sys_callpc = prevpc + 4;

                // SysDbg ? Just give up!
                if (static_cast<SystemCallType>(call) == F_SysDbg) {
                    fprintf(stderr, "System halted and debugger calted!\n");
                    exit(1);
                }
            }

            if (m_pc == leave_sys_callpc) {
                printf("Return from Syscall %x %x\n",
                       dut.rootp->emu__DOT__cditop__DOT__scc68070_0__DOT__tg68__DOT__tg68kdotcinst__DOT__flags,
                       dut.rootp->emu__DOT__cditop__DOT__scc68070_0__DOT__tg68__DOT__tg68kdotcinst__DOT__flagssr);
                printstate();
            }

            prevpc = m_pc;
        }

        // Trace CPU state
        if (dut.rootp->emu__DOT__cditop__DOT__scc68070_0__DOT__tg68__DOT__tg68kdotcinst__DOT__decodeopc &&
            print_instructions && dut.rootp->emu__DOT__cditop__DOT__scc68070_0__DOT__clkena_in) {

            printstate();
        }

        // Simulate television
        if (dut.rootp->emu__DOT__cditop__DOT__mcd212_inst__DOT__new_frame) {
            char filename[100];

            // Start game
            if (frame_index == 247) {
                printf("Press a button!\n");
                dut.rootp->emu__DOT__JOY0 = 0b100000;
            }
            if (frame_index == 250) {
                printf("Release a button!\n");
                dut.rootp->emu__DOT__JOY0 = 0b000000;
            }

            if (instanceid == 2) // Tetris
            {
                // Skip Philips Logo
                if (frame_index == 347) {
                    printf("Press a button!\n");
                    dut.rootp->emu__DOT__JOY0 = 0b100000;
                }
                if (frame_index == 350) {
                    printf("Release a button!\n");
                    dut.rootp->emu__DOT__JOY0 = 0b000000;
                }
                // Skip Intro
                if (frame_index == 505) {
                    printf("Press a button!\n");
                    dut.rootp->emu__DOT__JOY0 = 0b100000;
                }
                if (frame_index == 510) {
                    printf("Release a button!\n");
                    dut.rootp->emu__DOT__JOY0 = 0b000000;
                }
            } else if (instanceid == 1 && frame_index > 300) { // Hotel Mario
                if (frame_index < 910) {
                    // Before ingame
                    if ((frame_index % 25) == 20) {
                        printf("Press a button!\n");
                        dut.rootp->emu__DOT__JOY0 = 0b100000;
                    }

                    if ((frame_index % 25) == 23) {
                        printf("Release a button!\n");
                        dut.rootp->emu__DOT__JOY0 = 0b000000;
                    }
                } else if (get_pixel_value(498, 130) == 0x10bc10 && get_pixel_value(1193, 233) == 0x101010) {
                    printf("Level Title Card");
                    // Level Title Card
                    if ((frame_index % 20) == 10) {
                        printf("Press a button!\n");
                        dut.rootp->emu__DOT__JOY0 = 0b100000;
                    }

                    if ((frame_index % 20) == 15) {
                        printf("Release a button!\n");
                        dut.rootp->emu__DOT__JOY0 = 0b000000;
                    }
                } else {
                    // Press down left during ingame to kill mario to cause audiomap restart
                    dut.rootp->emu__DOT__JOY0 = 0b000110;
                }
            }

            if (pixel_index > 100) {
                auto current = std::chrono::system_clock::now();
                std::chrono::duration<double> elapsed_seconds = current - start;
                sprintf(filename, "%d/video_%03d.png", instanceid, frame_index);
                write_png_file(filename);
                printf("Written %s %d\n", filename, pixel_index);
                printf("We are at step=%ld\n", step);
                fprintf(stderr, "Written %s after %.2fs\n", filename, elapsed_seconds.count());
                frame_index++;
            }
            pixel_index = 0;
        }

        // Verify Audio
#if 0
        if (dut.rootp->emu__DOT__cditop__DOT__cdic_inst__DOT__adpcm__DOT__decoder_start) {
            auto adr = dut.rootp->emu__DOT__cditop__DOT__cdic_inst__DOT__adpcm__DOT__playback_request_addr;
            uint8_t *ram = (uint8_t *)&dut.rootp->emu__DOT__cditop__DOT__cdic_inst__DOT__mem__DOT__ram[adr];
            /*
            for (int i = 16; i < 200; i++) {
                ram[i] = i;
            }*/

            /*
            FILE *f = fopen("ramdump2.bin", "wb");
            assert(f);
            fwrite(&dut.rootp->emu__DOT__cditop__DOT__cdic_inst__DOT__mem__DOT__ram[0], 2, 8192, f);
            fclose(f);
            exit(1);*/
            const uint8_t coding = ram[(SECTOR_CODING2 - SECTOR_HEADER) ^ 1];
            printf("Coding %x\n", coding);
            ram += SECTOR_DATA - SECTOR_HEADER;

            uint8_t swapped_data[(SECTOR_SIZE - (SECTOR_DATA - SECTOR_HEADER))];
            for (uint16_t i = 0; i < (SECTOR_SIZE - (SECTOR_DATA - SECTOR_HEADER)); i++) {
                swapped_data[i ^ 1] = ram[i];
            }

            play_audio_sector(coding, swapped_data);
        }

        if (dut.rootp->emu__DOT__cditop__DOT__cdic_inst__DOT__adpcm__DOT__sample_strobe) {
            int16_t sample = dut.rootp->emu__DOT__cditop__DOT__cdic_inst__DOT__adpcm__DOT__xa_sample;
            int channel = dut.rootp->emu__DOT__cditop__DOT__cdic_inst__DOT__adpcm__DOT__xa_channel;

            assert(mame_audio[channel].empty() == false);
            int16_t ref = mame_audio[channel].front();
            mame_audio[channel].pop();

            printf("Compare channel:%d   verilog:%d mame:%d\n", channel, sample, ref);

            if (sample != ref) {
                printf("Compare fail verilog:%d mame:%d\n", sample, ref);
                status = 1;
            }
        }

        if (dut.rootp->emu__DOT__cditop__DOT__cdic_inst__DOT__adpcm__DOT__fifo_out_valid) {
            int16_t sample_l = dut.rootp->emu__DOT__cditop__DOT__cdic_inst__DOT__adpcm__DOT__fifo_out_left;
            int16_t sample_r = dut.rootp->emu__DOT__cditop__DOT__cdic_inst__DOT__adpcm__DOT__fifo_out_right;

            assert(mame_audio2[0].empty() == false);
            assert(mame_audio2[1].empty() == false);
            int16_t ref_l = mame_audio2[0].front();
            int16_t ref_r = mame_audio2[1].front();
            mame_audio2[0].pop();
            mame_audio2[1].pop();

            printf("   Compare verilog: %d %d mame: %d %d\n", sample_l, sample_r, ref_l, ref_r);

            if (sample_l != ref_l) {
                printf("Compare fail L verilog:%d mame:%d\n", sample_l, ref_l);
                status = 1;
            }

            if (sample_r != ref_r) {
                printf("Compare fail R verilog:%d mame:%d\n", sample_r, ref_r);
                status = 1;
            }
        }

        if (dut.rootp->emu__DOT__cditop__DOT__cdic_inst__DOT__adpcm__DOT__decoder__DOT__inbetween) {
            int32_t sample = dut.rootp->emu__DOT__cditop__DOT__cdic_inst__DOT__adpcm__DOT__decoder__DOT__sample;

            int channel = dut.rootp->emu__DOT__cditop__DOT__cdic_inst__DOT__adpcm__DOT__decoder__DOT__channel;

            assert(mame_sample_in[channel].empty() == false);
            int32_t ref = mame_sample_in[channel].front();
            mame_sample_in[channel].pop();

            printf("Inbetween channel:%d   verilog:%d mame:%d\n", channel, sample, ref);

            if (sample != ref) {
                printf("Inbetween fail verilog:%d mame:%d\n", sample, ref);
                status = 1;
            }
        }
#endif

        // Simulate Audio
        if (dut.rootp->emu__DOT__cditop__DOT__cdic_inst__DOT__sample_tick37) {
            int16_t sample_l = dut.rootp->emu__DOT__cditop__DOT__cdic_inst__DOT__adpcm__DOT__fifo_out_left;
            int16_t sample_r = dut.rootp->emu__DOT__cditop__DOT__cdic_inst__DOT__adpcm__DOT__fifo_out_right;
            fwrite(&sample_l, 2, 1, f_audio_left);
            fwrite(&sample_r, 2, 1, f_audio_right);
        }

        if (pixel_index < size - 6) {
            if (dut.VGA_DE) {
                output_image[pixel_index++] = dut.VGA_R;
                output_image[pixel_index++] = dut.VGA_G;
                output_image[pixel_index++] = dut.VGA_B;
            } else {
                output_image[pixel_index++] = do_trace ? 80 : 10;
                output_image[pixel_index++] = 10;
                output_image[pixel_index++] = 10;
            }
        }
    }

    virtual ~CDi() {
        fclose(f_audio_right);
        fclose(f_audio_left);
    }
    CDi(int i) {
        instanceid = i;

        char filename[100];
        sprintf(filename, "%d/audio_left.bin", instanceid);
        fprintf(stderr, "Writing to %s\n", filename);
        f_audio_left = fopen(filename, "wb");

        sprintf(filename, "%d/audio_right.bin", instanceid);
        fprintf(stderr, "Writing to %s\n", filename);
        f_audio_right = fopen(filename, "wb");

        dut.trace(&m_trace, 5);

        if (do_trace) {
            sprintf(filename, "/tmp/waveform%d.vcd", instanceid);
            fprintf(stderr, "Writing to %s\n", filename);
            m_trace.open(filename);
        }

        dut.eval();
        // do_trace = false;
        dut.rootp->emu__DOT__debug_uart_fake_space = false;
        // dut.rootp->emu__DOT__tvmode_ntsc = true;

        dut.RESET = 1;
        dut.UART_RXD = 1;

        for (int y = 0; y < 300; y++) {
            // wait for SDRAM to initialize
            clock();
        }

        dut.RESET = 0;

        start = std::chrono::system_clock::now();
    }

    void reset() {
        dut.RESET = 1;

        for (int i = 0; i < 40; i++)
            clock();
        
        dut.RESET = 0;
    }

    void dump_memory() {
        char filename[100];
        sprintf(filename, "%d/ramdump.bin", instanceid);
        printf("Writing %s!\n", filename);
        FILE *f = fopen(filename, "wb");
        assert(f);
        fwrite(&dut.rootp->emu__DOT__ram[0], 1, 1024 * 256 * 4, f);
        fclose(f);
    }
};

int main(int argc, char **argv) {
    // Initialize Verilators variables
    Verilated::commandArgs(argc, argv);

    if (do_trace)
        Verilated::traceEverOn(true);

    if (signal(SIGINT, catch_function) == SIG_ERR) {
        fputs("An error occurred while setting a signal handler.\n", stderr);
        return EXIT_FAILURE;
    }

    int machineindex = 0;

    if (argc == 2) {
        machineindex = atoi(argv[1]);
        fprintf(stderr, "Machine is %d\n", machineindex);
    }

    // f_cd_bin = fopen("images/Frog Feast (USA) (Unl).bin", "rb");
    // f_cd_bin = fopen("images/tetris.bin", "rb");
    // f_cd_bin = fopen("images/FROG.BIN", "rb");

    switch (machineindex) {
    case 0:
        f_cd_bin = fopen("images/Zelda Wand of Gamelon.bin", "rb");
        break;
    case 1:
        f_cd_bin = fopen("images/Hotel Mario.bin", "rb");
        break;
    case 2:
        f_cd_bin = fopen("images/tetris.bin", "rb");
        break;
    case 3:
        f_cd_bin = fopen("images/Nobelia (USA).bin", "rb");
        break;
    case 4:
        f_cd_bin = fopen("images/Hotel Mario.bin", "rb");
        break;
    case 5:
        f_cd_bin = fopen("images/Zelda's Adventure (Europe).bin", "rb");
        break;
    case 6:
        f_cd_bin = fopen("images/tetris.bin", "rb");
        break;
    case 7:
        f_cd_bin = fopen("images/soundtest.bin", "rb");
        break;
    }

    assert(f_cd_bin);

    CDi machine(machineindex);

    while (status == 0) {
        machine.modelstep();
        if (machine.frame_index == 20)
            break;
    }

    machine.reset();
    fprintf(stderr, "Reset!\n");

    while (status == 0) {
        machine.modelstep();
        if (machine.frame_index == 40)
            break;
    }


    machine.modelstep();
    machine.modelstep();
    machine.modelstep();
    machine.dump_memory();

    fclose(f_cd_bin);

    fprintf(stderr, "Closing...\n");
    fflush(stdout);

    return 0;
}
