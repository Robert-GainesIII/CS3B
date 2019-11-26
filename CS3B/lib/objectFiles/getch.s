/* Matthew Deol */	
	.data

.text

				.global getch
	.equ BUF, 1024
getch:
	push {r4-r11, lr}
	mov r0, r4			@filehandle
	mov r7, #3			@to read
	mov r2, #1			@read 1 byte
	add r1, #1
	svc 0
	
	

	pop {r4-r11,lr}
	bx lr
	.end
