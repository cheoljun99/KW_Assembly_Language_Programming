	AREA ARMex, CODE, READONLY
		ENTRY
		
Main
		LDR r0, =C_string1;saving "Hello",0's address
		LDR r2, Addressl
		
Loop	
		LDRB r1,[r0],#1;saving one word from Array
		STRB r1,[r2],#1;saving one word to memory
		cmp r1,#0;checking NULL 
		beq Endline;if find null, go to Endline branch
		bne Loop; if is not null, go to Loop branch for looping
		
Endline
		MOV pc,lr
C_string1 DCB "Hello world !!!",0 ;saving "Hello",0 to C_string1
	
Addressl DCD &40000000 ; 0x40000000 is saved to Addressl
		END; Mark end of file