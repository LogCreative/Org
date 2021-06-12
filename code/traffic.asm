		.MODEL	SMALL			; 设定8086汇编程序使用SmBLl model
		.8086				; 设定采用8086汇编指令集
PortIn	EQU	80h	;定义输入端口号
PortOut	EQU	88h	;定义输出端口号
		.stack 100h				; 定义256字节容量的堆栈
		.data					; 定义数据段
state	DB	0H					; 状态变量
second	DB	0H					; 秒数   
		.code						; Code segment definition
MAIN PROC FAR
	 MOV AX,@data
	 MOV DS,AX
	 MOV BL,state                ; state 0
        MOV CL,second
        MOV AL,36H                 ; corres. state
Again:
        OUT PortOut,AL
        ADD CL,1H                   ; + 1s
        CMP CL,10h
        JAE Change                  ; change the state
        JMP Again
Change: 
        MOV CL,0H                   ; second = 0
        ADD BL,1H                   ; +1 state
        CMP BL,5H
        JAE reset                   ; >=5 reset
        JMP Action
reset:
        MOV BL,1H                   ; => state 1
Action:
        CMP BL,1H
        JBE state1                  ; state <= 1
        CMP BL,2H
        JBE state2                  ; state <= 2
        CMP BL,3H
        JBE state3                  ; state <= 3
        JMP state4                  ; state = 4
state1:
        MOV AL,33H             ; green red 110011
        JMP Again
state2o:
        MOV AL,33H             ; green red
        OUT PortOut,AL
        ADD CL,1H                   ; +1s
	JMP state2
state2:
        MOV AL,37H             ; off red 110111
        OUT PortOut,AL
        ADD CL,1H                   ; +1s (come as 0s)
        CMP CL,7H                   ; 7s is over
        JAE state2y                 ; change to yellow
        JMP state2o                 ; ALink
state2y:
        MOV AL,35H             ; yellow red 110101
        JMP Again                   ; finish the remaining 3s
state3:
        MOV AL,1EH             ; red green 011110
        JMP Again
state4o:
        MOV AL,1EH             ; red green
        OUT PortOut,AL
        ADD CL,1H
	JMP state4
state4:
        MOV AL,3EH             ; red off
        OUT PortOut,AL
        ADD CL,1H
        CMP CL,7H
        JAE state4y
        JMP state4o
state4y:
        MOV AL,2EH
        JMP Again
MAIN 	ENDP
	END MAIN
