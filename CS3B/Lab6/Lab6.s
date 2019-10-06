	.global _start
	_start:

	LDR r1, =msgtxt
	MOV r2, #1
	BL v_asc
	MOV r0, #0
	MOV r7, #1
	LDR r0, =msgtxt
	svc 0

	.data
	msgtxt:	.ascii "A"
	
	.text

	@Enter text here

	v_asc: 
	MOV r0, #1
	MOV r7, #4
	svc 0
	BX LR

	.end