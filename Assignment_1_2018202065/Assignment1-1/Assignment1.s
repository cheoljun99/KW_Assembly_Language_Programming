	AREA ARMex, CODE, READONLY
		ENTRY
		
start
		MOV r0, #9; 9 is located to r0
		MOV r1, #12; 12 is located to r1
		MOV r2, #10; 10 is located to r2
		
		LDR r3, TEMPADDR1; memory's address that saved in TEMPADDR1 is located to r3
		STRB r0, [r3], #1; r0's value is saved to r3's memory by 1 byte unit
		STRB r1, [r3], #1; r1's value is saved to r3's memory by 1 byte unit
		STRB r2, [r3], #1; r2's value is saved to r3's memory by 1 byte unit
		LDR r3, TEMPADDR1; momory's address is located to r3
		LDRB r4, [r3], #1; momory's first value is saved to r4
		mov r6, #0x0A ; 10 is located to r6
		cmp r4,r6 ;compare(r4 - r6)
		MOVMI r5, #2; move 2 into r5 if r4<r6
		MOVGT r5, #1; move 1 into r5 if r4>r6
		MOVEQ r5, #3; move 3 into r5 if r4=r6
		LDRB r4, [r3], #1; momory's second value is saved to r4
		cmp r4,r6 ;compare(r4 - r6)
		MOVMI r5, #2; move 2 into r5 if r4<r6
		MOVGT r5, #1; move 1 into r5 if r4>r6
		MOVEQ r5, #3; move 3 into r5 if r4=r6
		LDRB r4, [r3], #1 ; momory's second value is saved to r4
		cmp r4,r6 ;compare(r4 - r6)
		MOVMI r5, #2; move 2 into r5 if r4<r6
		MOVGT r5, #1; move 1 into r5 if r4>r6
		MOVEQ r5, #3; move 3 into r5 if r4=r6
		
TEMPADDR1 & &40000000 ; 0x40000000 is saved to TEMPADDR1
		MOV pc,lr
		END; Mark end of file