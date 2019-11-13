/***********************************************
	  =RASM4 Linked List =
	  
	Programmer: Robert Gaines
	Class: CS 3B Assembly Language
	Date:  Nov. 14th 2019

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
RASM4 SHOW SUPREME SUPREMECY OVER MEMORY AND POINTERS

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
newline:    .asciz    "\n"
sz0:        .asciz  "\tRASM4 Text Editor"
sz1:		.asciz	"|===================================================================|\n"
sz2:		.asciz  "|\n" 
sz3:		.asciz  "|MEMORY ALLOCATED:"
sz4:		.asciz  "|NODES CREATED:"
sz5:		.asciz  "|(1) View All Strings\n"
sz6:		.asciz  "|(2) Add String\n"
sz7:		.asciz  "|\t(a)From Keyboard\n"
sz8:		.asciz  "|\t(b)From File\n"
sz9:		.asciz  "|(3) Delete String\n"


buffer:	.skip	1024
first:	.word	0
last:	.word	0
temp:	.word 	0

.text		
		.global _start
		.equ	buffer_size,1024
		
_start:
		BL printMenu
		b endLab20
//~============================================~//		
insertNode:
		
		push {r4-r11, lr}
		
		LDR R1, =first
		LDR R2, =last
		
		LDR R3, [R1]
		CMP R3, #0
		
		BLEQ insert_first		//if(first == null){first-> Node; last-> Node;}
		BLNE insert_last
		
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
		LDR R2, [R2]
		STR R0, [R2, #4]			//last->link = newNode
		LDR R2, =last
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
		
		MOV R0, #10				// each Node is 8 bytes
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
		BL putstring		// PRINT TEMP
		
		LDR R1, =newline
		BL putstring
		
		LDR R7, [R3, #4]
		//LDR R3, [R2, #4]		// LOAD R3 with temp->link
		LDR R2, =temp
		STR R7, [R2]			// temp = temp->link
		B nextNode
		
		
endTraverse:

		pop {r4-r11, lr}
		BX lr
		
printMenu:

		push {r4-r11, lr}
		
		LDR R1, =sz1
		BL putstring
		
		LDR R1, =sz2		//NEWLINE W BAR |
		BL putstring
		
		LDR R1, =sz0
		BL putstring
		
		LDR R1, =sz2
		BL putstring
		
		LDR R1, =sz3
		BL putstring
		
		LDR R1, =sz4
		BL putstring
		
		LDR R1, =sz2
		BL putstring
		
		LDR R1, =sz5
		BL putstring
		
		LDR R1, =sz2
		BL putstring
		
		LDR R1, =sz6
		BL putstring
		
		LDR R1, =sz7
		BL putstring
		
		LDR R1, =sz8
		BL putstring
		
		LDR R1, =sz2
		BL putstring
		
		LDR R1, =sz9
		BL putstring
		
		LDR R1, =sz2
		BL putstring
		
		LDR R1, =sz1
		BL putstring
		
		pop  {r4-r11, lr}
		
endLab20:
		
		LDR R1, =newline
		BL putstring 
		LDR R1, =szTwo
		BL putstring
		LDR R1, =newline
		BL putstring
		MOV R7, #1
		SVC 0
		
		
		
		