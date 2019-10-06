	AREA prog1, CODE, READONLY
	ENTRY

	MOV r0, #0x11  ;Load initial Value 
	LSL r1, r0, #1 ;Shift 1 bit left
	ADD r2, r1, r1, LSL #2
	
	stop B stop    ;stop program
	END