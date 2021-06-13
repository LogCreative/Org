        .MODEL	SMALL
		.8086
        .data
        .code
        .startup
        MOV AX,8000H            ;指定DS开始地址
        MOV DS,AX
        MOV BX,0H

        MOV AL,0H
L:     
        MOV BYTE PTR [BX],AL    ;将AL中的数据以字节为单位送到DS:BX所指字节单元
        INC AL
        INC BX
        JNZ L
WT: 
        JMP WT
        .stack 100h				; 定义256字节容量的堆栈
        END	