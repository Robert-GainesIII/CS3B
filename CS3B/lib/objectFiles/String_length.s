@ Subroutine String_Length accepts the address of a string and counts the characters in the @string, excluding the NULL character and returns that value as an int (word) in the R0 register. @will read a string of characters terminated by a null
@ R1: Points to first byte of string to count
@ LR: Contains the return address

@ Returned register contents:
@ R0: Number of characters in the string (does not include null).
@ All registers are preserved as per AAPCS

.text

.global String_length

String_length:
	push {r1-r11, lr}

	mov r0, #0

nextChar: 
	ldrb r2, [r1], #1
	subs r2,#0
	beq returnChar 

	add r0, #1
	B nextChar

returnChar: 
	pop {r1-r11, lr}
	bx lr
