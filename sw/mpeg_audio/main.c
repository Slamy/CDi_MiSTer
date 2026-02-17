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

#define OUTPORT_L 0x10000004
#define OUTPORT_R 0x10000008
#define OUTPORT_END 0x1000000c

#define DEBUG_STATE *(volatile uint32_t *)0x10000030
#define DEBUG_OUT *(volatile uint32_t *)0x10000000

void print_chr(char ch);
void print_str(const char *p);
void stop_verilator();

// #define SOFT_CONVOLVE

#define PL_MPEG_IMPLEMENTATION
#define PLM_NO_STDIO
#include "pl_mpeg.h"

void stop_verilator()
{
	*((volatile uint8_t *)OUTPORT_END) = 0;
}

volatile union
{
	volatile uint32_t int32;
	volatile uint8_t int8[4];
	volatile uint16_t int16[2];
} testenv;

// 10000 results into at least having 2 TIM interrupts after
// the last frame has been decoded, before UNF occurs.
// This seems to be stable with pausing and continuing a playback of
// "Imagination in Motion - A New Era in 3D Chill Out Video"
// but also seems to be stable with "The Lost Ride".
// 100000 was too long for Lost Ride, resulting into audio glitches.
// It was reduced to 100, which caused problems with "Imagination in Motion"
// Keep in mind, this heavily relies on compiler optimization and core speed.
const int kTimeOut = 10000;

void main(void)
{
	plm_dma_buffer_t *buffer = plm_buffer_create_with_memory((uint8_t *)0x20000000, 700 * 1024 * 1024, 0);
	plm_audio_t *mpeg = plm_audio_create_with_buffer(buffer);

	int cnt = 0;

	fifo_ctrl->signal_decoding_started = 1;

	int timeout = kTimeOut;

	while (timeout)
	{
		plm_samples_t *samples = plm_audio_decode(mpeg);

		if (samples)
		{
			// Give some feedback to the user that we are running
			cnt++;
			fifo_ctrl->signal_frame_decoded = cnt;
			timeout = kTimeOut;
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
