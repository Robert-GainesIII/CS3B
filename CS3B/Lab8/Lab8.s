	.global _start
_start:
	LDR R0, =x
	MOV R2, #5
	STR R2, [R0]

	LDR R1, =y
	MOV R3, #10
	STR R3, [R1]
	
	ADD R5, R2, R3
	LDR R6, =sum
	STR R5, [R6]
	
	MOV R0, #0
	MOV R7, #1
	SVC 0
	
	.data

x:	.word 0
y:	.word 0
sum:	.word 0



	.end