# CDi_MiSTer

A repo dedicated to create an FPGA implementation of the Philips CD-i to be usable for the MiSTer FPGA project

This repository is very experimental! Use at your own risk!

The first games are booting. Graphics are glitched and audio is broken.

## Usage

Place `cdi200.rom` as `boot0.rom` in `/media/fat/games/CD-i`.
Place `zx405042p__cdi_slave_2.0__b43t__zzmk9213.mc68hc705c8a_withtestrom.7206` as `boot1.rom` next to it.

Keep in mind that - for now - a special [MiSTer Main application](https://github.com/Slamy/Main_MiSTer) is required for the CD drive emulation.

The save files containing the NvRAM is compatible with the CD-i emulation of MAME.

## Status

* CD-I MONO BOARD low level test is functional
    * ROM parity check passed
    * Dram test passed
    * Nvram test passed
    * Cdic test passed (tests only memory...)
    * Slave processor test passed
* MCD212
    * SDRAM interface according to specification
    * ICA/DCA parser partially implemented
    * CLUT7 RLE partially implemented
    * Display File partially implemented
* SCC68070
    * UART interface accessible from MiSTer linux
    * Timer IRQ implemented
    * Custom bus error frames implemented
    * DMA Channel 1 supported
* SLAVE
    * Interface to main CPU implemented
    * Answers to basic requests from main CPU
    * Maneuvering device simulated with MiSTer controller input
* SERVO
    * High level behaviour simulation
* CDIC
    * Basic data sector reading
* MiSTer
    * ISO Mounting via Menu functional
    * Automatic boot rom loading for main cpu and slave
    * Backup and Restore of NvRAM

Core Utilization:

    Logic utilization (in ALMs)  13,683 / 41,910 ( 33 % )
    Total registers              15422
    Total block memory bits      634,055 / 5,662,720 ( 11 % )
    Total DSP Blocks             68 / 112 ( 61 % )

## TODOs in order of priority

* Investigate mysterious non loading behavior
* Investigate graphical glitches with "Zenith"
* Investigate "Earth Command" hanging after intro
* Investigate "Zelda's Adventure" sound hiccups
* Investigate crashed audio in both 2D Zelda games
    * Occurs during "Help-Cutscene" when SFX is played
* Implement audio mixing and panning
    * Fixes frequently used Stereo to Mono mixing in games with SFX
    * Might fix weirdly mixed german + english voice in Kether
    * Unmute is still a mystery. Not solved in any known CD-i emulator
* Investigate "Felix the Cat" sound problems
* Investigate "Plunderball" gameplay being too fast (CPU speed?)
* Fix hang on audio track stop or change
* Investigate flicker of graphics in Hotel Mario (CPU speed?)
* Investigate red bars in Hotel Mario intro
* Investigate weird glitches at the bottom in "Myst" gameplay when rotating (CPU speed?)
* Investigate "Gray border glitch" at the top of "Myst" gameplay (seems to be only one plane)
* Fix reset behaviour / Core is unstable
* Add auto start of titles using front panel "Play" button
* Fix servo behaviour of always detecting a CD-i disc
* Investigate desaturated colors / low contrast in "Photo CD Sample Disc"
    * The colors seem to be a little bit to bright?
    * For some reason MAME is really dark, also not accurate
* MCD212: Add RGB555
    * Fixes DYUV Test on "Validation Disc"
* Find a solution for the video mode reset during system resets
    * The ST flag is the issue here, causing a video mode change
* Add SNAC support (IR remote + wired controller)
* Refurbish I2C for the front display and show the content as picture in picture during changes?
    * It might not even be required at all.
* Fix timekeeper initial time

## Expected checksums of roms

This core is tested with these ROMs:

    2969341396aa61e0143dc2351aaa6ef6  cdi200.rom
    3d20cf7550f1b723158b42a1fd5bac62  zx405042p__cdi_slave_2.0__b43t__zzmk9213.mc68hc705c8a_withtestrom.7206

Due to legal reasons, these files must be sourced separately.

## Used resources

This MiSTer core would've probably never been possible without the reverse engineering efforts of certain people.
Thanks to [CD-i Fan](https://www.cdiemu.org/) for the insights into his closed source CD-i Emulator.
Also Thanks to MooglyGuy, which took on the task of implementing a CD-i emulator into MAME, which I used to analyse
the program flow of the CD-i boot process.

* https://github.com/TobiFlex/TG68K.C
* https://opencores.org/projects/68hc05
* https://github.com/cdifan/cdichips
* http://www.icdia.co.uk/microware/index.html
* https://github.com/Stovent/CeDImu/blob/master/src/CDI/OS9/SystemCalls.hpp

