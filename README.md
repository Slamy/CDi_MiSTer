# CDi_MiSTer

A repo dedicated to create an FPGA implementation of the Philips CD-i to be usable for the MiSTer FPGA project.
As every Philips CD-i player has a different hardware, this project focuses on reverse engineering the "Mono I" PCB.
This mainboard is used in models like the 210/00, 210/05 or 220/20.

This repository is very experimental! Use at your own risk!

The first games are booting. Expect a certain amount of bugs!

## Usage

Place `cdi200.rom` as `boot0.rom` in `/media/fat/games/CD-i`.
Place `zx405042p__cdi_slave_2.0__b43t__zzmk9213.mc68hc705c8a_withtestrom.7206` as `boot1.rom` next to it.

The save files containing the NvRAM is compatible with the CD-i emulation of MAME.

Digital gamepads, Analog gamepads and mice are supported for use with this core.
To play a title, load a CD and press on the play button at the start screen.
CD images can be stored as CHD or CUE/BIN format.

## Status

Core Utilization:

    Logic utilization (in ALMs)  13,431 / 41,910 ( 32 % )
    Total registers              15619
    Total block memory bits      630,471 / 5,662,720 ( 11 % )
    Total DSP Blocks             66 / 112 ( 59 % )

### TODOs in order of priority

* Fix regression: Audio hiccups during Philips Logo in Burn:Cycle
    * A workaround is CPU overclocking
* Investigate mysterious non loading behavior
* Investigate graphical glitches in intro of "Zenith"
    * CPU Speed? Timing of Video IRQs?
* Investigate "Zelda's Adventure" sound hiccups
    * During stop of audiomap and switch to audio channel playback
      the audio channel mask is set one sector too late.
* Investigate sound hiccups in both 2D Zelda games
    * Occurs during "Help-Cutscene" when SFX is played
    * Probably the same as with "Zelda's Adventure"
* Fix hang on audio track stop or change
* Investigate red bars in Hotel Mario intro
* Investigate single blue line at the top in Hotel Mario
* Investigate "Gray border glitch" at the top of "Myst" gameplay (seems to be only one plane)
* Fix reset behaviour (Core is sometimes hanging after reset)
* Add auto start of titles using front panel "Play" button
* Fix servo behaviour of always detecting a CD-i disc
* Investigate desaturated colors / low contrast in "Photo CD Sample Disc"
    * Probably fixable with 16-235 to 0-255 scaling
    * More investigation needed
* MCD212: Add RGB555
    * Fixes DYUV Test on "Validation Disc"
* Find a solution for the video mode reset during system resets
    * The ST flag is the issue here, causing a video mode change
* Add SNAC support (IR remote + wired controller)
* Refurbish I2C for the front display and show the content as picture in picture during changes?
    * It might not even be required at all.

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

## FAQ, Issues and Quirks

The production quality of the CD-i hardware and the software running on it is sometimes questionable.
For this reason, I've created a small list of some known quirks, someone might suspect of being caused
by emulation errors but are also present on the real machine.

* Is the "Digital Video Cartridge" supported?
    * No! Please stop asking!
    * Potential development on the DVC might only start after everything works without bugs on the base machine.
* The map of "Zelda - Wand of Gamelon" has micro jitter during scrolling
    * This also happens on real 210/05 hardware
* "Hotel Mario" seems to have the first samples of every ingame song repeated
    * You have good ears as it is barely noticable. This also happens on real hardware.
* Some earlier CD-i titles have both stereo channels swapped
    * Yes, according to an [internal memo from Philips](http://icdia.co.uk/docs/mono2status.zip) there
      were manufacturing issues and some early players have the left and right channel swapped. This might explain discrepancies.
    * One known quirk is inversed stereo on the "Philips Logo Jingle" of "Zelda - Wand of Gamelon"
* During the rotating transition in "Myst" there are glitched lines at the bottom
    * This also happens to some extent on a real 210/05 hardware and is caused by a misplaced Video IRQ
      The video data is changed while it is displayed.
* When I load a save game in "Burn:Cycle" it plays a short and unclean loop of noise until I do something
    * I thought that was a bug in the core at first too. However, it is actually like this on a real CD-i too.
* Burn:Cycle - Random flickering animated text in front of the "Psychic Roulette" credit card terminal
    * This actually happens on the real machine. I also thought this might be a CPU speed issue, considering that
      the flickering disappears if the CPU is slightly overclocked.
    

