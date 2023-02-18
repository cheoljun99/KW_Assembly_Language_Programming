	AREA ARMex, CODE, READONLY
		ENTRY
		
start
		MOV r0, #1; 1 is located to r0
		MOV r1, #2; 2 is located to r1
		MOV r3, #3; 3 is located to r3
		MOV r4, #4; 4 is located to r4
		LDR r2, TEMPADDR1; memory's address that saved in TEMPADDR1 is located to r2
		STRB r0, [r2], #1; r0's value is saved to r2's memory by 1 byte unit
		STRB r1, [r2], #1; r1's value is saved to r3's memory by 1 byte unit
		STRB r3, [r2], #1; r3's value is saved to r3's memory by 1 byte unit
		STRB r4, [r2], #1; r4's value is saved to r3's memory by 1 byte unit
		LDR r2, TEMPADDR1; memory's address that saved in TEMPADDR1 is located to r2
		LDR r5, [r2] ; memory's value is saved to r5 by 32 byte unit
 		STRB r4, [r2], #1; r4's value is saved to r2's memory by 1 byte unit 
		STRB r3, [r2], #1; r3's value is saved to r3's memory by 1 byte unit
		STRB r1, [r2], #1; r1's value is saved to r3's memory by 1 byte unit
		STRB r0, [r2], #1; r0's value is saved to r3's memory by 1 byte unit
		LDR r2, TEMPADDR1; memory's address that saved in TEMPADDR1 is located to r2
		LDR r6, [r2] ; memory's value is saved to r6 by 32 byte unit

TEMPADDR1 & &40000000; 0x40000000 is saved to TEMPADDR1
   		MOV pc,lr
		END; Mark end of file