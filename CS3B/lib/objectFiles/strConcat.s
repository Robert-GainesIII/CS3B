@*****************************************************************************
@Author:		Robert Gaines
@Program:   	String Concat
@[R1]:			points to first byte of String A
@[R2]:			points to first byte of String B
@
@Description:
@				Passing in two strings, using malloc, allocates enough memory for 
@				a new concatitnation of the two strings. Returns new string in R1
@     
@*****************************************************************************


	.global strConcat
	
strConcat:
		push {r4-r11, lr}
		
		@move string A and string B into temp registers to maintain strings 
		mov R4, R1
		mov R5, R2
		
		@get length of string A and store it into R7
		mov R1, R4
		bl String_length
		mov r7, r0
		
		@get length of string B and store it into R8
		mov R1, R5
		bl String_length
		mov r8, r0
		
		@add lengthA + lengthB +1 and store in r0 for malloc
		add r0, r7, r8
		@adds one to account for null terminator
		add r0, #1
		
		@calls malloc and returns r0 new address
		bl malloc

		MOV r10, r0

		
		
loop:
		cmp r7, #0
		beq loop2
		ldrb r9, [r4], #1
		strb r9, [r10], #1
		subs r7, #1
		b loop 
	

loop2:
		cmp r8, #0
		beq endloop
		ldrb r9, [r5], #1
		strb r9, [r10], #1
		subs r8, #1
		b loop2 

endloop:
		mov r1, #0
		strb r1, [r10]
		pop {r4-r11, lr}
		bx lr
		
		

		
		
		
		
		
		
		
		

	

	