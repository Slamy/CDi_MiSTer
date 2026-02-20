	section .text

    org $400000

vector:
	dc.l $1234
	dc.l main

main:
	move.w #$0000,$303FFE ; Data buffer

	move.w #$2000,$E040C0 ; FMV SYSCMD - Decoder off
	nop
	move.w #$0100,$E040C0 ; FMV SYSCMD - Clear FIFO
	nop
	move.w #$1000,$E040C0 ; FMV SYSCMD - Decoder on

	move.w #$02D4,$E040DC ; FMV IVEC
	move.w #$F7CF,$E04060 ; FMV IER
	move.l #fmvirq,$168

	move.w #$807B,$E0300C ; FMA IVEC
	move.w #$013C,$E0301C ; FMA IER
	move.l #fmairq,$1EC

	move #$2000,SR

	move.b d0,$80004040 ; reset status
	move.l #mpeg_bin,$8000400c ; Memory Address Counter
	move.w #2324/2,$8000404a  ; Memory Transfer Counter
	move.b #$04,$80004046 ; SCR, MAC Count Up, DAC No Change (like the CDIC on CH1)
	move.b #$12,$80004045 ; Dev. to Mem., 16 Bit Words,
	move.b #$30,$80004044 ; ACK/RDY device (like the CDIC on CH1)
	move.b #$80,$80004047 ; start DMA

	move.l #0,$0E0407C ;FMV_DECOFF
	move.l #$01180180,$0E04078 ;FMV_DECWIN 384 x 280
	move.l #0,$0E04074 ;FMV_DECOFF
	move.w #$8,$0E040C2; Request Update

	move.w #$8000,$00E040C0 ; Syscmd = Start DMA

	; Usually one would use the DTS and SCR to start playback
	; But I feel lazy and use the number of pics instead
waitforpics:
	cmp.w #2,$00E040A4 ; Compare 1 against pictures in FIFO
	bmi waitforpics

	move.b #'B',$80002019

	move.w #$0008,$E040C0 ; FMV SYSCMD - Play
	move.w #$0420,$E040C2 ; FMV VIDCMD - Show on next frame

endless:
	bra endless


fmvirq:
	move.b #'V',$80002019
	move $00E04062,d7
	rte

fmairq:
	move.b #'A',$80002019
	move $00E0301A,d7
	rte

