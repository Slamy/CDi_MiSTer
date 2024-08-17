# Video

30 MHz or 28 MHz ? The MCD212 can do both.
Bootscreen is 384 * 280
This usually would indicate a PAL CD-i.
This also means that 30 MHz would be correct.

The active line would take up 51.2µs.
A full line must be 64µs.

CM=0
CF=1
ST=0

With 96 *16 = 1536 visible clock cycles with a resolution of 384,
we have one pixel every 4 clocks. With CM=1 we have double
the horizontal resolution. This means 2 clocks per pixel.


# Video Memory Timing

According to MCD212 chapter 4-2, everything is synchronized. Like with the Amiga DMA.

One display period of 32 clock cycles contains pixel data for 8 pixels.
8 cycles for CH1, 8 cycles for CPU, 8 cycles for CH2, 8 cycles for CPU

11 clock cycles are required to perform 4 DRAM reads of 16 bit each.
RGB555 is able to get 4 pixels out of this which is the exact required timing as one
pixel must be pushed out every 4 clocks.
