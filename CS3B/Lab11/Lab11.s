.data

arru8List: .byte 1,2,3,4,5
u8Sum: .byte 
arrsList: .hword -1,1,-2,2,3
sSum: .hword 
arriList: .word 1024, -1024, 2049, -2049, 4100
iSum: .word


szMsgName: .asciz " Name: Robert Gaines"
szMsgClass: .asciz "Class: CS 3B"
szMsgLab: .asciz "  Lab: 11"
szMsgDate: .asciz " Date: 10/01/2019"
szMsgSum1: .asciz "u8Sum: "
szMsgSum2: .asciz "sSum: "
szMsgSum3: .asciz "iSum: "

cCR:	.byte 10



.text 
.global _start 

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

	@LOOP THROUGH FIRST BYTE ARRAY AND SUM ALL INDEXES 
	mov r0, #0
	ldr r5,  =arru8List
	mov r6, #0
	AGN:
	cmp r6, #4
	bhi NXT
	ldrb r1, [r5,r6]
	add r0, r0, r1
	add r6, r6, #1
	b AGN
	NXT:
	ldr r1, =u8Sum
 	strb r0, [r1]

	@PRINT OUT FIRST SUM
	ldr r1, =szMsgSum1
	bl putstring
	LDR R1, =u8Sum
	bl intasc32
	bl putstring

	ldr R1, =cCR
	bl putch
	ldr R1, =cCR
	bl putch

	@LOOP THROUGH SECOND HALF WORD ARRAY AND SUM ALL INDEXES 
	mov r0, #0
	ldr r5,  =arrsList
	mov r6, #0

	AGN2:
	cmp r6, #4
	bhi NXT2
	ldrsh r1, [r5,r6]
	cmp r1,#0
	bge negative
	add r0, r0, r1
	add r6, r6, #1
	b AGN2
	negative:
	neg r3,r1
	add r3, r3, #1
	sub r0, r0, r3
	add r6, r6, #1
	b AGN2
	NXT2:
	ldr r1, =sSum
 	strh r0, [r1]

	@PRINT OUT FIRST SUM
	ldr r1, =szMsgSum2
	bl putstring
	LDR R1, =sSum
	bl intasc32
	bl putstring
	ldr R1, =cCR
	bl putch
	ldr R1, =cCR
	bl putch


	@LOOP THROUGH THIRD WORD ARRAY AND SUM ALL INDEXES 
	mov r0, #0
	ldr r5,  =arriList
	mov r6, #0
	AGN3:
	cmp r6, #4
	bhi NXT3
	ldr r1, [r5,r6]
	add r0, r0, r1
	add r6, r6, #1
	b AGN3
	NXT3:
	ldr r1, =iSum
 	str r0, [r1]

	@PRINT OUT FIRST SUM
	ldr r1, =szMsgSum3
	bl putstring
	LDR R1, =iSum
	bl intasc32
	bl putstring

	ldr R1, =cCR
	bl putch
	ldr R1, =cCR
	bl putch

	mov r7, #1
	svc 0
