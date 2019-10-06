	.global _start
	_start:

	LDR r1, =msgbracketL
	MOV r2, #1
	BL v_asc
	LDR r1, =msgtxt
	MOV r2, #5
	BL v_asc
	LDR r1, =msgbracketR
	MOV r2, #1
	BL v_asc
	MOV r0, #0
	MOV r7, #1
	svc 0

	.data
	msgtxt:	.ascii "Hello"
	msgbracketL: .ascii "["
	msgbracketR: .ascii "]"
	
	.text

	@Enter text here

	v_byte: 
	MOV r0, #1
	MOV r7, #4
	svc 0
	BX LR

	v_asc: 
	MOV r0, #1
	MOV r7, #4
	svc 0
	BX LR

	.end