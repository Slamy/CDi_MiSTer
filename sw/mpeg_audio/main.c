// This is free and unencumbered software released into the public domain.
//
// Anyone is free to copy, modify, publish, use, compile, sell, or
// distribute this software, either in source code form or as a compiled
// binary, for any purpose, commercial or non-commercial, and by any
// means.

#include <stdint.h>
#include <stddef.h>

#include <sys/types.h>
#include <sys/stat.h>
#include <errno.h>

struct io_synth_window_mac
{
	uint32_t *addr;
	uint32_t index;
	uint32_t result;
};

struct io_fifo_control
{
	uint32_t write_byte_index;
	uint32_t read_bit_index;
	uint32_t signal_decoding_started;
	uint32_t signal_frame_decoded;
	uint32_t signal_underflow;
	uint32_t mpeg_audio_header;
};

struct io_audio_out
{
	uint32_t sample;
};

volatile struct io_synth_window_mac *const synth_window_mac = (volatile struct io_synth_window_mac *)0x10001000;
volatile struct io_fifo_control *const fifo_ctrl = (volatile struct io_fifo_control *)0x10002000;
volatile struct io_audio_out *const io_audio_out_left = (volatile struct io_audio_out *)0x10003000;
volatile struct io_audio_out *const io_audio_out_right = (volatile struct io_audio_out *)0x10004000;

#define OUTPORT 0x10000000
#define OUTPORT_L 0x10000004
#define OUTPORT_R 0x10000008
#define OUTPORT_END 0x1000000c

#define OUT_DEBUG *(volatile uint32_t *)0x10000030

void print_chr(char ch);
void print_str(const char *p);
void stop_verilator();

// #define SOFT_CONVOLVE

#define PL_MPEG_IMPLEMENTATION
#define PLM_NO_STDIO
#include "pl_mpeg.h"

void print_chr(char ch)
{
	*((volatile uint8_t *)OUTPORT) = ch;
}

void print_str(const char *p)
{
	while (*p != 0)
		*((volatile uint8_t *)OUTPORT) = *(p++);
}

void stop_verilator()
{
	*((volatile uint8_t *)OUTPORT_END) = 0;
}

void test_vector_unit()
{
	synth_window_mac->result = 0;
	synth_window_mac->addr = 0;
	synth_window_mac->index = 1;
	// while (synth_window_mac->busy);

	synth_window_mac->result = 0;
	synth_window_mac->addr = 0;
	synth_window_mac->index = 1;
	// while (synth_window_mac->busy);
	*((volatile intsample_t *)OUTPORT) = synth_window_mac->result;
}

volatile union
{
	volatile uint32_t int32;
	volatile uint8_t int8[4];
	volatile uint16_t int16[2];
} testenv;

void test_memory()
{
	testenv.int32 = 0x12345678;
	*((volatile uint32_t *)OUTPORT) = testenv.int32;
	testenv.int8[0] = 0x42;
	*((volatile uint32_t *)OUTPORT) = testenv.int32;
	*((volatile uint32_t *)OUTPORT) = testenv.int8[0];
	testenv.int8[0] = 0x81;
	testenv.int8[1] = 0x92;
	testenv.int16[1] = 0x5aa5;
	*((volatile uint32_t *)OUTPORT) = testenv.int32;
	*((volatile uint32_t *)OUTPORT) = testenv.int8[0];
	*((volatile uint32_t *)OUTPORT) = testenv.int8[1];
	stop_verilator();
}

void test_mpegmemory()
{
	// expect
	// Debug out ba010000
	// Debug out 00010021
	*((volatile uint32_t *)OUTPORT) = *(uint32_t *)0x20000000;
	*((volatile uint32_t *)OUTPORT) = *(uint32_t *)0x20000004;
	stop_verilator();
}

void main(void)
{
	plm_dma_buffer_t *buffer = plm_buffer_create_with_memory((uint8_t *)0x20000000, 700 * 1024 * 1024, 0);
	plm_audio_t *mpeg = plm_audio_create_with_buffer(buffer);

	int cnt = 0;

	fifo_ctrl->signal_decoding_started = 1;

	int timeout = 100;

	while (timeout)
	{
		plm_samples_t *samples = plm_audio_decode(mpeg);

		if (samples)
		{
			// Give some feedback to the user that we are running
			cnt++;
			fifo_ctrl->signal_frame_decoded = cnt;
			timeout = 100;
		}
		else
		{
			// For some reason, it is possible that a frame might not have
			// been decoded with one call to plm_decode_audio()
			// But on the second, it is successful?
			// Happens with Philips Bumper on Lucky Luke
			timeout--;
		}
	}

	fifo_ctrl->signal_underflow = 1;

	// Wait forever
	for (;;)
		;
}
