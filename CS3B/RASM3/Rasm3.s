@*****************************************************************************
@Name:      Robert Gaines
@Program:   Rasm3
@Class:     CS 3B
@Date:      October 31, 2019 at 11:59 PM
@Purpose:
@     		String function library 
@*****************************************************************************


	.data
strTitle1:        .asciz    "Name: Robert Gaines\nProgram: RASM3.s\nClass: CS3B\nDate: October 31, 2019\n\n"
strEnd:           .asciz    "Thanks for using my program!! Good Day!\n\n"

strMsg0:          .asciz    "Enter the first string : "
strMsg1:          .asciz    "Enter the second string: "
strMsg2:          .asciz    "Enter the third string: "
strMsg3:		  .asciz    "s1.length() = "
strMsg4:		  .asciz    "s2.length() = "
strMsg5:		  .asciz    "s3.length() = "
strMsg6:		  .asciz    "String_equals(s1,s3) = "
strMsg7:		  .asciz    "String_equals(s1,s1) = "
strMsg8:		  .asciz    "String_equalsIgnoreCase(s1,s3) = "
strMsg9:		  .asciz    "String_equalsIgnoreCase(s1,s2) = "
strMsg10:		  .asciz    "String_substring_1(s3,4,13) = "
strMsg11:		  .asciz    "String_substring_2(s3,7) = "
strMsg12:		  .asciz    "String_charAt(s2,4) = "
strMsg13:		  .asciz    "String_startsWith_1(s1,11,'hat.') = "
strMsg14:		  .asciz    "String_startsWith_2(s1,'Cat') = "
strMsg15:		  .asciz    "String_endsWith(s1,'in the hat.') = "
strMsg16:		  .asciz    "String_indexOf_1(s2,'g') = "
strMsg17:		  .asciz    "String_indexOf_2(s2,'g',9) = "
strMsg18:		  .asciz    "String_indexOf_3(s2,'eggs') = "
strMsg19:		  .asciz    "String_lastIndexOf_1(s2,'g') = "
strMsg20:		  .asciz    "String_lastIndexOf_2(s2,'g',6) = "
strMsg21:		  .asciz    "String_lastIndexOf_3(s2,'egg') = "
strMsg22:		  .asciz    "String_replace(s1,'a','o') = "
strMsg23:		  .asciz    "String_toLowerCase(s1) = "
strMsg24:		  .asciz    "String_toUpperCase(s1) = "
newline:		  .asciz    "\n"
strVar: 		  .asciz	"eggs"
strVar2:          .asciz    "egg"

/*
6. s4 = String_copy(s1)
   s1 = Cat in the hat.
   s4 = Cat in the hat.

22. String_concat(s1, " "); (Links to an external site.)
    String_concat(s1, s2)  (Links to an external site.)= "COT IN THE HOT. Green eggs and ham."
*/

strResult:		  .word 	0

strVal1:          .word     0
strVal2:          .word     0
strVal3:		  .word		0
strVal4: 		  .word		0
strTemp:	      .word     0

cCR:              .byte     10
endl:			  .byte	    10

buffSize:		  .skip     512
temp:			  .skip     12

	.text

	
		.global _start
		.extern malloc
		.extern free 

