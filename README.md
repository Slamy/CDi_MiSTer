# CDi_MiSTer

A repo dedicated to create an FPGA implementation of the Philips CD-i to be usable for the MiSTer FPGA project

This repository is very experimental! Use at your own risk!

The first games are booting. Graphics are glitched and audio is broken.

## Usage

Place `cdi200.rom` as `boot0.rom` in `/media/fat/games/CD-i`.
Place `zx405042p__cdi_slave_2.0__b43t__zzmk9213.mc68hc705c8a_withtestrom.7206` as `boot1.rom` next to it.

Keep in mind that - for now - a special [MiSTer Main application](https://github.com/Slamy/Main_MiSTer) is required for the CD drive emulation.

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

Core Utilization:

	Logic utilization (in ALMs)  12,724 / 41,910 ( 30 % )
	Total block memory bits      634,052 / 5,662,720 ( 11 % )
	Total DSP Blocks             65 / 112 ( 58 % )

## TODOs in order of priority

* Add Interlacing
* Implement CDIC 8Bit XA audio
* Fix clicks and pops during playback
* Check proper sector filtering
* Implement the CDIC audio map (sound effects)
* Fix DYUV Test on "Validation Disc" (CLUT8 colors wrong)
* Implement the CDIC CDDA for audio cd tracks
* CDIC Fetch TOC (The Apprentice)
* CDIC Descrambler (The Apprentice)
* CDIC Byteswap (The Apprentice)
* Simulate seeking time
* Fix reset behaviour / Core is unstable
* Fix unexpected hang when an application exits
* Fix servo behaviour of always detecting a CD-i disc
* Use the MiSTer framework to save the NVRAM to sdcard
	* Only when changes are detected and when the OSD is opened
	* The N64 core does it like that too
* Add alternative input devices (a mouse)
* OSD setting for input device conformance (1200 baud)
* Refurbish I2C for the front display and show the content as picture in picture during changes?
	* It might not even be required at all.
* Fix timekeeper initial time

## Expected checksums of roms

This core is tested with these ROMs:

	2969341396aa61e0143dc2351aaa6ef6  cdi200.rom
	3d20cf7550f1b723158b42a1fd5bac62  zx405042p__cdi_slave_2.0__b43t__zzmk9213.mc68hc705c8a_withtestrom.7206

Due to legal reasons, these files must be sourced separately.

## Used resources

* https://github.com/TobiFlex/TG68K.C
* https://opencores.org/projects/68hc05
* https://github.com/cdifan/cdichips
* http://www.icdia.co.uk/microware/index.html
* https://github.com/Stovent/CeDImu/blob/master/src/CDI/OS9/SystemCalls.hpp

