// This is free and unencumbered software released into the public domain.
//
// Anyone is free to copy, modify, publish, use, compile, sell, or
// distribute this software, either in source code form or as a compiled
// binary, for any purpose, commercial or non-commercial, and by any
// means.

#include <stdint.h>
#include <stddef.h>
#include <stdbool.h>

#include <sys/types.h>
#include <sys/stat.h>
#include <errno.h>

#include "hwreg.h"

#include "shared.h"
#include "memtest.h"

extern caddr_t _end; /* _end is set in the linker command file */
extern caddr_t _sp;	 /* _end is set in the linker command file */
/* just in case, most boards have at least some memory */
#ifndef RAMSIZE
#define RAMSIZE (caddr_t)(1024 * 1024 * 4)
#endif

void print_chr(char ch);
void print_str(const char *p);
void stop_verilator();

// #define SOFT_CONVOLVE

#define PL_MPEG_IMPLEMENTATION
#define PLM_NO_STDIO
#include "pl_mpeg.h"

// Settings from sequence header
// To be able to continue playback, those must be kept between resets
__attribute__((section(".noinit"))) struct seq_hdr_conf seq_hdr_conf;

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
	print_str("Nope\n");
	*((volatile uint8_t *)OUTPORT_END) = 1;
}

void sync_to_worker()
{
	struct image_synthesis_descriptor *desc = get_next_synthesis_desc();
	__asm volatile("" : : : "memory");
	desc->ready = 3;
	*((int *)OUTPORT_HANDLE_SHARED) = 1;
	__asm volatile("" : : : "memory");
	while (desc->ready == 3)
		__asm volatile("" : : : "memory");
}

void dct_coeff_read(plm_dma_buffer_t *buffer)
{
#if 0
	fifo_ctrl->hw_huffman_read_dct_coeff = 1;
	__asm volatile("" : : : "memory");
	*((volatile uint32_t *)OUTPORT) = fifo_ctrl->hw_huffman_read_dct_coeff;
	*((volatile uint32_t *)OUTPORT) = fifo_ctrl->read_bit_index;
#else
	*((volatile uint32_t *)OUTPORT) = plm_dma_buffer_read_vlc_uint(buffer, PLM_VIDEO_DCT_COEFF);
	*((volatile uint32_t *)OUTPORT) = fifo_ctrl->read_bit_index;
#endif
}

static void push_frame(plm_frame_t *frame)
{
	static int first_intra_frame_of_gop_occured = false;
	static int intra_frame_occured_during_stream = false;

	if (frame->picture_type == PLM_VIDEO_PICTURE_TYPE_INTRA)
		intra_frame_occured_during_stream = true;

	// To avoid scrambled graphics, the first frame to provide
	// for display, shall be an I frame
	if (!intra_frame_occured_during_stream)
		return;

	__asm volatile("" : : : "memory");

	while (frame_display_fifo->pictures_in_fifo > 8)
		__asm volatile("" : : : "memory");

	*((volatile plm_frame_t **)OUTPORT_FRAME) = frame;
	frame_display_fifo->y_adr = (uint32_t)frame->y.data;
	frame_display_fifo->u_adr = (uint32_t)frame->cb.data;
	frame_display_fifo->v_adr = (uint32_t)frame->cr.data;

	// The VMPEG driver needs to know when the first I frame occured during a GOP
	// We use the temporal ref for this, which starts at 0 with every GOP
	if (frame->temporal_ref == 0)
		first_intra_frame_of_gop_occured = false;

	if (!first_intra_frame_of_gop_occured && frame->picture_type == PLM_VIDEO_PICTURE_TYPE_INTRA)
	{
		first_intra_frame_of_gop_occured = true;
		frame_display_fifo->first_intra_frame_of_gop = 1;
	}
	else
	{
		frame_display_fifo->first_intra_frame_of_gop = 0;
	}

	frame_display_fifo->width = frame->width;

	if (frame_display_fifo->pictures_in_fifo < 5)
	{
		// It seems our FIFO is loosing pictures. Maybe the frame rate is slightly off?
		// Increase frame period by 0.1Hz when running at 25 FPS
		frame_display_fifo->frameperiod = seq_hdr_conf.frameperiod + 4780;
	}
	else if (frame_display_fifo->pictures_in_fifo > 6)
	{
		// It seems our FIFO is slightly overflowing. Maybe the frame rate is slightly off?
		// Decrease frame period by 0.1Hz when running at 25 FPS
		frame_display_fifo->frameperiod = seq_hdr_conf.frameperiod - 4780;
	}
	else
	{
		frame_display_fifo->frameperiod = seq_hdr_conf.frameperiod;
	}

	// The order is crucial since a write to height will commit the frame!
	__asm volatile("" : : : "memory");
	frame_display_fifo->height = frame->height;
	__asm volatile("" : : : "memory");
}

void main(void)
{
	plm_dma_buffer_t *buffer = plm_buffer_create_with_memory((uint8_t *)0x20000000, 700 * 1024 * 1024);
	if (!buffer)
		*((volatile uint8_t *)OUTPORT_END) = 2;

	while (!plm_dma_buffer_has(buffer, 1000))
		;

	plm_video_t *mpeg = plm_video_create_with_buffer(buffer, 0);
	if (!mpeg)
		*((volatile uint8_t *)OUTPORT_END) = 3;

	for (;;)
	{
		plm_frame_t *frame = plm_video_decode(mpeg);

		if (frame)
		{
			OUT_DEBUG = 27;

			sync_to_worker();
			worker_cnt++;
			sync_to_worker();

			OUT_DEBUG = 28;

			// Give some feedback to the user that we are running
			*((volatile uint32_t *)OUTPORT) = frame->time;

			push_frame(frame);
		}
		else
		{
			// End simulation since the MPEG stream has ended
			//*((volatile uint8_t *)OUTPORT_END) = 0;
		}
	}
}

/*
 * sbrk -- changes heap size size. Get nbytes more
 *         RAM. We just increment a pointer in what's
 *         left of memory on the board.
 */
caddr_t _sbrk(int nbytes)
{
	static caddr_t heap_ptr = NULL;
	caddr_t base;

	if (heap_ptr == NULL)
	{
		heap_ptr = (caddr_t)&_sp;
	}

	if ((RAMSIZE - heap_ptr) >= 0)
	{
		base = heap_ptr;
		heap_ptr += nbytes;
		return (base);
	}
	else
	{
		errno = ENOMEM;
		return ((caddr_t)-1);
	}
}
