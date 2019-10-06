
.text
	@PURPOSE OF LAB TWO 
	@6x^2 - 9x + 2
	@LOAD X into r3

.global _start

_start:

	mov r3, #0xA
	mov r11, #6 
	mov r12, #2
	mul r10, r3, r3 @creates x^2 at r2
	mul r10,r11,r10 @creates 6x^2
	mov r11, #9
	mul r11, r3, r11 @r11 becomes 9x 

	@now to do perform r10 - r11 + r12
	sub r10, r10, r11
	add r2, r10, r12 

	@expected output with x = 10
	@r2 = 512 
	
	svc 0

	.end
