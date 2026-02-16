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

struct image_synthesis_descriptor *const image_synthesis_buffer[3] = {
    (struct image_synthesis_descriptor *)0x40000000,
    (struct image_synthesis_descriptor *)0x41000000,
    (struct image_synthesis_descriptor *)0x42000000,
};
int image_synthesis_buffer_index[3] = {0, 0, 0};
static uint8_t cmdcnt[3] = {0, 0, 0};
static int worker_cnt = 0;

#define CMD_SIZE 288
#define SHARED_BUFFER_ENTRIES (8192 / CMD_SIZE)

struct image_synthesis_descriptor *get_next_free_synthesis_desc()
{
    struct image_synthesis_descriptor *retval;
    retval = &image_synthesis_buffer[worker_cnt][image_synthesis_buffer_index[worker_cnt]];
    __asm volatile("" : : : "memory");
#if 1
    while (retval->ready != 0)
        __asm volatile("" : : : "memory");
#else
    if (retval->ready != 0)
    {
        // something went horribly wrong
        *((volatile uint8_t *)OUTPORT_END) = 7;
        for (;;)
            ;
    }
#endif
    return retval;
}

void commit_synthesis_desc(struct image_synthesis_descriptor *desc, int ready_code)
{
    image_synthesis_buffer_index[worker_cnt]++;
    if (image_synthesis_buffer_index[worker_cnt] == SHARED_BUFFER_ENTRIES)
        image_synthesis_buffer_index[worker_cnt] = 0;

    cmdcnt[worker_cnt]++;
    desc->cmdcnt = cmdcnt[worker_cnt];
    __asm volatile("": : :"memory");
	desc->ready=ready_code;
    __asm volatile("" : : : "memory");
}

/// @brief Invalidate all possible commands
/// Meant to be executed by the consuming worker cores
void clear_shared_memory()
{
    for (int i = 0; i < SHARED_BUFFER_ENTRIES; i++)
    {
        image_synthesis_buffer[0][i].ready = 0;
    }
}

struct image_synthesis_descriptor *get_next_ready_synthesis_desc()
{
    struct image_synthesis_descriptor *retval = &image_synthesis_buffer[0][image_synthesis_buffer_index[0]++];

    DEBUG_STATE = 35;
    __asm volatile("" : : : "memory");

    while (retval->ready == 0)
        __asm volatile("" : : : "memory");

    cmdcnt[0]++;
    if (cmdcnt[0] != retval->cmdcnt)
    {
        // something went horribly wrong
        *((volatile uint8_t *)OUTPORT_END) = 8;
        for (;;)
            ;
    }

    DEBUG_STATE = 36;

    if (image_synthesis_buffer_index[0] == SHARED_BUFFER_ENTRIES)
        image_synthesis_buffer_index[0] = 0;

    return retval;
}
