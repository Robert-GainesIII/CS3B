/*
Author: Bobby Gaines
Program: RASM5
Function: Insertion Sort
Inputs: R0 will contain address to int array, R1 will be size of Array
Output: Void
*/

.data

iArray: .skip 800000



.text 

	.global iSortA

iSortA:

	push {r0, r1, lr}
	
	LDR r0, [R0] 
	MOV R6, R1

	mov r2, #1 				// i = 1 
iloop: 						// for-loop as while loop 
	cmp r2, r1 				// i - n 
	bge iloopend 			// i >= n => loopend

	add r10, r0, r2, LSL #2 // temp = &array[4*i] 
	ldr r10, [r10] 
	sub r3, r2, #1
	
jloop:  
	cmp r3, #0 
	blt jloopend 
	add r9, r0, r3, LSL #2 	// r9 <- &array[4*j] 
	ldr r9, [r9] 			// r9 <- array[4*j] 
	cmp r10, r9 			// temp < array[4*j] ? 
	bge jloopend 
	add r8, r0, r3, LSL #2 
	add r8, r8, #4 			// r8 <- &array[4*(j+1)] 
	str r9, [r8] 			// a[j+1] <- a[j] 
	sub r3, r3, #1 			// j <- j - 1 
    b jloop 				// end jloop 
jloopend: 
	add r3, r3, #1  		// j <- j+1 
	add r8, r0, r3, LSL #2  // r8 <- &array[4*(j+1)] 
	str r10, [r8]			// a[j+1] <- temp 
	add r2, r2, #1  		//i++ 
	b iloop
iloopend: 

	pop {r0, r1, lr}
	bx lr
	
	