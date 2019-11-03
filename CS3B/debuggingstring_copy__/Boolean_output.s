/***********************************************
	  ~ Boolean_output ~
	Programmer: Sophia Jordan
	Class: CS 3B Assembly Language
	Date:  Nov. 5th 2019
 method compares two strings, returns 1 into r0 
 if =, returns 0 if false 
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
r0: bool value
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
************************************************/
.data
truemsg:	.asciz "TRUE\n"
falsemsg:	.asciz "FALSE\n"

.text
.global Boolean_output

Boolean_output:
	push {lr}

	cmp r0, #0
	beq _false

	cmp r0, #1
	beq _true

_false:
	ldr r1, =falsemsg
	bl putstring
	b _end

_true:
	ldr r1, =truemsg
	bl putstring
	b _end
	
_end:
	pop {lr}
	bx lr


/* programmed by sophia jordan */
