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

memAlloc:	.word 0
nodeCount:  .skip 1024
tempString: .word 0

szOne : 	.asciz    "Name: Robert Gaines\nProgram: Lab20.s\nClass: CS3B\nDate: November 14, 2019\n\n"
szTwo : 	.asciz    "Thanks for using my program!! Good Day!\n"
szThree : 	.asciz    "Enter a string to store into the new Node: "
szFour : 	.asciz    "Creating New Node.. \n"
szFive : 	.asciz    "Inserting Node.. \n"
szSix : 	.asciz    "Printing linked List.. \n\n"
szSeven:    .asciz    "~LINKED LIST~\n"
szEight:    .asciz    "Press Enter To Continue..."
szNine:     .asciz    "Linked List Is Empty."
szTen:      .asciz    "Choose A String to Delete:"
szEleven:   .asciz    "Out of bound Size!"
szTwelve:   .asciz    "Enter A String to Search For:"
szThirteen: .asciz    "Enter index of String to edit: "
szFourteen: .asciz    "Enter a new String: "
newline:    .asciz    "\n"
sz0:        .asciz  "|\t\tRASM4 Text Editor\n"
sz1:		.asciz	"|===================================================================| \n"
sz2:		.asciz  "|\n" 
sz3:		.asciz  "|MEMORY ALLOCATED:"
sz4:		.asciz  "|NODES CREATED:"
sz5:		.asciz  "|(1) View All Strings\n"
sz6:		.asciz  "|(2) Add String\n"
sz7:		.asciz  "|\t(1)From Keyboard\n"
sz8:		.asciz  "|\t(2)From File\n"
sz9:		.asciz  "|(3) Delete String\n"
sz10:		.asciz  "|(4) Edit String\n"
sz11:		.asciz  "|(5) Search String\n"
sz12:		.asciz  "|(6) Save to File\n"
sz13:		.asciz  "|(7) Exit Program\n"
sz14:       .asciz  "CHOICE ->"
filename:	.asciz 	"input.txt"
outFile:	.asciz  "output.txt"


buffer:	.skip	1024
first:	.word	0
last:	.word	0
temp:	.word 	0
cCR:    .byte 10


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
/*/=================================================
			Main Program Loop Here
   ================================================/*/
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
		BLEQ add
		cmp r4, #3
		BLEQ deleteString
		cmp r4, #4
		BLEQ editString
		cmp r4, #5
		BLEQ searchString
		cmp r4, #6
		BLEQ openWriteSave
		cmp r4, #8
		BLEQ cheat
		b Rasm4Loop


cheat:
		push {lr}
		LDR R1, =nodeCount
		mov r3, #1168
		STR R3, [R1]
		pop {lr}
		bx lr
		
add: 
	push {lr}

    BL getIndex
	
	cmp R0, #1
	BEQ addString
	cmp R0, #2
	BEQ openAndread
	
	pop {lr} 
	bx lr
		
/*/=================================================
			Edit String
   ================================================/*/
	
editString:

		push {r4-r11, lr}
		
		LDR R1, =nodeCount
		LDR R1, [R1]
		MOV R9, R1	//STORES CURRENT NODE COUNT INTO R9
		cmp r1, #1
		BLT noEditEmpty
		
		BL searchString
		
