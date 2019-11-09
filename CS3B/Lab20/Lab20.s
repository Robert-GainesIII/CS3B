/***********************************************
	  =Lab20 Linked List Practice=
	  
	Programmer: Robert Gaines
	Class: CS 3B Assembly Language
	Date:  Nov. 14th 2019

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
CREATE TWO NODES MANUALLY AND FORM A LINKED LIST
TRANSVERE THROUGH THE LIST AND PRINT THE RESULT

NODE = [4 bytes][4 bytes] 
		 DATA	  LINK
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
************************************************/
.data


szOne : 	.asciz    "Name: Robert Gaines\nProgram: Lab20.s\nClass: CS3B\nDate: November 14, 2019\n\n"
szTwo : 	.asciz    "Thanks for using my program!! Good Day!\n"
szThree : 	.asciz    "Enter a string to store into the new Node: "
szFour : 	.asciz    "Creating New Node.. \n"
szFive : 	.asciz    "Inserting Node.. \n"
szSix : 	.asciz    "Printing linked List.. \n\n"
szSeven:    .asciz    "~LINKED LIST~\n"

buffer:	.skip	1024
first:	.word	0
last:	.word	0
temp:	.word 	0

.text		
		.global _start
		.equ	buffer_size,1024
		
_start:
		LDR R1, =szOne
		BL putstring
		MOV R6, #5
forLoop:
		CMP R6, #0
		BEQ endLab20
		LDR R1, =szFour
		BL putstring
		BL createNode
		
		LDR R1, =szSix
		BL putstring
		LDR R1, =szSeven
		BL putstring
		BL traverseList
		
		SUB R6, #1
		
insertNode:
		
		push {r4-r11, lr}
		LDR R1, =first
		LDR R2, =last
		LDR R3, [R1]
		CMP R3, #0
		BEQ insert_first		//if(first == null){first-> Node; last-> Node;}
		BL insert_last
		pop {r4-r11, lr}
		BX LR					//return to 'main'
		
insert_first:
		
		push {lr}
		STR R0, [R1]			//first = Node
		STR R0, [R2]			//last = Node
		pop {lr}
		BX lr
		
insert_last:
		
		push {lr}					
		STR R0, [R2, #4]			//last->link = newNode
		STR R0, [R2]				//last = newNode
		pop {lr}
		BX lr
		
createNode:
		
		push {r4-r11, lr}
		
		LDR R1, =szThree
		BL putstring
		
		LDR R1, =buffer
		MOV R2, #buffer_size
		BL getstring
		
		LDR R1, =buffer
		BL String_copy			
		
		MOV R10, R0				// NOW R10 CONTAINS DYNAMIC ALLOCATED ADDRESS WHEN DEREFERENCED WILL CONTAIN OUR STRING
		
		MOV R0, #8				// each Node is 8 bytes
		BL malloc 			    // Node * N = new Node
		MOV R3, R0
		STR R10, [R3]		    // Data = address of string
		
		MOV R1, #0
		STR R1, [R3, #4]			// Link -> NULL
		
		LDR R1, =szFive
		BL putstring
		
		BL insertNode
		
		pop {r4-r11, lr}
		BX lr 					// Return

traverseList:

		push {r4-r11, lr}
		LDR R1, =first
		LDR R1, [R1]
		LDR R2, =temp
		STR R1, [R2]			//temp = first
nextNode:
		
		LDR R3, [R2]			// Dereference Address stored in temp
		CMP R3, #0			    // LIST IS EMPTY IF == 0
		BEQ endTraverse
		LDR R1, [R3]
		BL putstring			// PRINT TEMP
		LDR R3, [R3, #4]		// LOAD R3 with temp->link
		STR R3, [R2]			// temp = temp->link
		B nextNode
		
		
endTraverse:

		pop {r4-r11, lr}
		BX lr
		
endLab20:

		LDR R1, =szTwo
		BL putstring

		MOV R7, #1
		SVC 0
		
		
		
		