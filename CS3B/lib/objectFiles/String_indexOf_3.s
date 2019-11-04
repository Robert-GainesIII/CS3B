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

	push {r1-r2, lr}		@Preserve registers 1 and 2, and link register
	mov r4, r1				@copy string one to register four
	mov r5, r2				@copy string two to register five
	LDR R1, [R4]			@Dereference pointer to string one
	bl String_length		@call string length for string one	
	mov r8, r0				@Length of String one
	LDR R1, [r5]			@Dereference pointer to string two
	bl String_length		@call string length for string two
	mov r9, r0				@Length of String two
	sub r10, r8, r9			@create this to check in loop
	ldrb r7, [r5]			@first char of substring to search for 
	mov r6, #0				@initliize a counter
	
substringSearch:

	cmp r6, r10				@compare index to string one length-length of substring
	beq indexOf_3NotFound

	MOV R1, R4 				@LOAD arg for indexOf
	MOV R2, R7				@LOAD char to search for 
	MOV R3, R6				@start searching from beginning
	bl String_indexOf_2
	cmp r0, #-1
	beq indexOf_3NotFound
	
	mov r6, r0				@REALLY IMPORTANT* this will be the index returned if substring found
	
	MOV R1, R4				@LOAD string one for substring
	MOV R2, R6				@LOAD first index	
	add R3, R2, R9			@LOAD second index = indexOf(firstIndex + length of substring)
	bl String_substring_1
	
	mov r2, r4
	mov r3, r0 
	bl String_equals
	cmp r0, #1				@check to see if current substring is equal to target substring
	beq indexOf_3Found
	
	add r6, #1				@increment index for next search
	b substringSearch
	
	

indexOf_3NotFound:
	mov r0, #-1
	b end_indexof_3
	
indexOf_3Found:
	mov r0, r6			@Load in return register the index found 
	
end_indexof_3: 
	pop {r1-r2, lr}
	
	bx lr
