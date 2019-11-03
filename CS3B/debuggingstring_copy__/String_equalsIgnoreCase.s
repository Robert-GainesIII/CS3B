/***********************************************
	  ~ String_equalsIgnoreCase ~
	Programmer: Sophia Jordan
	Class: CS 3B Assembly Language
	Date:  Nov. 5th 2019
 method compares two strings, returns 1 into r0 
 if =, returns 0 if false 
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
r2: contains str1
r3: contains str3
r0: returned value, acts as bool for t or f
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
************************************************/
.data
.text
.global String_equalsIgnoreCase 

String_equalsIgnoreCase:
	push {lr}
	mov r1, r2
	bl String_length
	mov r4, r0

	mov r1, r3
	bl String_length

	cmp r4, r0
	bne _notequal

	mov r4, r2
	mov r5, r3

_compareChars:
	cmp r0, #0
	beq _equal	

	ldrb r7, [r4], #1
	ldrb r8, [r5], #1

	@ if lowercase, make upper case.. 
	cmp   r7, #'a'
	addlt r7, #32
	cmp   r8, #'a'
	addlt r8, #32
	
	cmp  r7, r8
	bne _notequal

	sub r0, #1
	beq _compareChars

_notequal:
	mov r0, #0
	b _end

_equal:
	mov r0, #1
	b _end

_end:
	pop {lr}
	bx lr

