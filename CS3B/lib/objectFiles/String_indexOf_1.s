@*****************************************************************************
@AUTHOR:		Robert Gaines
@PROGRAM:   	+String_indexOf_1(string1:String,ch:char):int  
@[R1]:			points to address of string being searched
@[R2]:			contains the char to search for
@
@RETURNS: 		R0 contains the index of the first occurence, else returns -1
@
@*****************************************************************************

.global String_indexOf_1

String_indexOf_1:
	push {r1-r2, lr}

	mov r4, r1
	mov r5, r2
	LDR R1, [R1]
	bl String_length
	mov r6, r0

indexOf_1Loop:
	cmp r6, r0
	beq indexNotFound1
	ldrb r7, [r4], #1
	cmp r7, r5
	beq indexFound1
	sub r6,#0
	b indexOf_1Loop
indexFound1:
	mov r0, r6
	b end_indexof_1
indexNotFound1:
	mov r0, #-1
end_indexof_1: 
	pop {r1-r2, lr}
	
	bx lr
