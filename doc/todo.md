# TODOs and known issues

* Check correct timing of DVC clipping functionality when scroll bit is reset
* Regression of "Imagination in Motion - A New Era in 3D Chill Out Video"
    * Pausing and continue causes audio stop
    * Working in 260123, broken in 260131
* Regression of "The Apprentice"?
    * The audio on the title screen sometimes has crackles. (~5% chance of occurrence)
    * Start of regression unknown
* Moving window homebrew test timing is broken with 260123
    * Was working in 260104. Also broken with 260116
* Implement the speed setting of the 22ER9017 Touchpad
* Add support for MPEG Layer I
    * Affected disc is "AIMS - Learning About Ecology (1995)(AIMS Multimedia)(US)"
* Frequency response of CDIC and MPEG audio output might not be 100% accurate
* Add support for an emulated Peacekeeper Revolver Light Gun
* "Uncover featuring Tatjana (Europe)" regressions?
    * Corruption of MPEG footage in single step mode?
* Regression of "Historia del Arte Español" (working in DVC rc2)
    * Blank video?
* Fix Christmas Crisis bonus ride
    * Might still stutter. Analysis required.
* "Mutant Rampage - Bodyslam" has a tendency to freeze?
* "The Last Bounty Hunter", "Drug Wars", "Mad Dog 2", "Who Shot Johnny Rock?" have regressions (works in rc2)?
* "Chaos Control" has video glitches?
* "The Lost Ride" has video and audio glitches
    * It changes Sequence Parameters on the fly
* "Crime Patrol" has video glitches?
* "Solar Crusade" has video glitches?
* "Brain Dead 13" has video glitches when switching MPEG streams
* "The Secret of Nimh" (Philips Edition) has the wrong frame rate? Sometimes?
* Slow motion with VCDs is desyncing audio and video
    * Too many frames in output FIFO
* Leaving the cake Puzzle in 7th Guest freezes (everytime?)
* Sound bugs on the police procedures disk?
* Find a better solution for reducing CPU speed
* Give a signal to the user when CPU data stalling occured
* Find a better solution for CD data stalling (take a screenshot)
    * PSX core seems to halt the whole machine to avoid this situation
* Fix regression: Audio hiccups during Philips Logo in Burn:Cycle
    * A workaround is CPU overclocking
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
* CD+G
* Check compatibility with CDs that have track index 2 as opposed to the usual 0 and 1
    * Possible discs? "Philips CDI Format Test Disc 1 (Europe)" and a disc by Zeneca Pharmaceuticals Group, "An Interactive Medical Program"
* Possibly adding support for other PCBs (like Mono II)
* Possibly adding support for the Quizard arcade hardware
* Refurbish I2C for the front display and show the content as picture in picture during changes?
    * It might not even be required at all.
