@*****************************************************************************
@AUTHOR:		Robert Gaines
@PROGRAM:   	+String_substring_1(string1:String,beginIndex:int,endIndex:int):String     
@[R1]:			points to address of string being searched
@[R2]:			start index
@[R3]:			end index
@
@RETURNS: 		R0 contains the substring
@				This method creates a new string consisting of characters from a 
@				substring of the passed string starting with beginIndex and ending with endIndex.
@*****************************************************************************

	.global String_substring_1

String_substring_1: 
	
	push {r1, lr}
	
	LDR R1, [R1] 
	mov r4, r1
	mov r6, r2
	add r7, r3, #1
	
	add r0, r2, r3
	add r0, #1
	bl malloc 
	
	mov r5, r0
	
substring_1Loop:
	
	cmp r6, r7
	beq end_substring_1Loop
	ldrb r8, [r4, r6]
	strb r8, [r5], #1
	add r6, #1
	b substring_1Loop
	
end_substring_1Loop:
	
	pop {r1, lr}
	
	bx lr 

	