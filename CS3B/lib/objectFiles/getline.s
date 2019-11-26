/* Matthew Deol */	
	.data

.text

				.global getline
	.equ BUF, 1024
getline:
		@file open
		@r0 contains filehandle
		@r1 contains kbuf
	push {r4-r11, lr}
	bl getch
	cmp r0, #0
	beq finish
	ldrb r3, [r1]
	cmp r3, #13
	beq	nextLine
	cmp r3, #10
	beq nextLine
	bl getline
	

nextLine:
	mov r1, #1
	pop {r4-r11, lr}
	bx lr

finish:	
	pop {r4-r11, lr}
	bx lr
	.end