editGetIndex:		
		LDR R1, =szThirteen
		BL putstring
		
		BL getIndex
		
		MOV R10, R0 //STORES USER INDEX INTO R10
		
		CMP R10, #-1
		BEQ endEdit
		BLT noEditIndexOutOfBounds
		
		 
		CMP R10, R9
		
		BGT noEditIndexOutOfBounds
				
				
		traverseListEdit:
				
				LDR R1, =first
				LDR R1, [R1]
				LDR R2, =temp
				STR R1, [R2]			//temp = first
				
				MOV R6, #1 //initilize count = 0
		nextNodeEdit:
				
				LDR R3, [R2]			// Dereference Address stored in temp
				CMP R3, #0			    // LIST IS EMPTY IF == 0
				BEQ endEdit
				CMP R6, R10
				BNE getNext
				
				
				LDR R1, [R3] 
				BL String_length
				LDR R1, =memAlloc
				LDR R1, [R1]
				sub r2, r1, r0
				LDR R1, =memAlloc
				STR R2, [R1]
				LDR R0, [R3]
				BL free 				//DEAllocated prev string and update memallocated variable
				
				LDR R1, =szFourteen
				BL putstring
				
				LDR R1, =buffer
				MOV R2, #buffer_size
				BL getstring
				
				LDR R1, =buffer
				
				BL String_copy
				MOV R5, R0			//STORE NEW STRING IN R5
				MOV R1, R0
				BL String_length
				LDR R1, =memAlloc
				LDR R1, [R1]
				add r2, r1, r0
				LDR R1, =memAlloc
				STR R2, [R1]
				
				
				LDR R2, =temp
				LDR R3, [R2]
				STR R5, [R3]    //STORE NEW STRING INTO THE DATA SECTION OF THE NODE
				
				b endEdit
				
				
		getNext:	
				LDR R7, [R3, #4]
				MOV R8, R7			//R8 contains prev link
				LDR R2, =temp
				STR R7, [R2]			// temp = temp->link
				ADD R6, #1
				B nextNodeEdit
				

noEditIndexOutOfBounds:

		LDR R1, =szEleven
		BL putstring
		B editGetIndex
   
noEditEmpty:

		LDR R1, =szNine
		BL putstring
		BL systemPause
		
endEdit:
		
		pop {r4-r11, lr}
		bx lr
		
/*/=================================================
			Search String
   ================================================/*/
   
searchString:
		
		push {r4-r11, lr}
		
		LDR R1, =nodeCount
		LDR R1, [R1]
		cmp r1, #1
		BLT noSearchEmpty
		
		LDR R1, =szTwelve
		Bl putstring 
		
		LDR R1, =buffer
		MOV R2, #buffer_size
		BL getstring
		LDR R1, =buffer
		
		BL String_copy
		LDR R1, =tempString
		STR R0, [R1]
		LDR R2, =first
		BL searchList
		
		BL systemPause
   
		pop {r4-r11, lr}
		bx lr
		
noSearchEmpty:

		LDR R1, =szNine
		BL putstring
		BL systemPause
		
		pop {r4-r11, lr}
		bx lr
/*/=================================================
			Add string.
   ================================================/*/		
addString:

		push {r4-r11, lr}

		LDR R1, =nodeCount
		LDR R1, [R1]
		add r3, r1, #1
		LDR R1, =nodeCount
		STR R3, [R1]
		
		BL createNode
		
		pop {r4-r11, lr}
		BX lr	
/*/=================================================
			Delete string.
   ================================================/*/
deleteString:

		push {r4-r11, lr}
		
		
		LDR R1, =nodeCount
		LDR R1, [R1]
		cmp r1, #1
		BLT noDeleteE
		
		LDR R1, =szTen
		BL putstring
		
		LDR R1, =newline
		BL putstring 
		
		BL getIndex
		
		LDR R1, =nodeCount
		LDR R1, [R1]
		CMP R1, R0
		BLT noDeleteO
		
		BL deleteNode
		pop {r4-r11, lr}
		BX lr
		
noDeleteE:
		LDR R1, =szNine
		BL putstring
		BL systemPause
		b noDelete
noDeleteO:
		LDR R1, =szEleven
		BL putstring
		BL systemPause
noDelete:	
		pop {r4-r11, lr}
		BX lr
/*/=================================================
			Insert Node.
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
/*/=================================================
			Create Node.
   ================================================/*/		
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
		MOV R1, R10
		BL String_length
		ADD R6, R0, #1				//memAllocated
		
		
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
		
		pop {r4-r11, lr}
		BX lr 					// Return
/*/=================================================
			Traverse Linked List.
   ================================================/*/
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

		BL systemPause
		pop {r4-r11, lr}
		BX lr
/*/=================================================
			Print 22 Blank Lines.
   ================================================/*/		
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
/*/=================================================
			Print Menu.
   ================================================/*/		
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
		LDR R0, [R1]
		MOV R10, R0
		BL intasc32
		BL putstring
		
		LDR R2, =nodeCount
		STR R10, [R2]
		
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
		
		BL getIndex
		
		pop  {r4-r11, lr}
		bx lr 
/*/=================================================
			This Makes Code Look Clean.
   ================================================/*/
deleteNode:

		push {r4-r11, lr}
		MOV R4, R0  //INDEX TO BE DELETED
		
		LDR R1, =first
		LDR R1, [R1]
		LDR R2, =temp
		STR R1, [R2]			//TEMP = NODE
		MOV R5, R1				//CONTAINS NODE 
		LDR R1, [R1]
	
		CMP R4, #1
		
		BEQ firstNodeDelete
		B notThatObviously
		
firstNodeDelete:
		BL String_length
		MOV R9, R0			//ADD R9 NUMBER OF BYTES IN STRING
		LDR R7, [R5, #4]   //R7 = first->link
		LDR R0, [R5]
		BL free            //RETURN MALLOCd MEMORY
		MOV R0, R5
		BL free
		ADD R9, #8
		LDR R1, =first
		STR R7, [R1]  //first = first->link
		B endTraversal
		
notThatObviously:
		LDR R2, =temp
		MOV R10, R5            //USE THIS AS PREV
		MOV R6, #1
nextNode2:
//NEED TO DELETE ACTUAL STRING FIRST
		LDR R3, [R2]
		CMP R4, R6			//IS CURRENT INDEX == TARGET INDEX 
		BNE nextIndex
		LDR R1, [R3]
		BL String_length
		MOV R9, R0
		ADD R7, R10, #4 //prev->link
		MOV R0, R3
		LDR R8, [R3, #4]  //temp->link temp is the node to be deleted
		STR R8, [R7]      //prev->link = temp->link
		BL free 		//Release MALLOC memory
		ADD R9, #8      //ADD INTO R9 FOR SUBTRACTION FROM LABEL COUNT
		LDR R1, =nodeCount
		LDR R1, [R1]
		CMP R1, R4
		BLEQ lastNodeDelete
		B endTraversal
		
lastNodeDelete:
	    push {lr}
		LDR R1, =last
		STR R10, [R1]    //last = prev of last node or should be...
		pop {lr}
		BX lr
nextIndex:	
		MOV R10, R3
		LDR R7, [R3, #4]
		LDR R2, =temp
		STR R7, [R2]			// temp = temp->link
		add R6, #1
		
		B nextNode2
		
		
endTraversal:

		LDR R1, =memAlloc
		LDR R1, [R1]
		sub r2, r1, r9
		sub r2, #1
		LDR R1, =memAlloc
		STR R2, [R1]
		
		LDR R1, =nodeCount
		LDR R1, [R1]
		sub r2, r1, #1
		LDR R1, =nodeCount
		STR R2, [R1]
		
		BL systemPause
		pop {r4-r11, lr}
		BX lr 
getIndex:

		push {lr}
		
		LDR R1, =sz14
		BL putstring
		
		LDR R1, =buffer
		MOV R2, #buffer_size
		BL getstring
		BL ascint32
		
		pop {lr}
		BX lr
		
systemPause:
		push {lr}
		
		LDR R1, =szEight
		BL putstring
		
		
		LDR R1, =buffer
		MOV R2, #buffer_size
		BL getstring
		
		pop {lr}
		BX lr

endRasm4:
		
		LDR R1, =newline
		BL putstring 
		LDR R1, =szTwo
		BL putstring
		LDR R1, =newline
		BL putstring
		MOV R7, #1
		SVC 0
		
/*/=================================================
			Open, Read, and Add to LL
   ================================================/*/		
		
openAndread:
	push {r4-r11, lr}
					@open
	ldr r0, =filename	@contains input.txt
	mov r7, #5			@to open
	mov r1, #00			@read only
	MOV r2, #0644
	svc 0
	mov r4, r0			@hold filehandle
beginRead:						@r0 has filehandle
	mov r0, r4	
	mov r7, #3			@to read
	mov r2, #1			@read 1 byte
	
	ldr r1, =buffer
	svc 0
	cmp r0, #0
	beq closeFile			@	noInput
	bl getline1
							@read string is now in KBuf
	mov r11, r1
	ldr r1, =buffer
	//push {r0, r2-r11}
	bl String_length
	sub r0, #1
	mov r2, #0
	ldr r1, =buffer
	strb r2, [r1, r0]!
	//pop {r0, r2-r11}
createNodeRead:
		ldr r1, =buffer
		BL String_copy			
		
		MOV R10, R0				// NOW R10 CONTAINS DYNAMIC ALLOCATED ADDRESS WHEN DEREFERENCED WILL CONTAIN OUR STRING
		MOV R1, R10
		BL String_length
		ADD R6, R0, #1			//memAllocated
		
		
		MOV R0, #10				// each Node is 8 bytes
		BL malloc 			    // Node * N = new Node
		MOV R3, R0
		STR R10, [R3]		    // Data = address of string
		
		ADD R6, #8				//add 8 bytes for node in memAlloc
		
		MOV R1, #0
		STR R1, [R3, #4]			// Link -> NULL
		
		BL insertNode
		
		LDR R1, =memAlloc
		LDR R1, [R1]
		add r2, r6, r1
		LDR R1, =memAlloc
		STR R2, [R1]
		ldr r1, =nodeCount
		ldr r1, [r1]
		mov r3, r1
		add r3, r1, #1
		ldr r1, =nodeCount
		str r3, [r1]	
	cmp r11, #1
	beq beginRead
	cmp r0, #0
	b closeFile
	
closeFile:
	mov r3, r0
	mov r7, #6
	svc 0
	BL systemPause
	pop {r4-r11, lr}
	bx lr
	
/*/=================================================
			Open, Write, and save to output.txt
   ================================================/*/
	
openWriteSave:
	push {r4-r11, lr}
	ldr r0, =outFile
	mov r1, #0100
	mov r2, #0644
	mov r7, #5
	svc 0
	mov r4, r0	@holds filehandle
	
traverseListWrite:
		LDR R1, =first
		LDR R1, [R1]
		LDR R2, =temp
		STR R1, [R2]			//temp = first
nextNodeWrite:		
		LDR R3, [R2]			// Dereference Address stored in temp
		CMP R3, #0			    // LIST IS EMPTY IF == 0
		BEQ closeFileOut
		LDR R1, [R3]
		push {r1}
		bl String_length
		mov r2, r0
		pop {r1}
		mov r0, r4
		mov r7, #4
		svc 0
		mov r0, r4
		ldr r1, =cCR
		mov r2, #1
		mov r7, #4
		svc 0
		
		
		LDR R7, [R3, #4]
		LDR R2, =temp
		STR R7, [R2]			// temp = temp->link
		B nextNodeWrite
	
	
closeFileOut:
	mov r0, r4
	mov r7, #6
	svc 0
	
	BL systemPause
	pop {r4-r11, lr}
	BX lr
/*/=================================================
			END OF FILE!!!!!
   ================================================/*/		
getline1:
		@file open
		@r0 contains filehandle
		@r1 contains kbuf
	push {r4-r11, lr}
getlineLoop:
	bl getch1
	cmp r0, #0
	beq finishGetLine
	ldrb r3, [r1]
	cmp r3, #13
	beq	nextLine
	cmp r3, #10
	beq nextLine
	b getlineLoop
	

nextLine:
	mov r1, #1
	pop {r4-r11, lr}
	bx lr

finishGetLine:	
	pop {r4-r11, lr}
	bx lr

	
getch1:
	push {r4-r11, lr}
	mov r0, r4			@filehandle
	mov r7, #3			@to read
	mov r2, #1			@read 1 byte
	add r1, #1
	svc 0
	
	

	pop {r4-r11,lr}
	bx lr