	

.data
szMsg1: .asciz "Enter a value: "
szMsg2: .asciz "You just typed: "
cCR:	.byte 10
szInput:	.skip 15
szValA: .skip 12
szValB: .skip 12
szValC: .skip 12
szValD: .skip 12
count:  

.text
	.global _start
	.equ 	BUFSIZE, 20
_start:

	@variable A 

	LDR R1, =szMsg1
	bl putstring

	ldr R1, =szValA
	ldr R2, =15
	bl getstring
	
	ldr R1, =szMsg2
	bl putstring
	
	ldr R1, =szValA
	bl putstring

	ldr R1, =cCR
	bl putch

	@variable B 

	LDR R1, =szMsg1
	bl putstring

	ldr R1, =szValB
	ldr R2, =15
	bl getstring
	
	ldr R1, =szMsg2
	bl putstring
	
	ldr R1, =szValB
	bl putstring

	ldr R1, =cCR
	bl putch

	@variable C 

	LDR R1, =szMsg1
	bl putstring

	ldr R1, =szValC
	ldr R2, =15
	bl getstring
	
	ldr R1, =szMsg2
	bl putstring
	
	ldr R1, =szValC
	bl putstring

	ldr R1, =cCR
	bl putch

	@variable D 

	LDR R1, =szMsg1
	bl putstring

	ldr R1, =szValD
	ldr R2, =15
	bl getstring
	
	ldr R1, =szMsg2
	bl putstring
	
	ldr R1, =szValD
	bl putstring

	ldr R1, =cCR
	bl putch
	

	
	
	mov R7, #1
	svc 0



	.end