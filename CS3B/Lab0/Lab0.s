
	.global _start

_start:
	MOV R6, #10
	Mov R7, #1
loop:
	CMP R6, #0
	MULGT R7, R6, R7
	SUBGT R6, R6, #1
	BGT loop
stop:
	B stop

	mov R7, #1
	svc 0

	.end