   .MODEL SMALL
   .DATA
   .STACK 64
   .CODE
PortIn	EQU	90h	;定义输入端口号
PortOut	EQU	0A0h	;定义输出端口号
main proc far
Again:IN  AL,PortIn		;读取开关量状态
      NOT AL				;取反
      OUT PortOut,AL		;送显示
      JMP Again			;跳转循环执行
main endp
END	main				;指示汇编程序结束编译