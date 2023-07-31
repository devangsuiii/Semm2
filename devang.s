.global _start
_start:
	// Step 1: Store decimal 15 in register R5
	MOV R5, #15
	
	// Step 2: Compare the values in R0 and R1
	CMP R0, R1
	
	// Step 3: If R0 is greater than R1, perform two logical left shifts on register R5 and then terminate the program
	BGT greater
	
	// Step 4: If R0 is less than R1, perform one logical right shift on register R5 and then terminate the program
	BLT lesser
	
	// Step 5: If R0 is equal to R1, perform one right rotation on register R5 and then terminate the program
	BAL equal
	
	// Terminate the program
	BAL end
	
greater:
	// Step 3: R0 > R1
	// Perform two logical left shifts on register R5
	LSL R5, R5, #2
	BAL end
	
lesser:
	// Step 4: R0 < R1
	// Perform one logical right shift on register R5
	LSR R5, R5, #1    	// R5 =R5 >> 1
	BAL end			// Jump to the end label
	
equal:
	// Step 5: R0 == R1
	// Perform one right rotation on register R5
	MOV R5, R3, ROR #1 // R3 = R5 rotated right
	MOV R5, R3         // R5 = R3 (move result back to R5)
	BAL end	           // Jump to the end label
	
end:
	// Program termination
	MOV R7, #1       // SYS_exit (system call number for exit)
	SWI 0            // Make a system call to terminate the program
