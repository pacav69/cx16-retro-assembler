; Hello world example
; https://github.com/JimmyDansbo/cx16stuff/blob/master/helloworld.asm
; this will compile with retro assembler (RA)
; a BASIC header
*=$0801			; Assembled code should start at $0801
				; (where BASIC programs start)
				; The real program starts at $0810 = 2064
				; .byte RA directive
.byte $0C,$08		; $080C - pointer to next line of BASIC code
.byte $0A,$00		; 2-byte line number ($000A = 10)
.byte $9E			; SYS BASIC token
.byte $20			; [space]
.byte $32,$30,$36,$34	; $32="2",$30="0",$36="6",$34="4" = 2064
					; (ASCII encoded numbers for dec starting addr)
.byte $00			; End of Line
.byte $00,$00		; This is address $080C containing
					; 2-byte pointer to next line of BASIC code
					; ($0000 = end of program)
*=$0810				; Here starts the real program

CHROUT=$FFD2		; CHROUT outputs a character (C64 Kernal API)
CHRIN=$FFCF			; CHRIN read from default input

	ldx	#0			; X register is used to index the string
output
	lda	message,x	; Load character from string into A reg
	beq	end		; If the character was 0, jump to end label
	jsr	CHROUT		; Output character stored in A register
	inx				; Increment X register
	jmp	output		; Jump back to loop label to print next char

end
	jsr	CHRIN		; Read input until Enter/Return is pressed
	rts			; Return to caller

message
	.textz "HELLO, WORLD!! ...  PRESS" ; .textz RA directive a text ending with a zero byte
