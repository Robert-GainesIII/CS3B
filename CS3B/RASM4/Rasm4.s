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
szEight:    .asciz    "Press Enter To Continue..."
newline:    .asciz    "\n"
sz0:        .asciz  "|\t\tRASM4 Text Editor\n"
sz1:		.asciz	"|===================================================================| \n"
sz2:		.asciz  "|\n" 
sz3:		.asciz  "|MEMORY ALLOCATED:"
sz4:		.asciz  "|NODES CREATED:"
sz5:		.asciz  "|(1) View All Strings\n"
sz6:		.asciz  "|(2) Add String\n"
sz7:		.asciz  "|\t(a)From Keyboard\n"
sz8:		.asciz  "|\t(b)From File\n"
sz9:		.asciz  "|(3) Delete String\n"
sz10:		.asciz  "|(4) Edit String\n"
sz11:		.asciz  "|(5) Search String\n"
sz12:		.asciz  "|(6) Save to File\n"
sz13:		.asciz  "|(7) Exit Program\n"
sz14:       .asciz  "CHOICE ->"


buffer:	.skip	1024
first:	.word	0
last:	.word	0
temp:	.word 	0

memAlloc:	.word 0
nodeCount:  .word 0


.text		
		.global _start
		.equ	buffer_size,1024
		
_start:
		LDR R1, =memAlloc
		MOV R2, #0
		STR R2, [R1]
		
		LDR R1, =nodeCount
		MOV R2, #0
		STR R2, [R1]
Rasm4Loop:		
		BL printMenu
		
		LDR R1, =buffer
		bl ascint32
		mov R4, R0
		cmp r4, #7
		beq endRasm4
		cmp r4, #1
		BLEQ traverseList
		cmp r4, #2
		BLEQ createNode
		b Rasm4Loop
/*/=================================================


			This Makes Code Look Clean.


   ================================================/*/	
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
		LDR R1, [R10]
		BL String_length
		MOV R6, R0				//memAllocated
		
		
		MOV R0, #10				// each Node is 8 bytes
		BL malloc 			    // Node * N = new Node
		MOV R3, R0
		STR R10, [R3]		    // Data = address of string
		
		ADD R6, #8				//add 8 bytes for node in memAlloc
		
		MOV R1, #0
		STR R1, [R3, #4]			// Link -> NULL
		
		LDR R1, =szFive
		BL putstring
		
		BL insertNode
		
		LDR R1, =memAlloc
		LDR R1, [R1]
		add r2, r6, r1
		LDR R1, =memAlloc
		STR R2, [R1]
		
		LDR R1, =nodeCount
		LDR R1, [R1]
		add r2, r1, #1
		LDR R1, =nodeCount
		STR R2, [R1]
		
		pop {r4-r11, lr}
		BX lr 					// Return

traverseList:

		push {r4-r11, lr}
		LDR R1, =szSix
		BL putstring
		LDR R1, =szSeven
		BL putstring
		
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

		LDR R1, =szEight
		BL putstring
		LDR R1, =buffer
		MOV R2, #buffer_size
		BL getstring
		pop {r4-r11, lr}
		BX lr
		
printNewScreen:
		push {r4-r11, lr}
		MOV R10, #22
		nsLoop:
		CMP R10, #0
		BEQ endNS
		LDR R1, =newline
		BL putstring
		SUB R10, #1
		b nsLoop
		endNS:
		pop {r4-r11, lr}
		bx lr
		
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
		
		LDR R1, =sz2
		BL putstring
		
		LDR R1, =sz2
		BL putstring
		
		LDR R1, =sz3
		BL putstring
		
		LDR R1, =memAlloc
		LDR R0, [R1]
		BL intasc32
		BL putstring
		
		LDR R2, =memAlloc
		STR R0, [R2]
		
		LDR R1, =newline
		BL putstring
		
		LDR R1, =sz4
		BL putstring
		
		LDR R1, =nodeCount
		//LDR R0, [R1]
		BL intasc32
		BL putstring
		
		LDR R2, =nodeCount
		STR R0, [R2]
		
		LDR R1, =newline
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
		
		LDR R1, =sz10
		BL putstring
		
		LDR R1, =sz2
		BL putstring
		
		LDR R1, =sz11
		BL putstring
		
		LDR R1, =sz2
		BL putstring
		
		LDR R1, =sz12
		BL putstring
		
		LDR R1, =sz2
		BL putstring
		
		LDR R1, =sz13
		BL putstring
		
		LDR R1, =sz2
		BL putstring
		
		LDR R1, =sz1
		BL putstring
		
		LDR R1, =newline
		BL putstring
		
		bl printNewScreen
		
		LDR R1, =sz14
		BL putstring
		
		
		LDR R1, =buffer
		MOV R2, #buffer_size
		BL getstring
		
		pop  {r4-r11, lr}
		bx lr 
		
endRasm4:
		
		LDR R1, =newline
		BL putstring 
		LDR R1, =szTwo
		BL putstring
		LDR R1, =newline
		BL putstring
		MOV R7, #1
		SVC 0
		
		
		
		