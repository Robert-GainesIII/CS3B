@*****************************************************************************
@Name:      Robert Gaines
@Program:   Exam 2 Lab
@Class:     CS 3B
@Date:      October 31, 2019 at 11:59 PM
@Purpose:
@     		Pass the test 
@*****************************************************************************


	.data
strTitle1:        .asciz    "Name: Robert Gaines\nProgram: RASM3.s\nClass: CS3B\nDate: October 31, 2019\n\n"
strEnd:           .asciz    "Thanks for using my program!! Good Day!\n\n"

strMsg1:          .asciz    "Enter the first string : "
strMsg2:          .asciz    "Enter the second string: "
strMsg3:		  .asciz    "Swapping the two strings... \n"
strMsg4:		  .asciz    "Converting to uppercase... \n"
strResultMsg:     .asciz    "STRING #1: "
strResultMsg2:    .asciz    "STRING #2: "

strResult:		  .word 	0

strVal1:          .word     0
strVal2:          .word     0

cCR:              .byte     10
endl:			  .byte	    10

buffSize:		  .skip     512

	.text

	
		.global _start
		.extern malloc
		.extern free 

_start:

	LDR R1, =strTitle1
	BL putstring
	
	BL _input 

	LDR R1, =strResultMsg
	bl  putstring
	
	@DISPLAY STRING #1
	LDR R1, =strVal1
	LDR R1, [R1]
	BL putstring

	LDR R1,=cCR
	bl putch

	LDR R1, =strResultMsg2
	BL putstring
	
	@DISPLAY STRING #2
	LDR R1, =strVal2
	LDR R1, [R1]
	BL putstring
	
	LDR R1, =cCR
	BL putch

	LDR R1, =strMsg3
	bl putstring

	LDR R1, =strVal1
	LDR R2, =strVal2
	bl toUpper

	LDR R1, =strMsg4
	bl putstring

	@SWAP THE POINTERS
	ldr r1, =strVal1
	ldr r2, =strVal2
	ldr r3, [r2]
	ldr r4, [r1]
	str r3, [r1]
	str r4, [r2]

	LDR R1, =strResultMsg
	bl putstring

	LDR R1, =strVal1
	LDR R1, [R1]
	bl putstring

	LDR R1, =cCR
	bl putch 

	LDR R1, =strResultMsg2
	bl putstring

	LDR R1, =strVal2
	LDR R1, [R1]
	bl putstring

	LDR R1, =cCR
	bl putch

	LDR R1, =cCR
	bl putch
	
	b end

@INPUT CREATES TWO DYNAMICALLY ALLOCATED STRINGS
@USES BUFFER OF 512 BYTES 
@================================@	
_input:

	push {r4-r11, lr}
	
	
	
	LDR R1, =strMsg1
	BL putstring
	
	LDR R1, =buffSize
	MOV R2, #512
	BL getstring
	
	ldr r5, =buffSize
	
	BL String_length
	
	mov r8, r0
	add r0, #1

	bl malloc 
	
	mov r6, r0
	
loop:

	cmp r8, #0
	beq endloop1
	ldrb r7, [r5], #1
	strb r7, [r6], #1
	sub r8, #1
	b loop
		
	
endloop1:
	mov R1, #0
	str r1, [r6]
	LDR R1, =strVal1
	str r0, [r1]

	LDR R1, =strMsg2
	BL putstring
	
	LDR R1, =buffSize
	MOV R2, #512
	BL getstring

	mov r5, r1

	bl String_length
	
	mov r8, r0
	add r0, #1
	
	bl malloc 
	
	mov r6, r0
	
loop2:

	cmp r8, #0
	beq endloop2
	ldrb r7, [r5], #1
	strb r7, [r6], #1
	sub r8, #1
	b loop2
		
	
endloop2:
	
	MOV r1, #0
	str r1, [r6]
	LDR R1, =strVal2
	str r0, [r1]

	pop {r4-r11, lr} 
	
	BX LR
	
@===============================@
@===============================@
toUpper:
	push {lr}
	LDR r3, [r1]
	LDR r4, [r2]
	MOV r1, r3
	bl String_length
	mov r8, r0
	MOV r1, r4
	bl String_length
	mov r9, r0
firstLoop:
	cmp r8, #0
	beq secondLoop
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
secondLoop:
	cmp r9, #0
	beq endUpper
	ldrb r7, [r4]
	cmp r7, #97
	blt nextChar2
	cmp r7, #122
	bgt nextChar2
	sub r7, #32
	strb r7, [r4], #1
	sub r9, #1
	b secondLoop

nextChar2:
	add r4, #1
	sub r9, #1
	b secondLoop

endUpper:
	pop {lr}
	bx lr
@===============================@
end: 
	
	LDR R0, =strVal1
	LDR r0, [r0]
	BL free 
	LDR R0, =strVal2
	LDR r0, [r0]
	BL free

	LDR r1, =strEnd
	bl putstring

	mov r7, #1
	svc 0


