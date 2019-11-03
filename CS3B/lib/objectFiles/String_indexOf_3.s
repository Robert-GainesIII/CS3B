@*****************************************************************************
@AUTHOR:		Robert Gaines
@PROGRAM:   	+String_indexOf_3(string1:String, str:String):int     
@[R1]:			points to address of string being searched
@[R2]:			points to substring to be matched 
@
@RETURNS: 		R0 contains the index of the first occurence of the substring, else returns -1
@
@*****************************************************************************

.global String_indexOf_3

String_indexOf_3:
	push {r1-r2, lr}
	mov r4, r1
	mov r5, r2
	LDR R1, [R1]
	bl String_length
	sub r6, r0
	mov r10, #0

indexOf_3Loop:
	cmp r6, #0
	beq indexNotFound3
	mov r1, r5
	mov r2, 
	cmp r7, r5
	beq indexFound3
	sub r6,#1
	add r10, #1
	b indexOf_3Loop
indexFound3:
	mov r0, r10
	b end_indexof_3
indexNotFound3:
	mov r0, #-1
end_indexof_3: 
	pop {r1-r2, lr}
	
	bx lr
