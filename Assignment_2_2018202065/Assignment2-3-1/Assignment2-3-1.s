	AREA ARMex, CODE, READONLY
		ENTRY
		
Main
		LDR r8, Addressl;saving 0x40000000 to r8
		MOV r0, #1; r0=1; 1 is located to r0 
		MOV r1, r0, LSL #1; r1=2 2 is located to r1 using LSL operator 
		MOV r2, r1, LSL #1; r2=4 4 is located to r2 using LSL operator
		MOV r3, r2, LSL #1; r3=8 8 is located to r3 using LSL operator
		MOV r4, r3, LSL #1; r4=16 16 is located to r4 using LSL operator 
		ADD r5,r1,r3; r5=10 10 is located to r5 using ADD operator
		ADD r5,r5,r0; r5=11 11 is located to r5 using ADD operator
		ADD r6,r4,r5; r6=27 27 is located to r6 using ADD operator
		ADD r6,r6,r1; r6=29 29 is located to r6 using ADD operator
		MOV r10, r5; r5's value is located to r10

Loop
		ADD r9,r5,r1; r5's value is increased by 2 and saved to r9 
		ADD r10,r10,r9; r10 is added by r9 and saved to oneself
		MOV r5,r9; r5 is changed to r9 because for the next calculation 
		CMP r9,r6; if r9 is 29, end Loop
		BEQ Equal; if CMP is same, go to Equal
		B Loop; if CMP is not same, go to Equal

Equal
		STR r10,[r8] ;saving r10's value to memory 
		MOV pc,lr
		
Addressl DCD &40000000; 0x40000000 is saved to Addressl
		END ; Mark end of file