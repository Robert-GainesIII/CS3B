@*****************************************************************************
@AUTHOR:		Robert Gaines
@PROGRAM:   	+String_indexOf_2(string1:String,ch:char,fromIndex:int):int     
@[R1]:			points to address of string being searched
@[R2]:			contains the char to search for
@[R3]:			contains index to start at
@
@RETURNS: 		R0 contains the index of the first occurence, else returns -1
@
@*****************************************************************************

.global String_indexOf_2

String_indexOf_2:
	push {r1-r2, lr}

	mov r5, r2
	LDR R4, [r1,r3]
	LDR R1, [R1]
	LDR R4, [R4]
	bl String_length
	sub r6, r0, r3
	mov r10, r3

indexOf_2Loop:
	cmp r6, #0
	beq indexNotFound2
	ldrb r7, [r4], #1
	cmp r7, r5
	beq indexFound2
	sub r6,#1
	add r10, #1
	b indexOf_2Loop
indexFound2:
	mov r0, r10
	b end_indexof_2
indexNotFound2:
	mov r0, #-1
end_indexof_2: 
	pop {r1-r2, lr}
	
	bx lr
