	

.data
szMsg1: .asciz "Enter x: "
szMsg2: .asciz "Enter y: "
szMsg3: .asciz "Enter z: "
szMsgName: .asciz "Author: Robert Gaines"
szMsgLab: .asciz "Program: Exam 1"
szMsgDate: .asciz "Date: 9/26/2019"

cCR:	.byte 10
szInput:  .skip 12
temp: .skip 12
szValX: .skip 20
szValY: .skip 20
szValZ: .skip 20
pOpen: .asciz "("
pClose: .asciz ") "
plus: .asciz "+"
minus: .asciz "-"
times: .asciz "*"
divide: .asciz "/"
equals: .asciz "="
space: .asciz " " 
answer: .word 0

.text
	.global _start
	.equ 	BUFSIZE, 20
_start:

	@START PROGRAM OFF BY PRINTING INTRO MESSAGES 
	LDR R1, =szMsgName
	BL putstring
	ldr R1, =cCR
	bl putch
	LDR R1, =szMsgDate
	BL putstring
	ldr R1, =cCR
	bl putch
	LDR R1, =szMsgLab
	BL putstring
	ldr R1, =cCR
	bl putch
	ldr R1, =cCR
	bl putch
	

	@variable X

	LDR R1, =szMsg1
	bl putstring
	ldr R1, =szValX
	ldr R2, =BUFSIZE
	bl getstring
	ldr R1, =cCR
	bl putch

	@variable Y

	LDR R1, =szMsg2
	bl putstring
	ldr R1, =szValY
	ldr R2, =BUFSIZE
	bl getstring
	ldr R1, =cCR
	bl putch

	@variable Z 

	LDR R1, =szMsg3
	bl putstring
	ldr R1, =szValZ
	ldr R2, =BUFSIZE
	bl getstring
	ldr R1, =cCR
	bl putch
	ldr R1, =cCR
	bl putch


	@PRINT OUT THE EQUATION
	LDR R1, =pOpen
	bl putstring

	LDR R1, =szValX
	bl putstring

	LDR R1, =times
	bl putstring

	LDR R1, =szValY
	bl putstring

	LDR R1, =plus
	bl putstring

	LDR R1, =szValZ
	bl putstring

	LDR R1, =minus
	bl putstring

	LDR R1, =szValX
	bl putstring

	LDR R1, =pClose
	bl putstring

	LDR R1, =divide
	bl putstring

	LDR R1, =szValZ
	bl putstring

	LDR R1, =equals 
	bl putstring


	@START (X * Y + Z - X)/Z =

	ldr R1, =szValX
	bl ascint32
	ldr r2, =szValX
	str r2, [r0]

	mov r2, r0
	
	ldr R1, =szValY
	bl ascint32 

	mov r3, r0

	ldr R1, =szValZ
	bl ascint32

	mov r4, r0
	
	mul r0, r2, r3 

	add r0, r4

	sub r0, r2
	
	lsr r0, #2
	LDR R1, =temp
	bl intasc32
	bl putstring

	ldr R1, =cCR
	bl putch
	ldr R1, =cCR
	bl putch


	
	

	
	
	mov R7, #1
	svc 0



	.end