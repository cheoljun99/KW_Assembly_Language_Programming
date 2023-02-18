	AREA ARMex, CODE, READONLY
		ENTRY
		
Main

		LDR r8, Addressl;saving 0x40000000 to r8
		MOV r0, #1; r0=1 1 is located to r0 
		MOV r1, r0, LSL #1; r1=2 2 is located to r1 using LSL operator 
		MOV r2, r1, LSL #1; r2=4 4 is located to r2 using LSL operator
		MOV r3, r2, LSL #1; r3=8 8 is located to r3 using LSL operator
		ADD r5,r1,r3; r5=10 10 is located to r5 using ADD operator
		ADD r5,r5,r0; r5=11 11 is located to r5 using ADD operator
		MOV r6,r5; r5's value is located to r10. r6 is register for Accumulation
		ADD r5,r5,r1; r5=13 13 is located to r5 using ADD operator
		ADD r6,r6,r5; r6=11+13=24 24 is located to r6 using ADD operator. it is process for Accumulation
		ADD r5,r5,r1; r5=15 15 is located to r5 using ADD operator
		ADD r6,r6,r5; r6=24+15=39 39 is located to r6 using ADD operator. it is process for Accumulation
		ADD r5,r5,r1; r5=17 17 is located to r5 using ADD operator
		ADD r6,r6,r5; r6=39+17=56 56 is located to r6 using ADD operator. it is process for Accumulation
		ADD r5,r5,r1; r5=19 19 is located to r5 using ADD operator
		ADD r6,r6,r5; r6=56+19=75 75 is located to r6 using ADD operator. it is process for Accumulation
		ADD r5,r5,r1; r5=21 21 is located to r5 using ADD operator
		ADD r6,r6,r5; r6=75+21=96 96 is located to r6 using ADD operator. it is process for Accumulation
		ADD r5,r5,r1; r5=23 23 is located to r5 using ADD operator
		ADD r6,r6,r5; r6=96+23=119 119 is located to r6 using ADD operator. it is process for Accumulation
		ADD r5,r5,r1; r5=25 25 is located to r5 using ADD operator
		ADD r6,r6,r5; r6=119+25=144 24 is located to r6 using ADD operator. it is process for Accumulation
		ADD r5,r5,r1; r5=27 27 is located to r5 using ADD operator
		ADD r6,r6,r5; r6=144+27=171 171 is located to r6 using ADD operator. it is process for Accumulation
		ADD r5,r5,r1; r5=29 29 is located to r5 using ADD operator
		ADD r6,r6,r5; r6=171+29=200 200 is located to r6 using ADD operator. it is process for Accumulation
		STR r6,[r8] ;saving r6's value to memory 
		
		
Addressl DCD &40000000; 0x40000000 is saved to Addressl
		MOV pc,lr
		END; Mark end of file