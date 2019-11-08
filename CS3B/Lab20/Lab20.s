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

buffer:	.skip	1024
first:	.word	0
last:	.word	0
temp:	.word 	0

szOne : .asciz    "Name: Robert Gaines\nProgram: Lab20.s\nClass: CS3B\nDate: November 14, 2019\n\n"
szTwo : .asciz    "Thanks for using my program!! Good Day!\n"

		.equ	buffer_size,	1024
		.global Lab20
		
Lab20:
		LDR R1, =szOne
		BL putstring
		
		LDR R1, =szTwo
		BL putstring
		
		BL createNode
		BL insertNode
		BL createNode 
		BL insertNode
		
		BL traverseList
		
insertNode:
		
		push {lr}
		LDR R1, =first
		LDR R2, =last
		LDR R3, [R1]
		CMP R3, #0
		BEQ insert_first		//if(first == null){first-> Node; last-> Node;}
		BL insert_last
		pop {lr}
		BX LR					//return to 'main'
		
insert_first:
		
		push {lr}
		STR R0, [R1]			//first = Node
		STR R0, [R2]			//last = Node
		push {lr}
		BX lr
		
insert_last:
		
		push {lr}					
		STR R0, [R2, #4]			//last->link = newNode
		STR R0, [R2]				//last = newNode
		push {lr}
		BX lr
		
createNode:
		
		push {lr}
		LDR R1, =buffer
		LDR R2, #buff_size
		BL getstring
		BL String_copy			
		
		MOV R10, R0				// NOW R10 CONTAINS DYNAMIC ALLOCATED ADDRESS WHEN DEREFERENCED WILL CONTAIN OUR STRING
		
		MOV R0, #8				// each Node is 8 bytes
		BL malloc 			    // Node * N = new Node
		MOV R3, R0
		STR R10, [R3]		    // Data = address of string
		
		MOV R1, #0
		STR R1, [R3, #4]			// Link -> NULL
		
		pop {lr}
		BX lr 					// Return

traverseList:

		push {lr}
		LDR R1, =first
		LDR R1, [R1]
		LDR R2, =temp
		STR R1, [R2]			//temp = first
nextNode:
		
		LDR R3, [R2]			// Dereference Address stored in temp
		CMP R3, #0			    // LIST IS EMPTY IF == 0
		BEQ endTraverse
		MOV R1, R2
		BL putstring			// PRINT TEMP
		LDR R3, [R2, #4]
		STR R3, [R2]			// temp = temp->link
		B nextNode
		
		
endTraverse:

		pop {lr}
		BX lr
		
		
		
		
		
		