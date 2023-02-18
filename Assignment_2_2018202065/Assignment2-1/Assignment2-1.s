	AREA ARMex, CODE, READONLY
		ENTRY
		
Main
		LDR r0, =C_string1;saving "Hello",0's address
		LDR r1, =C_string2;saving "Hello",0's address
		LDR r4, Addressl;saving 0x40000000
		MOV r5, #0x0B;saving 0x0B to r5
		MOV r6, #0x0A;saving 0x0A to r5
Loop		
		LDRB r2,[r0],#1;saving one word from Array
		LDRB r3,[r1],#1;saving one word from Array
		CMP r2, r3;comparing two word
		BNE Notequal;if Not Equl, go to Notequal
		B Finish; if Equl, go to Finish
Notequal		
		STR r5,[r4];saving 0x0B to memory
		B Endline;go to Endline
		
Finish
		MOV r7, #0;saving 0 to r7
		CMP r2, r7;detecting Null number
		BEQ Equal;if Equal go to Equal
		B Loop; if Not Equal go to Loop
Equal
		STR r6,[r4]	;saving 0x0A to memory
		B Endline;go to Endline
Endline
		MOV pc,lr
C_string1 DCB "Hello",0 ;saving "Hello",0 to C_string1
C_string2 DCB "Hello",0;saving "Hello",0 to C_string2
	
Addressl DCD &40000000 ; 0x40000000 is saved to Addressl
		END; Mark end of file