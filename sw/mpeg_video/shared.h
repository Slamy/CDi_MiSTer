#pragma once

struct cmd_write_pixels
{
    int block_data[64];
    int macroblock_intra;
    int n;
    int *s;
    int di;
    uint8_t *d;
    int dw;
    int si;
};

struct cmd_process_macroblock
{
    uint8_t *s;
    uint8_t *d;
    int odd_h;
    int odd_v;
    int interpolate;
    int dw;
    int di;
    int si;
    int block_size;
};

struct image_synthesis_descriptor
{
    union
    {
        struct cmd_write_pixels cwp;
        struct cmd_process_macroblock cpm;
    };
    uint8_t ready; // set to 1 to enable processing by second core
    uint8_t cmdcnt;
};

struct image_synthesis_descriptor * const image_synthesis_buffer = (struct image_synthesis_descriptor *)0x40000000;
struct image_synthesis_descriptor * const image_synthesis_buffer2 = (struct image_synthesis_descriptor *)0x41000000;
int image_synthesis_buffer_index = 0;
int image_synthesis_buffer_index2 = 0;
static uint8_t cmdcnt = 0;
static uint8_t cmdcnt1 = 0;
static uint8_t cmdcnt2 = 0;
static int worker_cnt = 0;

#define CMD_SIZE 288
#define SHARED_BUFFER_ENTRIES (16384 / CMD_SIZE)

struct image_synthesis_descriptor *get_next_synthesis_desc()
{
    struct image_synthesis_descriptor *retval;

    if (worker_cnt & 1)
    {
        retval = &image_synthesis_buffer[image_synthesis_buffer_index++];

        if (image_synthesis_buffer_index == SHARED_BUFFER_ENTRIES)
            image_synthesis_buffer_index = 0;

        cmdcnt1++;
        retval->cmdcnt = cmdcnt1;
    }
    else
    {
        retval = &image_synthesis_buffer2[image_synthesis_buffer_index2++];

        if (image_synthesis_buffer_index2 == SHARED_BUFFER_ENTRIES)
            image_synthesis_buffer_index2 = 0;

        cmdcnt2++;
        retval->cmdcnt = cmdcnt2;
    }

    __asm volatile("" : : : "memory");

#if 1
    while (retval->ready != 0)
        __asm volatile("" : : : "memory");
#endif

    if (retval->ready != 0)
    {
        // something went horribly wrong
        *((volatile uint8_t *)OUTPORT_END) = 7;
        for (;;)
            ;
    }

    return retval;
}

/// @brief Invalidate all possible commands
/// Meant to be executed by the consuming worker cores
void clear_shared_memory()
{
    for (int i=0; i< SHARED_BUFFER_ENTRIES;i++)
    {
        image_synthesis_buffer[i].ready=0;
    }
}

struct image_synthesis_descriptor *get_next_ready_synthesis_desc()
{
    struct image_synthesis_descriptor *retval = &image_synthesis_buffer[image_synthesis_buffer_index++];

    OUT_DEBUG = 35;
    __asm volatile("" : : : "memory");

    while (retval->ready == 0)
        __asm volatile("" : : : "memory");

    cmdcnt++;
    if (cmdcnt != retval->cmdcnt)
    {
        // something went horribly wrong
        *((volatile uint8_t *)OUTPORT_END) = 8;
        for (;;)
            ;
    }

    OUT_DEBUG = 36;

    if (image_synthesis_buffer_index == SHARED_BUFFER_ENTRIES)
        image_synthesis_buffer_index = 0;

    return retval;
}
