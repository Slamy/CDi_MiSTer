# CDi_playground
A repo dedicated to create an FPGA implementation of the Philips CDi

This repository is very experimental.
The current planned first milestone is having the boot rom usable
on the MiSTer.
It requires no CDIC to function.

## TODOs

* Implement ICA/DCA parser
* Interface to MiSTer framework
* Implementation of SDRAM controller
* Using MiSTer framework to load cdi200.rom and slave rom
* Fix wrong answer on PAL/NTSC status from SLAVE
* Implement the CDIC
* Implement SPI interface to CD controller on SLAVE
* Fix I2C for the front display