mpeg_bin:
    dc.b $00, $00, $01, $ba, $21, $00, $01, $00, $01, $80, $17, $c9
    dc.b $00, $00, $01, $bb, $00, $09, $80, $17, $c9, $00, $21, $ff
    dc.b $e0, $e0, $2e, $00, $00, $01, $e0, $04, $73, $31, $00, $03
    dc.b $51, $81, $11, $00, $03, $35, $61, $00, $00, $01, $b3, $01
    dc.b $00, $80, $13, $02, $ce, $e0, $a0, $00, $00, $01, $b8, $00
    dc.b $08, $00, $40, $00, $00, $01, $00, $00, $0f, $ff, $f8, $00
    dc.b $00, $01, $01, $13, $fb, $5d, $29, $48, $88, $00, $00, $01
    dc.b $02, $13, $f8, $7d, $29, $48, $88, $00, $00, $01, $03, $13
    dc.b $f8, $7d, $29, $48, $88, $00, $00, $01, $04, $13, $f8, $7d
    dc.b $29, $48, $88, $00, $00, $01, $05, $13, $f8, $7d, $29, $48
    dc.b $88, $00, $00, $01, $06, $13, $f8, $7d, $29, $48, $88, $00
    dc.b $00, $01, $07, $13, $f8, $7d, $29, $48, $88, $00, $00, $01
    dc.b $08, $13, $f8, $7d, $29, $48, $88, $00, $00, $01, $00, $00
    dc.b $57, $ff, $f9, $80, $00, $00, $01, $01, $12, $60, $b6, $00
    dc.b $00, $01, $02, $12, $3e, $08, $20, $c0, $24, $82, $01, $e0
    dc.b $22, $89, $80, $10, $82, $48, $58, $03, $a0, $4d, $eb, $a0
    dc.b $20, $c0, $24, $82, $01, $e0, $22, $89, $80, $10, $82, $48
    dc.b $58, $03, $a0, $4d, $eb, $bf, $44, $d2, $22, $00, $00, $01
    dc.b $03, $12, $c8, $10, $00, $3f, $c1, $04, $02, $b4, $10, $2f
    dc.b $c1, $17, $a0, $10, $0c, $c1, $27, $c0, $01, $48, $26, $90
    dc.b $c0, $80, $01, $fe, $08, $20, $15, $a0, $81, $7e, $08, $bd
    dc.b $00, $80, $66, $09, $3e, $00, $0a, $41, $34, $86, $00, $00
    dc.b $01, $04, $12, $70, $00, $00, $01, $05, $12, $70, $00, $00
    dc.b $01, $06, $12, $70, $00, $00, $01, $07, $12, $70, $00, $00
    dc.b $01, $08, $12, $70, $00, $00, $01, $00, $00, $97, $ff, $f8
    dc.b $80, $00, $00, $01, $01, $12, $70, $00, $00, $01, $02, $12
    dc.b $3f, $87, $d2, $94, $88, $80, $00, $00, $01, $03, $12, $3f
    dc.b $87, $d2, $94, $88, $80, $00, $00, $01, $04, $12, $3f, $68
    dc.b $08, $30, $0e, $80, $81, $56, $08, $bb, $80, $94, $28, $00
    dc.b $a8, $13, $44, $28, $08, $30, $0e, $80, $81, $56, $08, $bb
    dc.b $80, $94, $28, $00, $a8, $13, $44, $2f, $6f, $48, $88, $00
    dc.b $00, $01, $05, $12, $c8, $10, $1b, $41, $04, $02, $30, $10
    dc.b $19, $41, $14, $c4, $12, $b8, $01, $03, $5c, $13, $79, $60
    dc.b $40, $6d, $04, $10, $08, $c0, $40, $65, $04, $53, $10, $4a
    dc.b $e0, $04, $0d, $70, $4d, $e5, $80, $00, $00, $01, $06, $12
    dc.b $70, $00, $00, $01, $07, $12, $70, $00, $00, $01, $08, $12
    dc.b $70, $00, $00, $01, $00, $00, $d7, $ff, $f9, $00, $00, $00
    dc.b $01, $01, $12, $70, $00, $00, $01, $02, $12, $70, $00, $00
    dc.b $01, $03, $12, $70, $00, $00, $01, $04, $12, $60, $6e, $00
    dc.b $00, $01, $05, $12, $62, $80, $00, $00, $01, $06, $12, $3f
    dc.b $68, $08, $30, $0e, $80, $81, $56, $08, $bb, $80, $94, $28
    dc.b $00, $a8, $13, $44, $28, $08, $30, $0e, $80, $81, $56, $08
    dc.b $bb, $80, $94, $28, $00, $a8, $13, $44, $2f, $6f, $48, $88
    dc.b $00, $00, $01, $07, $12, $c8, $10, $1b, $41, $04, $02, $30
    dc.b $10, $19, $41, $14, $c4, $12, $b8, $01, $03, $5c, $13, $79
    dc.b $60, $40, $6d, $04, $10, $08, $c0, $40, $65, $04, $53, $10
    dc.b $4a, $e0, $04, $0d, $70, $4d, $e5, $80, $00, $00, $01, $08
    dc.b $12, $70, $00, $00, $01, $00, $01, $17, $ff, $f9, $00, $00
    dc.b $00, $01, $01, $12, $70, $00, $00, $01, $02, $12, $70, $00
    dc.b $00, $01, $03, $12, $70, $00, $00, $01, $04, $12, $70, $00
    dc.b $00, $01, $05, $12, $70, $00, $00, $01, $06, $12, $60, $6e
    dc.b $00, $00, $01, $07, $12, $62, $80, $00, $00, $01, $08, $12
    dc.b $3f, $b5, $d2, $94, $88, $80, $00, $00, $01, $00, $01, $57
    dc.b $ff, $f9, $00, $00, $00, $01, $01, $12, $3f, $b5, $d2, $94
    dc.b $88, $80, $00, $00, $01, $02, $12, $70, $00, $00, $01, $03
    dc.b $12, $70, $00, $00, $01, $04, $12, $70, $00, $00, $01, $05
    dc.b $12, $70, $00, $00, $01, $06, $12, $70, $00, $00, $01, $07
    dc.b $12, $70, $00, $00, $01, $08, $12, $60, $66, $00, $00, $01
    dc.b $00, $01, $97, $ff, $f9, $80, $00, $00, $01, $01, $12, $60
    dc.b $b6, $00, $00, $01, $02, $12, $3e, $08, $20, $c0, $24, $82
    dc.b $01, $e0, $22, $89, $80, $10, $82, $48, $58, $03, $a0, $4d
    dc.b $eb, $a0, $20, $c0, $24, $82, $01, $e0, $22, $89, $80, $10
    dc.b $82, $48, $58, $03, $a0, $4d, $eb, $bf, $44, $d2, $22, $00
    dc.b $00, $01, $03, $12, $c8, $10, $00, $3f, $c1, $04, $02, $b4
    dc.b $10, $2f, $c1, $17, $a0, $10, $0c, $c1, $27, $c0, $01, $48
    dc.b $26, $90, $c0, $80, $01, $fe, $08, $20, $15, $a0, $81, $7e
    dc.b $08, $bd, $00, $80, $66, $09, $3e, $00, $0a, $41, $34, $86
    dc.b $00, $00, $01, $04, $12, $70, $00, $00, $01, $05, $12, $70
    dc.b $00, $00, $01, $06, $12, $70, $00, $00, $01, $07, $12, $70
    dc.b $00, $00, $01, $08, $12, $70, $00, $00, $01, $00, $01, $d7
    dc.b $ff, $f8, $80, $00, $00, $01, $01, $12, $70, $00, $00, $01
    dc.b $02, $12, $3f, $87, $d2, $94, $88, $80, $00, $00, $01, $03
    dc.b $12, $3f, $87, $d2, $94, $88, $80, $00, $00, $01, $04, $12
    dc.b $3f, $68, $08, $30, $0e, $80, $81, $56, $08, $bb, $80, $94
    dc.b $28, $00, $a8, $13, $44, $28, $08, $30, $0e, $80, $81, $56
    dc.b $08, $bb, $80, $94, $28, $00, $a8, $13, $44, $2f, $6f, $48
    dc.b $88, $00, $00, $01, $05, $12, $c8, $10, $1b, $41, $04, $02
    dc.b $30, $10, $19, $41, $14, $c4, $12, $b8, $01, $03, $5c, $13
    dc.b $79, $60, $40, $6d, $04, $10, $08, $c0, $40, $65, $04, $53
    dc.b $10, $4a, $e0, $04, $0d, $70, $4d, $e5, $80, $00, $00, $01
    dc.b $06, $12, $70, $00, $00, $01, $07, $12, $70, $00, $00, $01
    dc.b $08, $12, $70, $00, $00, $01, $00, $02, $17, $ff, $f9, $00
    dc.b $00, $00, $01, $01, $12, $70, $00, $00, $01, $02, $12, $70
    dc.b $00, $00, $01, $03, $12, $70, $00, $00, $01, $04, $12, $60
    dc.b $6e, $00, $00, $01, $05, $12, $62, $80, $00, $00, $01, $06
    dc.b $12, $3f, $68, $08, $30, $0e, $80, $81, $56, $08, $bb, $80
    dc.b $94, $28, $00, $a8, $13, $44, $28, $08, $30, $0e, $80, $81
    dc.b $56, $08, $bb, $80, $94, $28, $00, $a8, $13, $44, $2f, $6f
    dc.b $48, $88, $00, $00, $01, $07, $12, $c8, $10, $1b, $41, $04
    dc.b $02, $30, $10, $19, $41, $14, $c4, $12, $b8, $01, $03, $5c
    dc.b $13, $79, $60, $40, $6d, $04, $10, $08, $c0, $40, $65, $04
    dc.b $53, $10, $4a, $e0, $04, $0d, $70, $4d, $e5, $80, $00, $00
    dc.b $01, $08, $12, $70, $00, $00, $01, $00, $02, $57, $ff, $f9
    dc.b $00, $00, $00, $01, $01, $12, $70, $00, $00, $01, $02, $12
    dc.b $70, $00, $00, $01, $03, $12, $70, $00, $00, $01, $04, $12
    dc.b $70, $00, $00, $01, $05, $12, $70, $00, $00, $01, $06, $12
    dc.b $60, $6e, $00, $00, $01, $07, $12, $62, $80, $00, $00, $01
    dc.b $08, $12, $3f, $b5, $d2, $94, $88, $80, $00, $00, $01, $be
    dc.b $04, $7a, $0f, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff