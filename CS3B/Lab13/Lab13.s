.data

szVal: .skip 12
iVal: .word 0
tempBuff: .skip 12

szMsgName: .asciz " Name: Robert Gaines"
szMsgClass: .asciz "Class: CS 3B"
szMsgLab: .asciz "  Lab: 11"
szMsgDate: .asciz " Date: 10/01/2019"
szMsg1: .asciz " is less than 0"
szMsg2: .asciz " is greater than 0"
szMsg3: .asciz " is equal than 0"
szMsg4: .asciz "Please Enter a Integer Number: "

cCR:	.byte 10



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
	LDR R1, =szMsg4
	BL putstring
	ldr R1, =cCR
	bl putch
	ldr R1, =cCR
	bl putch

check:
	
	ldr R1, =szVal
	ldr R2, =BUFSIZE
	bl getstring
	ldr R1, =cCR
	bl putch

	ldr R1, =szVal
	bl ascint32

	ldr R2, =iVal
	str R0, [R2]
	ldr r0, [r2]
	mov r5, #0
	cmp r0, r5

	BLT lessThan

	BGT greaterThan

	BEQ equalTo
	
lessThan:

	LDR R1, =szMsg1
	BL putstring
	ldr R1, =cCR
	bl putch
	b end


greaterThan:

	LDR R1, =szMsg2
	BL putstring
	ldr R1, =cCR
	bl putch
	b end

equalTo:
	LDR R1, =szMsg3
	BL putstring
	ldr R1, =cCR
	bl putch

end:
	mov r7, #1
	svc 0
