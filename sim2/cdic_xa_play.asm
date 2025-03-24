	section .text

    org $400000

vector:
	dc.l $1234
	dc.l main

main:
	move.l #cdicirq,$200
	move #$2000,SR

	move.w #$2480,$303FFC ; IRQ vector

	move.w #$0024,$303C00 ; Command Register = Reset Mode 2
	move.w #$8000,$303FFE ; Data buffer

	move.w #$2480,$303FFC ; Interrupt Vector
	move.w #$002a,$303C00 ; Read Mode 2

	; Tetris
	; move.w #$0100,$303C06 ; File Register
	; move.l #$8000,$303C08 ; Channel Register
	; move.w #$8000,$303C0C ; Audio Channel Register

	; Hotel Mario Intro
	move.w #$0100,$303C06 ; File Register
	move.l #$8000,$303C08 ; Channel Register
	move.w #$8000,$303C0C ; Audio Channel Register
	move.l #$00471800,$303C02 ; Timer Register

	; Hotel Mario     07494800 First Level
	move.l #$4000,$303C08 ; Channel Register
	move.w #$4000,$303C0C ; Audio Channel Register
	move.l #$07494800,$303C02 ; Timer Register

	; Apprentice USA Philips Logo
	move.w #$0000,$303C06 ; File Register
	move.l #$8000,$303C08 ; Channel Register
	move.w #$8000,$303C0C ; Audio Channel Register
	move.l #$12215300,$303C02 ; Timer Register

    ; Zelda - Wand of Gamelon Intro Cutscene
	move.w #$0100,$303C06 ; File Register
	move.l #$0003,$303C08 ; Channel Register
	move.w #$0001,$303C0C ; Audio Channel Register
	move.l #$48303100,$303C02 ; Timer Register
	
	; Tetris 00 35 68 00356800 Philips Logo   Coding 01, 2 channels, 4 bits, 000093a8 frequency
	; Tetris 01 42 67 01426700 Main Menu      Coding 05, 2 channels, 4 bits, 000049d4 frequency
	; Tetris 55 50 33 55503300 Intro          Coding 05, 2 channels, 4 bits, 000049d4 frequency
	; Frog Feast      00354400 Main Menu      Coding 11, 2 channels, 8 bits, 00000000 frequency
	; Hotel Mario     00472600 Intro Music
	; Hotel Mario     00471800 Intro Actual request from the start

	move.w #$C000,$303FFE ; Start the Read by setting bit 15 of the data buffer

	move.b #$c5,$310004
	move.b #$00,$310004
	move.b #$00,$310004
	move.b #$00,$310004
	move.b #$00,$310004
	;move.b #$82,$310004 ; Mute

	jsr waitforirq

	move.w #$0800,$303FFA ; Start playback
	;move.b #$83,$310004 ; Unmute

	jsr waitforirq
	jsr waitforirq
	jsr waitforirq
	jsr waitforirq

	;move.w #$0000,$303FFA ; Stop playback

	;move.w #$0000,$303FFE ; Deactivate cd reading

endless:
	bra endless

wait:
	add.l #-1,d0
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

	move.w $303FFE,d0 ; read DBUF
	move.w $303FFA,d0 ; read AUDCTL

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
