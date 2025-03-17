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
	move.w #$0028,$303C00 ; Play CDDA
	;move.w #$0027,$303C00 ; Fetch TOC

	; Apprentice - Level 1
	move.l #$19468000,$303C02 ; Timer Register

	; Apprentice - Title Screen
	move.l #$15220000,$303C02 ; Timer Register

	move.w #$C000,$303FFE ; Start the Read by setting bit 15 of the data buffer

	jsr waitforirq

	move.w #$0800,$303FFA ; Start playback

	jsr waitforirq
	jsr waitforirq
	jsr waitforirq
	jsr waitforirq

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
	move.w $303FF4,d0 ; clear flags on ABUFD
	; ignore ABUF
	move.w $303FF6,d0 ; clear flags on XBUF

	btst.l #$f,d0
	beq noint

	move.w $303FFe,d0
	btst.l #$0,d0 ; check lowest bit of data buffer
	beq lower_buf
higher_buf:
	move.w $301324,d0
	move.w $301326,d0
	move.w $301328,d0
	move.w $30132a,d0
	move.w $30132c,d0
	move.w $30132e,d0

	move.w $301330,d0
	move.w $301332,d0
	move.w $301334,d0
	move.w $301336,d0
	move.w $301338,d0
	move.w $30133a,d0

	bra read_data
lower_buf:
	move.w $300924,d0
	move.w $300926,d0
	move.w $300928,d0
	move.w $30092a,d0
	move.w $30092c,d0
	move.w $30092e,d0
	
	move.w $300930,d0
	move.w $300932,d0
	move.w $300934,d0
	move.w $300936,d0
	move.w $300938,d0
	move.w $30093a,d0

read_data:

	; Highest bit is set
	move #1,d0
	rte
noint:
	move #0,d0
	rte
