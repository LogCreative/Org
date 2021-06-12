.MODEL SMALL
.STACK 64
        .DATA
DATA1   DB 'mY NAME is jOe'
        ORG 0020H
DATA2   DB  14 DUP(?)
        .CODE
MAIN    PROC FAR
        MOV AX, @DATA
        MOV DS, AX
        MOV SI, OFFSET DATA1
        MOV BX, OFFSET DATA2
        MOV CX, 14
BACK:   MOV AL, [SI]    ; get next ch
        CMP AL, 61H     ; less than 'a'
        JB  OVER
        CMP AL, 7AH     ; greater than 'z'
        JA  OVER
        AND AL, 11011111B  ; convert
OVER:   MOV [BX],AL
        INC SI
        INC BX
        LOOP BACK
        MOV AH, 4CH
        INT 21H
MAIN    ENDP
        END MAIN