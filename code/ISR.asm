MYIRQ 	PROC FAR
    STI
    MOV DX, L8255PC
    IN  AL, DX
    MOV BL, AL
    NOT BL
    AND BL, 80H
    OR  AL, BL					; 0 -1-> 1
    AND AL, BL					; 1 -0-> 0
    OUT DX, AL

    MOV BX, 0C350H
    MOV AL, BL
    MOV DX, L8253T2			; counter 2 new count
    OUT DX, AL
    MOV AL, BH			; then send high byte
    OUT DX, AL

    ADD CH, 1H
    CMP CH, 4H
    JAE reset
    IRET
reset:
    MOV CH, 0H
    IRET				; Do not forget to return back from a ISR
MYIRQ 	ENDP