/*Lab5 Robert Gaines CS3B */

	.data
addr_value1:	.float 6.0221415e23
addr_value2:	.float 4.0

	.global _start

_start: 
	VLDR s1, addr_value1
	VLDR s2, addr_value2

	VMUL.F32 s0, s1, s2

	mov r7, #1
	svc 0

	.end

/*End of Lab*/
