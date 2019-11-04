@*****************************************************************************
@AUTHOR:		Robert Gaines
@PROGRAM:   	+String_replace(string1:String,oldChar:char,newChar:char):String    
@[R1]:			points to address of string being replaced
@[R2]:			contains old character
@[R3]:			contains new character
@
@RETURNS: 		R1 contains the edited string
@
@*****************************************************************************

.global String_replace

String_replace:
	
	push {r1-r2, lr}
	LDR R1, [R1]
	mov r9, r1
	bl String_length
	
	mov r10, r0			@length of string
	mov r4, #0
	
replaceLoop:

	cmp r4, r10
	beq endReplaceLoop
	ldrb r6, [r9]
	cmp r6, r2
	beq replace
	add r9, #1
	add r4, #1
	b replaceLoop
	
replace:

	strb r3, [r9], #1
	add r4, #1
	b replaceLoop
	
	
endReplaceLoop:
	
	pop {r1-r2, lr}
	
	bx lr
