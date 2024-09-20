# CDIC

## CD-i Fan Documentation

Coming from https://github.com/cdifan/cdichips/blob/master/ims66490cdic.md

    0000 - 09FF 	DATA buffer 0
    0A00 - 13FF 	DATA buffer 1
    2800 - 31FF 	ADPCM buffer 0
    3200 - 3BFF 	ADPCM buffer 1
    3C00 - 3FFE 	Register area

## MAME behaviour

No datahseets available. Will use software emulation of MAME for reconstruction.

First usage in MAME when "Frog Feast" disc is inserted

    [:cdic] ':maincpu' (00429708): cdic_w: Interrupt Vector Register = 2480 & ffff
    [:cdic] ':maincpu' (0042976E): cdic_w: Z-Buffer Register Write: 0000 & ffff
    [:cdic] ':maincpu' (00429774): cdic_w: Command Register = 0024 & ffff
    [:cdic] ':maincpu' (00429780): cdic_w: Data Buffer Register = 8000 & ffff
    [:cdic] ':maincpu' (00429780): cdic_w: Data Buffer high-bit set, beginning command processing
    [:cdic] ':maincpu' (00429780): cdic_w: Reset Mode 2 command
    [:cdic] ':maincpu' (00429784): cdic_r: Data buffer Register = 0000 & ffff
    [:cdic] ':maincpu' (00429788): cdic_r: X-Buffer Register = 0000 & ffff
    [:cdic] ':maincpu' (00429788): Clearing CDIC interrupt line
    
But this is very early on. Nothing is really done here. No CD interaction.

    [:cdic] ':maincpu' (0042AD7A): cdic_r: Data buffer Register = 0000 & ffff
    [:cdic] ':maincpu' (00429AEE): cdic_w: Command Register = 0029 & ffff
    [:cdic] ':maincpu' (00429B00): cdic_w: Time Register (MSW) = 0002 & ffff
    [:cdic] ':maincpu' (00429B00): cdic_w: Time Register (LSW) = 1600 & ffff
    [:cdic] ':maincpu' (00429B1C): cdic_w: Data Buffer Register = c000 & ffff
    [:cdic] ':maincpu' (00429B1C): cdic_w: Data Buffer high-bit set, beginning command processing
    [:cdic] ':maincpu' (00429B20): cdic_r: Data buffer Register = 4000 & ffff
    [:cdic] ':maincpu' (00429B24): cdic_r: X-Buffer Register = 0000 & ffff
    [:cdic] ':maincpu' (00429B24): Clearing CDIC interrupt line
    [:cdic] Sector tick, waiting on spinup
    
Time passes

    [:cdic] About to process a disc sector
    [:cdic] Disc sector, current LBA: 000000a6, MSF: 00 02 16
    [:cdic] Sector header data: 00 ff ff ff ff ff ff ff ff ff ff 00 00 02 16 02 00 00 09 00 00 00 09 00

IRQ is now set

    [:cdic] ':maincpu' (0042B058): cdic_r: Data buffer Register = 4001 & ffff
    [:cdic] ':maincpu' (0042B068): cdic_r: X-Buffer Register = 8000 & ffff
    [:cdic] ':maincpu' (0042B068): Clearing CDIC interrupt line
    [:cdic] ':maincpu' (0042B0A0): cdic_r: Command Register = 0029 & ffff
    [:cdic] ':maincpu' (00429C42): ram_r: 0a02 : 1602 & ffff
    [:cdic] ':maincpu' (00429C5E): ram_r: 0a0a : 0900 & ffff
    [:cdic] ':maincpu' (0042AA12): cdic_w: DMA Control Register = 8a0c & ffff
    [:cdic] ':maincpu' (0042AA12): Memory address counter: 00efae50
    [:cdic] ':maincpu' (0042AA12): Doing copy, transferring 0800 bytes to main RAM
    [:cdic] ':maincpu' (00429CA8): cdic_w: Data Buffer Register = 0000 & ffff

MAME uses HLE for DMA here.
The lowest bit of the data buffer register seems to indicate the buffer were it is stored.
As the bit is set, the data buffer 1 from 0A00 - 13FF is used.
The sector header seems to match. Endianess must still be swapped though.

    0a00 00 00
    0a02 02 16
    0a04 02 00
    0a06 00 09
    0a08 00 00
    0a0a 00 09
    0a0c 00

### Commands

When bit 15 in the Data Buffer Register is set, the command is parsed and the bit is reset automatically.
Only then is it transferred into a shadow register and used for CD reading.

Setting command to 0x23 or 0x24 stops reading after the next sector.
Even without setting a bit in data buffer.

The bit 14 in the data buffer register must be set for the CDIC to work. Resetting it
stops the whole process.

    0x23 Reset Mode 1  According to MAME, reads only sector
    0x24 Reset Mode 2  According to MAME, reads only sector
    0x2b Stop CDDA     According to MAME, fully stops CDIC
    0x2e Update
    0x27 Fetch TOC     ?
    0x28 Play CDDA     ?
    0x29 Read Mode 1   Seek to timestamp in Time Register and start reading Mode 1
    0x2a Read Mode 2   Seek to timestamp in Time Register and start reading Mode 2
    0x2c Seek          ? According to Mame, equal to 0x29 ?

### Register

Data Buffer Register[15] Set bit to transfer command register to shadow command register
Data Buffer Register[2] Related to Audio?
Data Buffer Register[0] Is toggled after reading a sector. Ensures double buffering is used


## Inspirations

https://raw.githubusercontent.com/MiSTer-devel/MegaCD_MiSTer/master/MegaCD.sv

	"S0,CUECHD,Insert Disk;",

https://raw.githubusercontent.com/MiSTer-devel/PSX_MiSTer/main/PSX.sv

    "H7S1,CUECHD,Load CD;",

https://github.com/MiSTer-devel/TurboGrafx16_MiSTer/blob/master/TurboGrafx16.sv

    "S0,CUECHD,Insert CD;",

Mount SD card?

PSX:

   constant RAW_SECTOR_SIZE         : integer := 2352;
   constant SECTOR_SYNC_SIZE        : integer := 12;
   constant RAW_SECTOR_OUTPUT_SIZE  : integer := RAW_SECTOR_SIZE - SECTOR_SYNC_SIZE;
   constant DATA_SECTOR_SIZE        : integer := 2048;
   constant PREGAPSIZE              : integer := 150;
   
   constant FRAMES_PER_SECOND       : integer := 75;
   constant FRAMES_PER_MINUTE       : integer := 75 * 60;

    seekLBA <= to_integer(setLocMinute) * FRAMES_PER_MINUTE + to_integer(setLocSecond) * FRAMES_PER_SECOND + to_integer(setLocFrame);

                      readLBA <= seekLBA;


               readLBA_buffer    <= readLBA;
                     lastReadSector    <= readLBA_buffer;
    cd_hps_lba       <= std_logic_vector(to_unsigned(lastReadSector, 32));
