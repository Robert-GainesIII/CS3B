@*****************************************************************************
@AUTHOR:		Robert Gaines
@PROGRAM:   	+String_lastIndexOf_1(string1:String, ch:char):  
@[R1]:			points to address of string being searched
@[R2]:			contains the char to search for
@
@RETURNS: 		It returns the last occurrence of the character ch in the string.
@				Start at end of string and work backwards last index = first index backwards
@*****************************************************************************

.global String_lastIndexOf_1

String_lastIndexOf_1:
	push {r1-r2, lr}

	mov r5, r2
	LDR R1, [R1]
	mov r4, r1
	bl String_length
	mov r6, r0

lastIndexOf_1Loop:
	cmp r6, #0
	beq lastIndexNotFound1
	ldrb r7, [r4,r6]
	cmp r7, r5
	beq lastIndexFound1
	sub r6,#1
	b lastIndexOf_1Loop
lastIndexFound1:
	mov r0, r6
	b end_lastIndexof_1
lastIndexNotFound1:
	mov r0, #-1
end_lastIndexof_1: 
	pop {r1-r2, lr}
	
	bx lr
