@*****************************************************************************
@AUTHOR:		Robert Gaines
@PROGRAM:   	+String_lastIndexOf_2(string1:String,ch:char,fromIndex:int):int     
@[R1]:			points to address of string being searched
@[R2]:			contains the char to search for
@[R3]:			contains index to start at
@
@RETURNS: 		R0 contains the index of the first occurence, else returns -1
@
@*****************************************************************************

.global String_lastIndexOf_2

String_lastIndexOf_2:
	push {r1-r11, lr}

	mov r5, r2
	mov r6, r3
	LDR R1, [R1]
	mov r4, r1
	

lastIndexOf_2Loop:
	cmp r6, #0
	beq lastIndexNotFound2
	ldrb r7, [r4,r6]
	cmp r7, r5
	beq lastIndexFound2
	sub r6,#1
	b lastIndexOf_2Loop
lastIndexFound2:
	mov r0, r6
	b end_lastIndexof_2
lastIndexNotFound2:
	mov r0, #-1
end_lastIndexof_2: 
	pop {r1-r11, lr}
	
	bx lr
