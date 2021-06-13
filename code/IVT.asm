        MOV  BL, IRQNum		; BL is used as a parameter to call the procedure INT_INIT
        CALL INT_INIT		; Procedure INT_INIT is used to set up the IVT
        MOV CH,0H			; Initial counter for number displaying: 0001

INT_INIT	PROC FAR	
        CLI				; Disable interrupt
        MOV AX, 0
        MOV ES, AX			; To set up the interrupt vector table
; Put your code here
; Hint: you can use the directives such as SEGMENT,OFFSET to get the segment value and the offset of a label
        MOV BH, 0H
        MOV CL, 2H
        SHL BX, CL			; X4
        MOV SI, BX
        MOV AX, OFFSET MYIRQ
        MOV ES:[SI],AX
        MOV AX, SEG MYIRQ
        MOV ES:[SI+2], AX
        STI
        RET				; Do not to forget to return back from a procedure		
INT_INIT	ENDP