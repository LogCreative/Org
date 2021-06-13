A_PORT EQU 8020H
B_PORT EQU 8022H
C_PORT EQU 8024H
CTRL_PORT EQU 8026H

        .DATA
TAB1    DB 3FH	; 7-Segment Tube, 0 - F
        DB 06H	; 共阴极类型的7段数码管
        DB 5BH	;    a a a
        DB 4FH	; f         b
        DB 66H	; f         b
        DB 6DH	; f         b
        DB 7DH	;    g g g 
        DB 07H	; e         c
        DB 7FH	; e         c
        DB 6FH	; e         c
        DB 77H	;    d d d     h h h
        DB 7CH	; -----------------------
        DB 39H	; b7 b6 b5 b4 b3 b2 b1 b0
        DB 5EH	; DP  g  f  e  d  c  b  a
        DB 79H	;
        DB 71H	;

        .CODE
    ASSUME CS:CODE, DS:DATA
START:  MOV AX, DATA
        MOV DS, AX
        MOV AL, 90H
        MOV DX, CTRL_PORT
        OUT DX, AL
ADD1:   MOV DX, A_PORT
        IN  AL, DX
        AND AL, 0FH
        MOV BX, OFFSET TAB1
        XLAT    ; is in AL
        MOV DX, B_PORT
        OUT DX, AL

        MOV CX, 0600H   ;delay
ADD2:   LOOP ADD2
        JMP  ADD1
CODE    ENDS
        END START