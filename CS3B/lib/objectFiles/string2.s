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

	mov r5, r2
	LDR R1, [R1]
	mov r4, r1
	bl String_length
	mov r6, r0
	mov r10, #0

indexOf_1Loop:
	cmp r6, #0
	beq indexNotFound1
	ldrb r7, [r4], #1
	cmp r7, r5
	beq indexFound1
	sub r6,#1
	add r10, #1
	b indexOf_1Loop
indexFound1:
	mov r0, r10
	b end_indexof_1
indexNotFound1:
	mov r0, #-1
end_indexof_1: 
	pop {r1-r2, lr}
	
	bx lr
	
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
	push {r1-r11, lr}

	mov r5, r2
	LDR R1, [R1]
	mov r4, r1
	bl String_length
	sub r6, r0, r3
	mov r10, r3

indexOf_2Loop:
	cmp r6, #0
	beq indexNotFound2
	ldrb r7, [r4,r10]
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
	pop {r1-r11, lr}
	
	bx lr
	
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
	MOV R1, R5				@move string two into r1
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
	add R3, R6, R9			@LOAD second index = indexOf(firstIndex + length of substring)
	sub r3, #1				@account for off balance in algorithm
	bl String_substring_1
	
	mov r2, r5
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
	push {r1-r2, lr}

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
	pop {r1-r2, lr}
	
	bx lr
	
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
	mov r11, #-1			@default not found
	
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

	mov r0, r11
	pop {r1-r2, lr}
	
	bx lr

@==================================================================================================================================	
@ Subroutine String_Length accepts the address of a string and counts the characters in the string,
@ excluding the NULL character and returns that value as an int (word) in the R0 register. 
@ will read a string of characters terminated by a null
@ R1: Points to first byte of string to count
@ LR: Contains the return address

@ Returned register contents:
@ R0: Number of characters in the string (does not include null).
@ All registers are preserved as per AAPCS

.text

.global String_length

String_length:
	push {r1-r11, lr}

	mov r0, #0

nextChar: 
	ldrb r2, [r1], #1
	subs r2,#0
	beq returnChar 

	add r0, #1
	B nextChar

returnChar: 
	pop {r1-r11, lr}
	bx lr
	
	
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
	mov r4, #0
	LDR R9, [R1]
	LDR R1, [R1]
	bl String_length
	
	mov r10, r0			@length of string
	
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
	
	push {r1-r11, lr}
	
	LDR R1, [R1] 
	mov r4, r1
	mov r6, r2
	mov r7, r3
	
	add r0, r2, r3
	add r0, #1
	bl malloc 
	add r7, #1
	mov r5, r0
	
substring_1Loop:
	
	cmp r6, r7
	beq end_substring_1Loop
	ldrb r8, [r4, r6]
	strb r8, [r5], #1
	add r6, #1
	b substring_1Loop
	
end_substring_1Loop:
	
	pop {r1-r11, lr}
	
	bx lr 
	
@*****************************************************************************
@AUTHOR:		Robert Gaines
@PROGRAM:   	+String_toLowerCase(string)     
@[R1]:			points to address of string being converted
@
@RETURNS: 		R1 contains converted toupper string
@
@*****************************************************************************
	.global String_toLowerCase
@===============================@
String_toLowerCase:
	push {lr}
	LDR R1, [R1]
	mov r3, r1
	bl String_length
	mov r8, r0
	
firstLoopTL:
	cmp r8, #0
	beq endLower
	ldrb r7, [r3]
	cmp r7, #67
	blt nextCharTL
	cmp r7, #92
	bgt nextCharTL
	add r7, #32
	strb r7, [r3],#1
	sub r8, #1
	b firstLoopTL
nextCharTL:
	add r3, #1
	sub r8, #1
	b firstLoopTL


endLower:
	pop {lr}
	bx lr
@===============================@

@*****************************************************************************
@AUTHOR:		Robert Gaines
@PROGRAM:   	+String_toUpper(string)     
@[R1]:			points to address of string being converted
@
@RETURNS: 		R1 contains converted toupper string
@
@*****************************************************************************
	.global String_toUpperCase
@===============================@
String_toUpperCase:
	push {lr}
	LDR R1, [R1]
	mov r3, r1
	bl String_length
	mov r8, r0
	
firstLoopTU:
	cmp r8, #0
	beq endUpper
	ldrb r7, [r3]
	cmp r7, #97
	blt nextCharTU
	cmp r7, #122
	bgt nextCharTU
	sub r7, #32
	strb r7, [r3],#1
	sub r8, #1
	b firstLoopTU
nextCharTU:
	add r3, #1
	sub r8, #1
	b firstLoopTU


endUpper:
	pop {lr}
	bx lr
@===============================@


@*****************************************************************************
@Author:		Robert Gaines
@Program:   	String Concat
@[R1]:			points to first byte of String A
@[R2]:			points to first byte of String B
@
@Description:
@				Passing in two strings, using malloc, allocates enough memory for 
@				a new concatitnation of the two strings. Returns new string in R0
@     
@*****************************************************************************


	.global String_concat
	
String_concat:
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

		
		
String_concatloop:
		cmp r7, #0
		beq String_concatloop2
		ldrb r9, [r4], #1
		strb r9, [r10], #1
		subs r7, #1
		b String_concatloop 
	

String_concatloop2:
		cmp r8, #0
		beq String_concatendloop
		ldrb r9, [r5], #1
		strb r9, [r10], #1
		subs r8, #1
		b String_concatloop2 

String_concatendloop:
		mov r1, #0
		strb r1, [r10]
		pop {r4-r11, lr}
		bx lr
		
		
@*****************************************************************************
@AUTHOR:		Robert Gaines
@PROGRAM:   		charAt(string word, int pos)
@[R1]:			points to address of string being searched
@[R2]:			contains the index to search for
@
@RETURNS: 		R0 contains the char at index if exists, else returns 0
@
@*****************************************************************************


	.global String_charAt

String_charAt:
		push {r1-r4, lr}
		bl String_length
		cmp r0, r2
		blt String_charAtend1
		ldrb r0, [r1, r2]
		b String_charAtend2
String_charAtend1:
		mov r0, #0
String_charAtend2:
		pop {r1-r4, lr}
		bx lr