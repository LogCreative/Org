; 8255芯片端口地址 （Port Address):
L8255PA     EQU 121H			; Port A
L8255PB     EQU 123H			; Port B
L8255PC     EQU 125H			; Port C
L8255CS     EQU 127H			; 8255 Control Register

INIT8255 PROC
        ; Init 8255 in Mode 0,	L8255PA OUTPUT, L8255PB OUTPUT, L8255PCU OUTPUT, L8255PCL INPUT
        MOV AL, 10000001B			
        MOV DX, L8255CS		    ; should be assigned to DX first
        OUT DX, AL
        RET
INIT8255 ENDP