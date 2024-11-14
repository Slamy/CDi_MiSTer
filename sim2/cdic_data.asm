	section .text

    org $400000

vector:
	dc.l $1234
    dc.l main

main:
	move.l #cdicirq,$200
	move #$2000,SR  

	move.w #$2480,$303FFC ; IRQ vector

	move.w #$0023,$303C00 ; Command Register = Reset Mode 1
	move.w #$8000,$303FFE ; Data buffer

	move.w #$2480,$303FFC ; Interrupt Vector
	move.w #$0029,$303C00 ; Read Mode 1
	move.l #$0021600,$303C02 ; Time Register
	move.w #$8000,$303FFE ; Start the Read

	move.l #$2000,A3
	move.b #'O',$80002019

	jsr waitforirq

	move.b #'A',$80002019
	move.w $303FF6,d0
	move.w $303FF6,d0
	move.w $303FFE,d0

	; Check CDIC ram like the driver does
	move.w $300002,d0
	move.w $30000a,d0
	move.w $300a02,d0
	move.w $300a0a,d0

	move.b d0,$80004000 ; reset status
	move.l A3,$8000400c
	move.w #$498,$8000400a
	;move.w #$4,$8000400a

	move.b #$92,$80004005
	move.b #$80,$80004007 ; start DMA
	move.w #$8a00,$303FF8 ; DMA Control Register = Start Transmission at a00

	adda.l #$930,a3
	move.b #'B',$80002019


	move.w #$0000,$303FFE ; Data buffer = 0, disable reading


	move.w #800,d0
	jsr wait

	move.w #$0029,$303C00 ; Read Mode 1
	move.l #$0021600,$303C02 ; Time Register
	move.w #$8000,$303FFE ; Start the Read



	jsr waitforirq

	move.b #'A',$80002019
	move.w $303FF6,d0
	move.w $303FF6,d0
	move.w $303FFE,d0

	; Check CDIC ram like the driver does
	move.w $300002,d0
	move.w $30000a,d0
	move.w $300a02,d0
	move.w $300a0a,d0

	move.b d0,$80004000 ; reset status
	move.l A3,$8000400c
	move.w #$498,$8000400a
	;move.w #$4,$8000400a

	move.b #$92,$80004005
	move.b #$80,$80004007 ; start DMA
	move.w #$8a00,$303FF8 ; DMA Control Register = Start Transmission at a00

	adda.l #$930,a3
	move.b #'B',$80002019

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
	move.b #'O',$80002019
	rts

cdicirq:
	move.b #'I',$80002019
	move.w $303FF4,d0 ; clear flags on ABUFD
	move.w $303FF6,d0 ; clear flags on XBUF
	;move.b #$92,$80004005

	move #1,d0
	rte
