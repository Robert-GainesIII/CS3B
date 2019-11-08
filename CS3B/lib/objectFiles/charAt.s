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
