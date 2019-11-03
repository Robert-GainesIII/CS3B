@*****************************************************************************
@AUTHOR:		Robert Gaines
@PROGRAM:   	+String_toUpper(string)     
@[R1]:			points to address of string being converted
@
@RETURNS: 		R1 contains converted toupper string
@
@*****************************************************************************
	.global String_toUpperCase
@===============================@
String_toUpperCase:
	push {r1, lr}
	LDR R1, [R1]
	mov r3, r1
	bl String_length
	mov r8, r0
	
firstLoop:
	cmp r8, #0
	beq endUpper
	ldrb r7, [r3]
	cmp r7, #97
	blt nextChar
	cmp r7, #122
	bgt nextChar
	sub r7, #32
	strb r7, [r3],#1
	sub r8, #1
	b firstLoop
nextChar:
	add r3, #1
	sub r8, #1
	b firstLoop


endUpper:
	pop {lr}
	bx lr
@===============================@