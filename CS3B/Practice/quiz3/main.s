
	.global _start

_start:
	MOV r0, #0x11  
	LSL r1, r0, #1 
	ADD r2, r1, r1, LSL #2
	MOV r7, #1
	SVC 0 
	.end