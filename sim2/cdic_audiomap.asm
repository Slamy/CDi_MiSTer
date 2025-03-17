	section .text

    org $400000

vector:
	dc.l $1234
	dc.l main


play_audiomap:
	move.w #$0024,$303C00 ; Command Register = Reset Mode 2
	move.w #$8000,$303FFE ; Data buffer

	move.w #$2480,$303FFC ; Interrupt Vector
	move.w #$002a,$303C00 ; Read Mode 2
	move.w #$0100,$303C06 ; File Register
	move.l #$8000,$303C08 ; Channel Register
	move.w #$0000,$303C0C ; Audio Channel Register
	
	; Tetris 00 35 68 00356800 Philips Logo   Coding 01, 2 channels, 4 bits, 000093a8 frequency
	; Tetris 01 42 67 01426700 Main Menu      Coding 05, 2 channels, 4 bits, 000049d4 frequency
	; Tetris 55 50 33 55503300 Intro          Coding 05, 2 channels, 4 bits, 000049d4 frequency
	; Frog Feast      00354400 Main Menu      Coding 11, 2 channels, 8 bits, 00000000 frequency
	
	; Hotel Mario     07494800 First Level
	move.l #$07494800,$303C02 ; Timer Register
	move.l #$4000,$303C08 ; Channel Register
	move.w #$0000,$303C0C ; Audio Channel Register

	move.w #$C000,$303FFE ; Start the Read by setting bit 15 of the data buffer

	; Play two sectors of music using the audio map
	move.b #'0',$80002019
	jsr waitforirq
	move.b #'A',$80002019
	move.w #$8a00,d0
	move.w #$a800,d1 ; 0x2800
	jsr movedata

	move.b #'1',$80002019
	jsr waitforirq
	move.b #'B',$80002019
	move.w #$8000,d0
	move.w #$b200,d1; 0x3200
	jsr movedata

	jsr waitforirq
	rts

play_some_cd_sectors:
	; Start normal Audio reading of the same song.
	move.w #$0024,$303C00 ; Command Register = Reset Mode 2
	move.w #$8000,$303FFE ; Data buffer

	move.w #$2480,$303FFC ; Interrupt Vector
	move.w #$002a,$303C00 ; Read Mode 2
	move.w #$0100,$303C06 ; File Register
	move.l #$8000,$303C08 ; Channel Register
	move.w #$8000,$303C0C ; Audio Channel Register

	; Tetris 00 35 68 00356800 Philips Logo   Coding 01, 2 channels, 4 bits, 000093a8 frequency
	move.l #$00356800,$303C02 ; Timer Register

	; Tetris 01 42 67 01426700 Main Menu      Coding 05, 2 channels, 4 bits, 000049d4 frequency
	; Tetris 55 50 33 55503300 Intro          Coding 05, 2 channels, 4 bits, 000049d4 frequency
	; Frog Feast      00354400 Main Menu      Coding 11, 2 channels, 8 bits, 00000000 frequency
	; Hotel Mario     07494800 First Level
	move.l #$07494800,$303C02 ; Timer Register
	move.l #$4000,$303C08 ; Channel Register
	move.w #$4000,$303C0C ; Audio Channel Register

	; Hotel Mario     09597300 Lost a life
	move.l #$09597300,$303C02 ; Timer Register
	move.l #$8000,$303C08 ; Channel Register
	move.w #$8000,$303C0C ; Audio Channel Register
	
	move.w #$C000,$303FFE ; Start the Read by setting bit 15 of the data buffer

	; Wait for the music to play back some sectors

	jsr waitforirq

	move.w #$0800,$303FFA ; Start playback

	jsr waitforirq
	jsr waitforirq

	move.w #$0000,$303FFE ; Stop CD reading
	move.w #$0000,$303FFA ; Stop playback

	rts

main:
	move.l #cdicirq,$200
	move #$2000,SR

	move.w #$2480,$303FFC ; IRQ vector

endless:
	; First we play an audiomap
	jsr play_audiomap

	; Stop Audiomap, no IRQ expected, because stopped using Audio Control Write
	move.w #$0,$303FFA 

	move.w #$0000,$303FFE ; Stop CD reading

	; Wait a bit
	move #3000,d0
	jsr wait

	; Then we play some music from CD
	jsr play_some_cd_sectors

	; Wait a bit
	move #3000,d0
	jsr wait

	; Then we play some audiomap again
	jsr play_audiomap

	; Forcing a stop by inserting 0xff into coding
	; IRQ is still expected after this!
	move.w #$ff,$30280a
	move.w #$ff,$30320a

	; Wait a bit
	move #3000,d0
	jsr wait

	; And again some music from CD
	
	jsr play_some_cd_sectors

	bra endless



movedata:
	; Check CDIC ram like the driver does
	move.w $300000,d7
	move.w $300002,d7
	
	move.w $300000,d7
	move.w $300002,d7
	
	move.w $300a00,d7
	move.w $300a02,d7

	move.w $302808,d7
	move.w $30280a,d7

	move.w $303208,d7
	move.w $30320a,d7

	; Move sector to system memory
	move.b d0,$80004000 ; reset status
	move.l #$3000,$8000400c ; Memory Address Counter
	move.w #$500,$8000400a  ; Size is one sector
	move.b #$92,$80004005 ; Dev. to Mem., 16 Bit Words, 
	move.b #$80,$80004007 ; start DMA
	move.w d0,$303FF8 ; DMA Control Register = Start Transmission at a00

	nop
	nop
	
	; Move sector to ADPCM memory
	move.b d0,$80004000 ; reset status
	move.l #$3000,$8000400c ; Memory Address Counter
	move.w #$500,$8000400a  ; Size is one sector
	move.b #$12,$80004005 ; Mem. to Dev., 16 Bit Words, 
	move.b #$80,$80004007 ; start DMA
	move.w d1,$303FF8 ; DMA Control Register = Start Transmission at a00

	move.w $302800,d7
	move.w $302802,d7
	move.w $302808,d7
	move.w $30280a,d7
	move.w $303208,d7
	move.w $30320a,d7
	move.w $303200,d7
	move.w $303202,d7

	move.w #$2800,$303FFA ; Start Audiomap at 0x2800
	rts

wait:
	add #-1,d0
	bne wait
	rts

waitforirq:
	move #0,d0
waitforirqloop:
	tst d0
	beq waitforirqloop
	move.b #'O',$80002019
	rts

cdicirq:
	move.b #'I',$80002019
	move.w $303FF4,d0 ; clear flags on ABUFD
	; ignore ABUF

	move.w $303FF6,d0 ; clear flags on XBUF

	btst.l #$f,d0
	beq noint

	; Highest bit is set
	move #1,d0
	rte
noint:
	move #0,d0
	rte
