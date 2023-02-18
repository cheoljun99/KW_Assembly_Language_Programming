	AREA ARMex, CODE, READONLY
		ENTRY
		
Main
		LDR r8, Addressl;saving 0x40000000 to r8
		MOV r0, #1; r0=1 1 is located to r0 
		MOV r1, r0, LSL #1;r1=2 2 is located to r1 using LSL operator 
		MOV r2, r1, LSL #1; r2=4 4 is located to r2 using LSL operator
		MOV r3, r2, LSL #1; r3=8 8 is located to r3 using LSL operator
		ADD r5,r1,r3; r5=10 10 is located to r5 using ADD operator
		
		ADD r6,r5,r5; r6=20 20 is located to r6 using ADD operator. it is (n+10)
		MUL r7,r6,r5; r7=200 200 is located to r7 using MUL opearator. it is n(n+10)
		
		STR r7,[r8] ;saving r7's value to memory 
		
		
Addressl DCD &40000000; 0x40000000 is saved to Addressl
		MOV pc,lr
		END; Mark end of file