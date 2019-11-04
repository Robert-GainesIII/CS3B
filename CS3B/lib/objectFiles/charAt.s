@*****************************************************************************
@AUTHOR:		Robert Gaines
@PROGRAM:   		charAt(string word, int pos)
@[R1]:			points to address of string being searched
@[R2]:			contains the index to search for
@
@RETURNS: 		R0 contains the char at index if exists, else returns 0
@
@*****************************************************************************


	.global charAt

charAt:
		push {r1-r4, lr}
		bl String_length
		cmp r0, r2
		blt end1
		ldrb r0, [r1, r2]
		b end2
end1:
		mov r0, #0
end2:
		pop {r1-r4, lr}
		bx lr
