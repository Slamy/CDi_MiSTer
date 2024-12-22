	section .text

    org $400000

vector:
	dc.l $1234
    dc.l main

main:
	; Make a pause at the start to relax the UART on the linux side
	move #4000,d0
	jsr wait

	move.l #cdicirq,$200
	move #$2000,SR  

	move.w #$2480,$303FFC ; IRQ vector

	move.w #$0023,$303C00 ; Command Register = Reset Mode 1
	move.w #$8000,$303FFE ; Data buffer

	move.w #$2480,$303FFC ; Interrupt Vector
	move.w #$002c,$303C00 ; Read Mode 1
	move.l #$21080000,$303C02 ; Time Register
	move.w #$8000,$303FFE ; Start the Read

	jsr waitforirq

	move.w #$0000,$303FFE ; Data buffer = 0, disable reading

	; Send CDIC DATA1 buffer
	move.l #$300a00,a0
	move.l #$0a00,d1
loop:

wait_till_ready:
	move.b $80002013,d0
	btst.l #$2,d0
	beq wait_till_ready

	move.b (a0),d0
	move.b d0,$80002019
	adda.l #1,a0
	add.l #-1,d1
	bne loop

endless:
	bra endless

wait:
	add #-1,d0
	bne wait
	rts


waitforirq:
	move #0,d0
waitforirqloop:
	cmp #0,d0
	beq waitforirqloop
	rts

cdicirq:
	move.w $303FF4,d0 ; clear flags on ABUFD
	move.w $303FF6,d0 ; clear flags on XBUF
	;move.b #$92,$80004005

	move #1,d0
	rte
