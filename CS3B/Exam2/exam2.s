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
	
	LDR R1, =strVal1 @LOAD ARGUEMENT 
	LDR R2, =strVal2 @LOAD ARGUEMENT
	
	
	LDR R1, =strResultMsg
	BL putstring
	
	@DISPLAY STRING #1
	LDR R1, =strVal1
	BL putstring

	LDR R1, =strResultMsg2
	BL putstring
	
	@DISPLAY STRING #2
	LDR R1, =strVal2
	BL putstring
	
	LDR R1, =cCR
	BL putstring
	
	

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
	
	mov r5, r1
	
	BL String_length
	
	mov r8, r0
	
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

	LDR R1, =strVal1
	str r6, [r1]

	LDR R1, =strMsg2
	BL putstring
	
	LDR R1, =buffSize
	MOV R2, #512
	BL getstring
	
	mov r5, r1
	
	bl String_length
	
	mov r8, r0
	
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
	
	LDR R1, =strVal2
	str r6, [r1]

	pop {r4-r11, lr} 
	
	BX LR
	
@===============================@




