	

.data
szMsg1: .asciz "Enter a whole number: "
szMsg2: .asciz "You just typed: "
szMsgName: .asciz " Name: Robert Gaines"
szMsgClass: .asciz "Class: CS 3B"
szMsgLab: .asciz "  Lab: RASM1"
szMsgDate: .asciz " Date: 9/26/2019"
szMsgAddress: .asciz "The addresses of the 4 ints: " 
cCR:	.byte 10
szInput:  .skip 12
temp: .skip 12
szValA: .skip 20
szValB: .skip 20
szValC: .skip 20
szValD: .skip 20
pOpen: .asciz " ("
pClose: .asciz ") "
plus: .asciz "+"
minus: .asciz "-"
equals: .asciz "="
preHex: .asciz "0x"
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
	LDR R1, =szMsgClass
	BL putstring
	ldr R1, =cCR
	bl putch
	LDR R1, =szMsgLab
	BL putstring
	ldr R1, =cCR
	bl putch
	LDR R1, =szMsgDate
	BL putstring
	ldr R1, =cCR
	bl putch
	ldr R1, =cCR
	bl putch

	@variable A 

	LDR R1, =szMsg1
	bl putstring
	ldr R1, =szValA
	ldr R2, =BUFSIZE
	bl getstring
	ldr R1, =cCR
	bl putch

	@variable B 

	LDR R1, =szMsg1
	bl putstring
	ldr R1, =szValB
	ldr R2, =BUFSIZE
	bl getstring
	ldr R1, =cCR
	bl putch

	@variable C 

	LDR R1, =szMsg1
	bl putstring
	ldr R1, =szValC
	ldr R2, =BUFSIZE
	bl getstring
	ldr R1, =cCR
	bl putch

	@variable D 

	LDR R1, =szMsg1
	bl putstring
	ldr R1, =szValD
	ldr R2, =BUFSIZE
	bl getstring
	ldr R1, =cCR
	bl putch
	ldr R1, =cCR
	bl putch

	@PRINT OUT THE EQUATION
	LDR R1, =pOpen
	bl putstring

	LDR R1, =szValA
	bl putstring

	LDR R1, =plus
	bl putstring

	LDR R1, =szValB
	bl putstring

	LDR R1, =pClose
	bl putstring

	LDR R1, =minus
	bl putstring

	LDR R1, =pOpen
	bl putstring

	LDR R1, =szValC
	bl putstring

	LDR R1, =plus
	bl putstring

	LDR R1, =szValD
	bl putstring

	LDR R1, =pClose
	bl putstring

	LDR R1, =equals 
	bl putstring


	@START (A+B) - (C+D)

	ldr R1, =szValA
	bl ascint32

	mov r2, r0
	
	ldr R1, =szValB
	bl ascint32 

	add R2, R0, R2

	ldr R1, =szValC
	bl ascint32

	mov r3, r0
	
	ldr r1, =szValD
	bl ascint32

	add r3, r3, r0

	sub r0, r2, r3

	LDR R1, =temp
	bl intasc32
	bl putstring

	ldr R1, =cCR
	bl putch
	ldr R1, =cCR
	bl putch


	@PRINT MEMORY ADRESSES 

	LDR R1, =szMsgAddress
	bl putstring 
	ldr R1, =cCR
	bl putch

	LDR R1, =preHex
	bl putstring
	LDR R0, =szValA
	LDR R1, =szInput
	LDR r2, =8
	bl hexToChar
	bl putstring
	LDR R1, =space
	bl putstring


	LDR R1, =preHex
	bl putstring
	LDR R0, =szValB
	LDR R1, =szInput
	LDR r2, =8
	bl hexToChar
	bl putstring
	LDR R1, =space
	bl putstring

	LDR R1, =preHex
	bl putstring
	LDR R0, =szValC
	LDR R1, =szInput
	LDR r2, =8
	bl hexToChar
	bl putstring
	LDR R1, =space
	bl putstring

	LDR R1, =preHex
	bl putstring
	LDR R0, =szValD
	LDR R1, =szInput
	LDR r2, =8
	bl hexToChar
	bl putstring
	LDR R1, =space
	bl putstring
	

	ldr R1, =cCR
	bl putch
	ldr R1, =cCR
	bl putch
	
	
	

	
	
	mov R7, #1
	svc 0



	.end