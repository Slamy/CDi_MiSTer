# CDi_playground

A repo dedicated to create an FPGA implementation of the Philips CD-i to be usable for the MiSTer project

This repository is very experimental! Use at your own risk!

The currently planned first milestone is having the boot rom usable
on the MiSTer.
It requires no CDIC to function.


## Status

* CD-I MONO BOARD low level test is functional
	* ROM parity check passed
	* Dram test passed
	* Nvram test passed
	* Cdic test passed (tests only memory...)
	* Slave processor test passed
* MCD212
	* SDRAM interface slow but functional
	* ICA/DCA parser partially implemented
	* CLUT7 RLE partially implemented (currently bugged)
	* Display File partially implemented (currently bugged)
* SCC68070
	* UART interface accessible from MiSTer linux
	* Timer IRQ implemented
	* Custom bus error frames implemented
* SLAVE
	* Interface to main CPU implemented
	* Answers to basic requests from main CPU
* MiSTer
	* Rom loading via Menu functional

## TODOs

* Implement boot rom loading for slave to avoid legal issues
* Fix "Error: system state exception; vector #$0010  at addr $00001500" during boot
	* Might be related to wrong on-chip auto-vectoring
* Implement ICA/DCA parser
* Implement functional video channel 1
* Attach MiSTer input system to the SLAVE controller
* Have the system menu usable on MiSTer
* Evaluate wrong answer on PAL/NTSC status from SLAVE
	* Right now, the expected answer 0x02 is inserted with glue logic
* Implement the CDIC audio parts
* Implement the CDIC CD parts
* Implement SPI interface to CD controller on SLAVE
* Fix I2C for the front display and show the display as picture in picture during changes?
	* It might not even be required at all.
* Have CD data available for the CDIC
* Use the MiSTer framework to save the NVRAM to sdcard
	* Only when changes are detected and when the OSD is opened
	* The N64 core does it like that to

## Expected checksums of roms

This core is tested with these ROMs:

	2969341396aa61e0143dc2351aaa6ef6  cdi200.rom
	3d20cf7550f1b723158b42a1fd5bac62  zx405042p__cdi_slave_2.0__b43t__zzmk9213.mc68hc705c8a_withtestrom.7206

Due to legal reasons, these files must be sourced separately.

