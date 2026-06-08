	section .text

    org $400000

vector:
	dc.l $1234
	dc.l main

main:
	move.l #bus_error,$8
	move.l #address_error,$c
	move.l #illegal_instruction,$10
	move.l #zero_divide,$14
	
	move.w $1235,d0
	move.w d0,$1235
	move.l $1235,d0
	move.l d0,$1235

endless:
	bra endless

illegal_instruction:
	bra illegal_instruction

zero_divide:
	bra zero_divide

bus_error:
	bra bus_error

address_error:
	bra address_error







