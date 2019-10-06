
.text
	@PURPOSE OF LAB THREE
	@ADD 32 bit TWO's COMPLIMENT OF −149 and −4321

.global _start

_start:

	ldr r10, =0xFFFFEF1F
	ldr r11, =0xFFFFFF6B
	add r7, r10, r11
	svc 0

	.end
