
	
	.global _start

	_start:
	MOV r0, #0x11 
	LSL r1, r0, #1 
	ADD r2, r1, r1, LSL #2

	svc 0

	.end