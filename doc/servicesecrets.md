# Philips Service Secrets

## Service Shells via UART

With a terminal connected to the back port of the CD-i and baud rate 9600, hold one of these keys during bootup.

### Shift + B

Log of the boot process


    1) Initialising slave processor
    2) Initialising video processor
    3) Clearing system RAM
    4) Building system exception table
    5) Determining the cpu type
    6) Initialising video (blue screen)
    7) Determining and enabling the display
    8) Executing RAM/ROM search
    9) Starting the kernel

### Space

Low level test menu

            CD-I MONO BOARD low level test      REL. 1.2
            ------------------------------      --------

            Press any key to test receiver
            Receiver o.k., you pressed:   20

            Initializing VDSC REGS

    1. Exit Low level test
    2. Writing to a default RAM address
    3. ROM parity check
    4. Nvram test
    5. Dram test
    6. Cdic test
    7. Slave processor test
    8. Clock Calibration
    9. Attex test
    10. X-bus test

### Shift + F

Service menu of the DVC

    PHILIPS - CDI                                       FMV Low Level Test  Rel 5.0



        0. Exit FMV low level test
        1. Writing to a default RAM address
        2. ROM parity check
        3. DRAM test
        4. DRAM test extended
        5. Extension DRAM test (1 Mb)
        6. Video/Audio Host interface test
        7. FMV test menu
        8. DSP test menu
        9. Pal test menu

        Please make a selection:

### 0x06

According to cdifan for the PCB low level test