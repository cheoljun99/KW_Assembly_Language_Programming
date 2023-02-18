	AREA blockData, CODE, READONLY
		ENTRY

start

		MOV r0, #0;saving 0 to r0
		mov r1, #1;saving 1 to r1
		mov r2, #2;saving 2 to r2
		mov r3, #3;saving 3 to r3
		mov r4, #4;saving 4 to r4
		mov r5, #5;saving 5 to r5
		mov r6, #6;saving 6 to r6
		mov r7, #7;saving 7 to r7
		
		
		LDR r8, TEMPADDR1;saving 0x40000000 to r8
		
		STMIA r8!,{r2};saving r2 to memory using to Store multiple registers
		STMIA r8!,{r0};saving r0 to memory using to Store multiple registers
		STMIA r8!,{r3};saving r3 to memory using to Store multiple registers
		STMIA r8!,{r5-r7};saving r5~r7 to memory using to Store multiple registers
		STMIA r8!,{r1};saving r1 to memory using to Store multiple registers
		STMIA r8!,{r4};saving r4 to memory using to Store multiple registers
		
		LDR r8, TEMPADDR1;saving 0x40000000 to r8
		LDMIA r8,{r0-r7};saving r0~r7 to memory using to Store multiple registers
		MOV pc, lr
	
TEMPADDR1 & &40000000;0x40000000 is saved to TEMPADDR1	
		END; Mark end of file
		