/*
Author: Bobby Gaines
Program: RASM5
Function: Insertion Sort
Inputs: R0 will contain address to int array, R1 will be size of Array
Output: Void
*/

.data

iArray: .skip 800000
number:  .word 0



.text 

	.global iSortA

iSortA:

	push {r0, r1, lr}
	
	mov r4, r0
	mov r6, r1 				// keep count in r6 
	//ldr r4, =iArray
	//str r0, [r4]
	
	//add r0, r4, r6, LSL #2 	// r0 <- &array[4*count] 
	//str r1, [r0] 			// array[4*count] <- number 
	//add r6, r6, #1 			// count = count + 1
	
	MOV R0, R4
	MOV R1, R6

	mov r2, #1 				// i = 1 
iloop: 						// for-loop as while loop 
	cmp r2, r1 				// i - n 
	bge iloopend 			// i >= n => loopend

	LDR r10, [ r0, r2, LSL #2] // temp = &array[4*i] 
	sub r3, r2, #1
	
jloop:  
	cmp r3, #0 
	blt jloopend 
	ldr r9, [r0, r3, LSL #2]	// r9 <- &array[4*j]  		
	cmp r10, r9 			// temp < array[4*j] ? 
	bge jloopend 
	add r8, r0, r3, LSL #2 
	add r8, r8, #4 			// r8 <- &array[4*(j+1)] 
	str r9, [r8] 			// a[j+1] <- a[j] 
	sub r3, r3, #1 			// j <- j - 1 
    b jloop 				// end jloop 
jloopend: 
	add r3, r3, #1  		// j <- j+1 
	ldr r8, [r0, r3, LSL #2]  // r8 <- &array[4*(j+1)] 
	mov r8, r10			// a[j+1] <- temp 
	add r2, r2, #1  		//i++ 
	b iloop
iloopend: 

	pop {r0, r1, lr}
	bx lr
	
	