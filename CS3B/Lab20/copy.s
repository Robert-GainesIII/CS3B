
/***********************************************
	  =String_copy=
	  
	Programmer: Robert Gaines
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
    push {r1, r4-r11, lr}                   	
	bl String_length
	mov r10, r0
	add r0, #1
	bl malloc
	mov r4, r0

string_copy_loop:
	cmp r10, #0
	b end_copy
	ldrb r5, [r1], #1
	strb r5, [r4], #1
	sub r10, #1
	b string_copy_loop	

end_copy:
	mov r1, #0
	str r1, [r4]
	pop {r1, r4-r11, lr}
	bx lr


