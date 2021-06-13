        LEA DI, Buf1 ;[S]sender

        MOV DX, 209H
        MOV AL, 00H ; worst-case init
        OUT DX, AL
        CALL DELAY
        MOV AL, 00H
        OUT DX, AL
        CALL DELAY
        MOV AL, 00H
        OUT DX, AL
        CALL DELAY
        MOV AL, 40H ; reset command
        OUT DX, AL
        MOV AL, 01001110B ; mode word
        OUT DX, AL
        MOV AL, 00110111B ; command word
        OUT DX, AL
        MOV CX, 256 ; to send 256 char

; [S] sender
NEXT:   MOV DX, 209H
        IN AL, DX   ; status word
        AND AL, 01H ; TxRDY?
        JZ NEXT
        MOV AL, [DI]
        MOV DX, 208H  ; data register 208H
        OUT DX, AL  ; send the char
        INC DI
        LOOP NEXT

; [R] receiver
        MOV SI, 0
NEXT:   MOV DX, 209H
        IN AL, DX
        AND AL, 02H ; RxRDY?
        JZ NEXT
        MOV DX, 208H
        IN AL, DX   ; receive a char
        MOV buf2[SI], AL
        INC SI
        LOOP NEXT