# TODOs and known issues

* Improve implementation of VCD pixel clock
    * The current visual quality is subpar and shows scaling artifacts during panning shots
    * Analysis of digital VMPEG DVCs might be required
    * Alternative would be horizontal linear interpolation or a low pass
* Add support for MPEG Layer I
    * Affected disc is "AIMS - Learning About Ecology (1995)(AIMS Multimedia)(US)"
* Add support for an emulated Peacekeeper Revolver Light Gun
* "Who Shot Johnny Rock?" is not stopping the Philips Logo animation when pressing a button
    * A gun shot can be heard, so the press is registered.
    * The intro of the game also can't be skipped
    * cdiemu doesn't have this problem
* "Uncover featuring Tatjana (Europe)" regressions?
* Regression of "Historia del Arte Español" (working in DVC rc2)
    * Blank video?
* Fix Christmas Crisis bonus ride
    * Might still stutter. Analysis required.
* Add MPEG audio attenuation (e.g. Lost Eden)
* "Mutant Rampage - Bodyslam" has a tendency to freeze?
* "The Last Bounty Hunter", "Drug Wars", "Mad Dog 2", "Who Shot Johnny Rock?" have regressions (works in rc2)?
* "Chaos Control" has video glitches?
* "The Lost Ride" has video glitches?
* "Crime Patrol" has video glitches?
* "Solar Crusade" has video glitches?
* "Brain Dead 13" has video glitches when switching MPEG streams
* "The Secret of Nimh" (Philips Edition) has the wrong frame rate? Sometimes?
* Slow motion with VCDs is behaving incorrect
* Leaving the cake Puzzle in 7th Guest freezes (everytime?)
* Sound bugs on the police procedures disk?
* Find a better solution for reducing CPU speed
* Black flicker during intro of Ultimate Noah's Ark in 60 Hz mode
    * A workaround is CPU overclocking. Problem not visible on real machine.
* Give a signal to the user when CPU data stalling occured
* Find a better solution for CD data stalling (take a screenshot)
    * PSX core seems to halt the whole machine to avoid this situation
* Fix regression: Audio hiccups during Philips Logo in Burn:Cycle
    * A workaround is CPU overclocking
* Add missing MCD212 features
    * Pixel Hold
* Investigate input responsiveness (skipped events?)
* Fix hang on audio track stop or change in media player
* Cheat support?
* Fix reset behaviour (Core is sometimes hanging after reset)
* Investigate desaturated colors / low contrast in "Photo CD Sample Disc"
    * Probably fixable with 16-235 to 0-255 scaling
    * More investigation needed
* Find a solution for the video mode reset during system resets
    * The ST flag is the issue here, causing a video mode change
* Add SNAC support (IR remote + wired controller)
    * RC5 support is added. A test using real hardware is required.
* Add 2 player support
* CD+G
* Check compatibility with CDs that have track index 2 as opposed to the usual 0 and 1
* Possibly adding support for other PCBs (like Mono II)
* Refurbish I2C for the front display and show the content as picture in picture during changes?
    * It might not even be required at all.
