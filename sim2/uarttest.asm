	section .text

    org $400000

vector:
	dc.l $1234
    dc.l main

main:
    move.l #uarttxirq,$F4
    move.l #uartrxirq,$F0
	move #$2000,SR  

    ; TX IPL is 5
    ; RX IPL is 4
    move.b #$45,$80002047 ; PICR2

    nop
    nop

    move.b #$05,$80002017 ; Should result into IRQ as the UART TX is empty

    nop
    nop

	move.b #'A',$80002019
	move.b #'B',$80002019

endless:
    bra endless

uarttxirq:
    ; Reset TX Pending flag
    move.b #$4D,$80002047 ; PICR2
    rte

uartrxirq:
    ; Reset RX Pending flag by reading the data
    move $8000201B,d0
    rte
    
