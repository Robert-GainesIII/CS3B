/***********************************************
	  ~ String_copy ~
	Programmer: Sophia Jordan
	Class: CS 3B Assembly Language
	Date:  Nov. 5th 2019

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
r1: contains string to copy
r0: address of new string
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
************************************************/
.data
.text
.global String_copy 
.extern malloc
.extern free

String_copy: 	        
    	push {r1-r2,lr}
	mov r9, r1
	bl String_length
	mov r8, r0
	add r0, #1
	push {r9}
	bl malloc
	mov r6, r0
	pop {r9}

_propstr:
	cmp r8, #0
	beq _end
	ldrb r7, [r9], #1
	strb r7, [r6], #1
	sub r8, #1
	b _propstr	

_end:
	mov r1, #0
	str r1, [r6]
	
	pop {r1-r2, lr}
	bx lr




