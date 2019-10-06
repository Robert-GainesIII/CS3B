	

.data
szMsg1: .asciz "Enter a value: "
szMsg2: .asciz "You just typed: "
cCR:	.byte 10
szInput:	.skip 15
szValA: .skip 12
szValB: .skip 12
szValC: .skip 12
szValD: .skip 12
intA: 
intB:
intC: 
intD:
answer: 

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

	@START (A+B) - (C+D)

	ldr R1, =szValA
	bl ascint32

	mov r2, r0
	
	ldr R1, =szValB
	bl ascint32 

	add R2, R2, R0

	ldr R1, =szValC
	bl ascint32

	mov r3, r0
	
	ldr r1, =szValD
	bl ascint32

	add r3, r3, r0

	sub r0, r2, r3
	

	
	
	mov R7, #1
	svc 0



	.end