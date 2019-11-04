@*****************************************************************************
@AUTHOR:		Robert Gaines
@PROGRAM:   	String_lastIndexOf_3(string1:String,str:String):int      
@[R1]:			points to address of string being searched
@[R2]:			points to substring to be matched 
@
@RETURNS: 		R0 contains the index of the last occurence of the substring, else returns -1
@
@*****************************************************************************

.global String_lastIndexOf_3

String_lastIndexOf_3:

	push {r1-r2, lr}		@Preserve registers 1 and 2, and link register
	mov r4, r1				@copy string one to register four
	mov r5, r2				@copy string two to register five
	LDR R1, [R4]			@Dereference pointer to string one
	bl String_length		@call string length for string one	
	mov r8, r0				@Length of String one
	MOV R1, R5				@move string two into r1
	bl String_length		@call string length for string two
	mov r9, r0				@Length of String two
	sub r10, r8, r9			@create this to check in loop
	ldrb r7, [r5]			@first char of substring to search for 
	mov r6, #0				@initliize a counter
	
	//CHECK SUBSTRING FOR EXISTENCE AT ALL 
	MOV R1, R4 				@LOAD arg for indexOf
	MOV R2, R7				@LOAD char to search for 
	MOV R3, R6				@start searching from beginning
	bl String_indexOf_2
	cmp r0, #0
	blt lastIndexOf_3NotFound
	
substringSearch2:

	cmp r6, r10				@compare index to string one length-length of substring
	beq end_lastIndexOf_3

	MOV R1, R4 				@LOAD arg for indexOf
	MOV R2, R7				@LOAD char to search for 
	MOV R3, R6				@start searching from beginning
	bl String_indexOf_2
	cmp r0, #-1
	beq end_lastIndexOf_3
	
	mov r6, r0				@REALLY IMPORTANT* this will be the index returned if substring found
	
	MOV R1, R4				@LOAD string one for substring
	MOV R2, R6				@LOAD first index	
	add R3, R6, R9			@LOAD second index = indexOf(firstIndex + length of substring)
	sub r3, #1				@account for off balance in algorithm
	bl String_substring_1
	
	mov r2, r5
	mov r3, r0 
	bl String_equals
	cmp r0, #1				@check to see if current substring is equal to target substring
	beq lastIndexOf_3Found
	
	add r6, #1				@increment index for next search
	b substringSearch2
	
	
lastIndexOf_3NotFound:
	mov r0, #-1
	b end_lastIndexOf_3
	
lastIndexOf_3Found:
	mov r11, r6				@store index when substring is found
	add r6, #1
	b substringSearch2
	
	
end_lastIndexOf_3: 
	pop {r1-r2, lr}
	
	bx lr
