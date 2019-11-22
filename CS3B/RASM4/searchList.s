/*/=================================================


			Search string
			R1 contains string to be searched for
			R2 contains first pointer
			Prints out every string that equals or contains the search string.

   ================================================/*/
.data
semiColon: .asciz ": "
temp:      .word 0
newline:   .asciz "\n"
   
   
.text 
   
	.global searchList
		
searchList:

		push {r4- r11, lr}
		LDR R1, [R1]
		BL String_toUpper
		MOV R8, R1				//Store toUpperd search string in R8
		

		LDR R1, [R2]			//Saves and dereferences the first pointer
		LDR R2, =temp
		STR R1, [R2]			//temp = first
		
		MOV R10, #1
		
nextNode:
		
		LDR R3, [R2]			// Dereference Address stored in temp
		CMP R3, #0			    // LIST IS EMPTY IF == 0
		BEQ endSearchList
		LDR R1, [R3]
		BL String_toUpper
		MOV R2, R8
		BL String_indexOf_3
		CMP R0, #-1
		BEQ notThisOne
		
		MOV R0, R10
		BL intasc32
		BL putstring
		
		LDR R1, =semiColon
		BL putstring
		
		LDR R1, [R3]
		BL putstring		// PRINT TEMP
		
		LDR R1, =newline
		BL putstring

notThisOne:		
		LDR R7, [R3, #4]
		//LDR R3, [R2, #4]		// LOAD R3 with temp->link
		LDR R2, =temp
		STR R7, [R2]			// temp = temp->link
		ADD R10, #1
		B nextNode
			


endSearchList:		
		pop {r4- r11, lr}
		bx lr