_start:


	LDR R1, =strTitle1
	BL putstring
	
	BL _input 
	
	//==================================
	LDR R1, =strMsg3
	BL putstring
	
	LDR R1, =strVal1
	LDR R1, [R1]
	bl String_length
	LDR R1, =temp
	bl intasc32
	bl putstring
	
	LDR R1, =newline
	bl putstring
	//==================================
	LDR R1, =strMsg4
	BL putstring
	
	LDR R1, =strVal2
	LDR R1, [R1]
	bl String_length
	LDR R1, =temp
	bl intasc32
	bl putstring

	LDR R1, =newline
	bl putstring
	//==================================
	LDR R1, =strMsg5
	BL putstring
	
	LDR R1, =strVal3
	LDR R1, [R1]
	bl String_length
	LDR R1, =temp
	bl intasc32
	bl putstring
	
	LDR R1, =newline
	bl putstring
	//==================================
	/*
	LDR R1, =strMsg6
	BL putstring
	
	LDR R1, =strMsg7
	BL putstring
	
	LDR R1, =strMsg8
	BL putstring
	
	LDR R1, =strMsg9
	BL putstring
	*/
	//===================================
	LDR R1, =strMsg10
	BL putstring

	LDR R1, =strVal3
	mov r2, #4
	mov r3, #13
	bl String_substring_1
	
	LDR R1, =strTemp
	str R0, [R1]
	LDR R1, [R1]
	bl putstring
	
	LDR R1, =strTemp
	LDR R0, [R1]
	bl free
	
	LDR R1, =newline
	bl putstring
	
	/*====================
	LDR R1, =strMsg11
	BL putstring
	
	LDR R1, =strMsg12
	BL putstring
	
	LDR R1, =strMsg13
	BL putstring
	
	LDR R1, =strMsg14
	BL putstring
	
	LDR R1, =strMsg15
	BL putstring
	*/
	
	//=================================
	LDR R1, =strMsg16
	BL putstring
	
	LDR R1, =strVal2
	MOV R2, #103
	bl String_indexOf_1
	
	LDR R1, =temp
	bl intasc32
	bl putstring
		
	LDR R1, =newline
	bl putstring
	//==================================
	LDR R1, =strMsg17
	BL putstring
	
	LDR R1, =strVal2
	MOV R2, #103
	MOV R3, #9
	bl String_indexOf_2
	
	LDR R1, =temp
	bl intasc32
	bl putstring
	
	
	LDR R1, =newline
	bl putstring
	//==================================
	LDR R1, =strMsg18
	BL putstring
	
	LDR R1, =strVal2
	LDR R2, =strVar
	bl String_indexOf_3
	
	LDR R1, =temp
	bl intasc32
	bl putstring
	
	
	LDR R1, =newline
	bl putstring
	//==================================
	LDR R1, =strMsg19
	BL putstring
	
	LDR R1, =strVal2
	MOV R2, #103
	bl String_lastIndexOf_1
	
	LDR R1, =temp
	bl intasc32
	bl putstring
	
	LDR R1, =newline
	bl putstring
	//==================================
	LDR R1, =strMsg20
	BL putstring
	
	LDR R1, =strVal2
	MOV R2, #103
	MOV R3, #6
	bl String_lastIndexOf_2
	
	LDR R1, =temp
	bl intasc32
	bl putstring
	
	
	LDR R1, =newline
	bl putstring
	//==================================
	LDR R1, =strMsg21
	BL putstring
	
	LDR R1, =strVal2
	LDR R2, =strVar2 
	bl String_lastIndexOf_3
	
	LDR R1, =temp
	bl intasc32
	bl putstring
	
	
	LDR R1, =newline
	bl putstring
	//==================================
	LDR R1, =strMsg22
	BL putstring
	
	LDR R1, =strVal1
	MOV R2, #97
	MOV R3, #111
	bl String_replace 
	LDR R1, [R1]
	bl putstring
	
	LDR R1, =newline
	bl putstring
	//==================================
	LDR R1, =strMsg23
	BL putstring
	
	LDR R1, =newline
	bl putstring
	//==================================
	LDR R1, =strMsg24
	BL putstring
	
	LDR R1, =strVal1
	bl String_toUpperCase
	bl putstring
	
	LDR R1, =newline
	bl putstring
	//==================================
	
	
	
	b end

@INPUT CREATES TWO DYNAMICALLY ALLOCATED STRINGS
@USES BUFFER OF 512 BYTES 
@================================@	
_input:

	push {r4-r11, lr}
	
	//START INPUT FOR STRING 1
	
	LDR R1, =strMsg0
	BL putstring
	
	bl getStringLoop
	LDR R1, =strVal1
	str r0, [r1]
	
	LDR R1, =strMsg1
	BL putstring
	
	bl getStringLoop
	LDR R1, =strVal2
	str r0, [r1]
	
	LDR R1, =strMsg2
	BL putstring
	
	bl getStringLoop
	LDR R1, =strVal3
	str r0, [r1]
	
	pop {r4-r11, lr}
	bx lr
	
getStringLoop:
	
	LDR R1, =buffSize
	MOV R2, #512
	BL getstring
	
	BL String_length
	
	mov r8, r0
	add r9, #1

	bl malloc 
	
	mov r6, r0
	
inputLoop:

	cmp r8, #0
	beq endinputLoop
	ldrb r7, [r5], #1
	strb r7, [r6], #1
	sub r8, #1
	b inputLoop
		
	
endinputLoop:
	mov R1, #0
	str r1, [r6]
	bx lr
/*	
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
	
	MOV R0, #0
	LDR R1, =buffSize			@CLEAR BUFFER
	str r0, [r1]
	
	//START INPUT FOR STRING 3
	LDR R1, =strMsg2
	BL putstring
	
	LDR R1, =buffSize
	MOV R2, #512
	BL getstring
	
	ldr r5, =buffSize

	bl String_length
	
	mov r8, r0
	add r0, #1
	
	bl malloc 
	
	mov r6, r0
	
loop3:

	cmp r8, #0
	beq endloop3
	ldrb r7, [r5], #1
	strb r7, [r6], #1
	sub r8, #1
	b loop3
		
	
endloop3:
	
	MOV r1, #0
	str r1, [r6]
	LDR R1, =strVal3
	str r0, [r1] 
*/	
@=========================================================

end: 
	
	LDR R0, =strVal1
	LDR r0, [r0]
	BL free 
	LDR R0, =strVal2
	LDR r0, [r0]
	BL free
	LDR R0, =strVal3
	LDR R0, [R0]
	BL free

	LDR r1, =strEnd
	bl putstring

	mov r7, #1
	svc 0
