; 8253芯片端口地址 （Port Address):
L8253T0			EQU	100H			; Timer0
L8253T1			EQU 	102H			; Timer1
L8253T2			EQU 	104H			; Timer2
L8253CS			EQU 	106H			; 8253 Control Register

INIT8253 PROC
; Set the mode and the initial count for Timer0
        MOV DX, L8253CS
        MOV AL, 00110110B
        OUT DX, AL			; counter 0, mode 3, HEX
        MOV AX, 2710H			; 1MHz -/10^4-> 100Hz
        MOV DX, L8253T0			; counter 0
        OUT DX, AL
        MOV AL, AH			; then send high byte
        OUT DX, AL
; Set the mode and the initial count for Timer1
        MOV DX, L8253CS
        MOV AL, 01110110B
        OUT DX, AL			; counter 1, mode 3, HEX
        MOV AX, 64H			; 100Hz -/100-> 1Hz
        MOV DX, L8253T1			; counter 1
        OUT DX, AL
        MOV AL, AH			; then send high byte
        OUT DX, AL
; Set the mode and the initial count for Timer2
        MOV DX, L8253CS
        MOV AL, 10110000B
        OUT DX, AL			; counter 2, mode 0, HEX
        MOV AX, 0C350H			; 1MHz -/5*10^4-> 20Hz
        MOV DX, L8253T2			; counter 0
        OUT DX, AL
        MOV AL, AH			; then send high byte
        OUT DX, A       
        RET
INIT8253 ENDP