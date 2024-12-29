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

	move.l #$00020000,$303C02 ; Timer Register

	; Apprentice Level 1
	;move.l #$19468000,$303C02 ; Timer Register

	move.w #$C000,$303FFE ; Start the Read by setting bit 15 of the data buffer

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

	; Highest bit is set
	move #1,d0
	rte
noint:
	move #0,d0
	rte
