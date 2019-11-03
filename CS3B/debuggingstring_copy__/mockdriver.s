/*==================================================
	      ~ RASM3.s ~
	Programmer: Sophia Jordan 
	Class: CS 3B Assembly Language
	Date:  Nov. 5th 2019
test string functions
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
[ key variables.. ]
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
====================================================
****************************************************/
.data
str1:		.skip 50	
str2:		.skip 50	
str3:		.skip 50	
str4:		.skip 50
cCr: 		.byte 10

prompt1:	.asciz 	"Please enter the first string (s1): "
prompt2:	.asciz 	"Please enter the second string (s2): "
prompt3:	.asciz	"Please enter the third string (s3): "

test1msg:	.asciz	"1. Lengths of s1, s2, s3: "
test2msg:	.asciz	"2. String_equals(s1, s3): "
test3msg:	.asciz	"3. String_equals(s1, s1): "
test4msg:	.asciz	"4. String_equalsIgnoreCase(s1, s3): "
test5msg:	.asciz	"5. String_equalsIgnoreCase(s1, s2): "
test6msg:	.asciz	"6. s4 = String_copy(s1)\ns1 = "
test6msg2:	.asciz	"\ns4 = "
test7msg:	.asciz	"7. String_substring_1(s3, 4, 13): "
test8msg:	.asciz	"8. String_substring_2(s3, 7): "

.text
.global _start
.extern malloc
.extern free

.equ	BUFSIZE, 100	@ Size of input buffer can be changed

_start:
ldr	r1, =prompt1	
bl	putstring	
ldr	r1, =str1		
mov	r2, #BUFSIZE	
bl	getstring	
ldr	r1, =prompt2	
bl	putstring
ldr	r1, =str2		
mov	r2, #BUFSIZE	
bl	getstring
ldr	r1, =prompt3	
bl	putstring
ldr	r1, =str3		
mov	r2, #BUFSIZE	
bl	getstring	

ldr	r1, =cCr	
bl	putch		


@ T2
ldr r1, =test2msg
bl putstring
ldr r2, =str1
ldr r3, =str3
bl String_equals
bl Boolean_output


@ T3
ldr r1, =test3msg
bl putstring
ldr r2, =str1
ldr r3, =str1
bl String_equals
bl Boolean_output

@ T4
ldr r1, =test4msg
bl putstring
ldr r2, =str1
ldr r3, =str3
bl String_equalsIgnoreCase
bl Boolean_output

@ T5
// -- test 5: string equals (ignore case)... 
ldr r1, =test5msg
bl putstring
ldr r2, =str1
ldr r3, =str2
bl String_equalsIgnoreCase
bl Boolean_output


@ T6
ldr r1, =test6msg
bl putstring
ldr r1, =str1
bl putstring

ldr r1, =test6msg2
bl putstring

ldr r1, =str1
bl String_copy
mov r1, r0
ldr r1, [r1]
bl putstring


 
/*
@ T7
ldr r1, =test7msg
bl putstring
ldr r1, =str3
mov r2, #4
mov r3, #13
bl String_substring_1

mov r1, r0
bl putstring

ldr r1, =cCr
bl putch
*/



mov r7, #1
svc 0


/* programmed by sophia jordan */
