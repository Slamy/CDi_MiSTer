#include <stdint.h>

static inline void memory_interface_test(void *test_adr)
{
    volatile union
    {
        volatile uint32_t word;
        volatile uint8_t byte[4];
    } *test_area = test_adr;

    test_area->word = 0x12345678;

    if (test_area->byte[0] != 0x78)
        *((volatile uint32_t *)OUTPORT_END) = 0x100;

    if (test_area->byte[3] != 0x12)
        *((volatile uint32_t *)OUTPORT_END) = 0x101;

    test_area->byte[0] = 0xab;

    if (test_area->byte[3] != 0x12)
    *((volatile uint32_t *)OUTPORT_END) = 0x102;

    if (test_area->byte[0] != 0xab)
    *((volatile uint32_t *)OUTPORT_END) = 0x103;

    if (test_area->word != 0x123456ab)
        *((volatile uint32_t *)OUTPORT_END) = test_area->word;

    test_area->byte[2] = 0xcd;

    if (test_area->word != 0x12cd56ab)
        *((volatile uint32_t *)OUTPORT_END) = test_area->word;
}
