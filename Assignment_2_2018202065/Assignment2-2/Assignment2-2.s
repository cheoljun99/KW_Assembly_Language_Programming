	AREA ARMex, CODE, READONLY
			ENTRY
		
Main
		LDR r0, =Array;saving Array's address
		LDR r1, Addressl;saving 0x40000000 to r1
		
		ADD r1, r1, #9 ;memory's address that saved in TEMPADDR1 is added by 9 and saved to r1
		LDRB r2,[r0],#1;saving to 10 from Array
		STRB r2,[r1],#1;saving 10 to memory
		LDR r1, Addressl;saving 0x40000000 to r1
		
		ADD r1, r1, #8;memory's address that saved in TEMPADDR1 is added by 8 and saved to r1
		LDRB r2,[r0],#1;saving to 9 from Array
		STRB r2,[r1],#1;saving 9 to memory
		LDR r1, Addressl;saving 0x40000000 to r1
		
		ADD r1, r1, #7;memory's address that saved in TEMPADDR1 is added by 7 and saved to r1
		LDRB r2,[r0],#1;saving to 8 from Array
		STRB r2,[r1],#1;saving 8 to memory
		LDR r1, Addressl;saving 0x40000000 to r1
		
		ADD r1, r1, #6;memory's address that saved in TEMPADDR1 is added by 6 and saved to r1
		LDRB r2,[r0],#1;saving to 7 from Array
		STRB r2,[r1],#1;saving 7 to memory
		LDR r1, Addressl;saving 0x40000000 to r1
		
		ADD r1, r1, #5;memory's address that saved in TEMPADDR1 is added by 5 and saved to r1
		LDRB r2,[r0],#1;saving to 6 from Array
		STRB r2,[r1],#1;saving 6 to memory
		LDR r1, Addressl;saving 0x40000000 to r1
		
		ADD r1, r1, #4;memory's address that saved in TEMPADDR1 is added by 4 and saved to r1
		LDRB r2,[r0],#1;saving to 5 from Array
		STRB r2,[r1],#1;saving 5 to memory
		LDR r1, Addressl;saving 0x40000000 to r1
		
		ADD r1, r1, #3;memory's address that saved in TEMPADDR1 is added by 3 and saved to r1
		LDRB r2,[r0],#1;saving to 4 from Array
		STRB r2,[r1],#1;saving 4 to memory
		LDR r1, Addressl;saving 0x40000000 to r1
		
		ADD r1, r1, #2;memory's address that saved in TEMPADDR1 is added by 2 and saved to r1
		LDRB r2,[r0],#1;saving to 3 from Array
		STRB r2,[r1],#1;saving 3 to memory
		LDR r1, Addressl;saving 0x40000000 to r1
		
		ADD r1, r1, #1;memory's address that saved in TEMPADDR1 is added by 1 and saved to r1
		LDRB r2,[r0],#1;saving to 2 from Array
		STRB r2,[r1],#1;saving 2 to memory
		LDR r1, Addressl;saving 0x40000000 to r1
		
		ADD r1, r1, #0;memory's address that saved in TEMPADDR1 is added by 0 and saved to r1
		LDRB r2,[r0],#1;saving to 1 from Array
		STRB r2,[r1],#1;saving 1 to memory
		LDR r1, Addressl;saving 0x40000000 to r1

Array DCB 10,9,8,7,6,5,4,3,2,1;saving 10,9,8,7,6,5,4,3,2,1 to Array
	
Addressl DCD &40000000; 0x40000000 is saved to Addressl
		MOV pc,lr
		END; Mark end of file