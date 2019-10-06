
	.global _start

_start:
	mov r0, #8
	mov r1, #255
	mov r2, #5000
	mov r3, #-16
	mov r4, r3
	mov r5, r2
	svc 0

	.end