	AREA blockData, CODE, READONLY
		ENTRY

main


		MOV r0, #10;saving 10 to r0 
		mov r1, #11;saving 11 to r1  
		mov r2, #12;saving 12 to r2 
		mov r3, #13;saving 13 to r3 
		mov r4, #14;saving 14 to r4 
		mov r5, #15;saving 15 to r5 
		mov r6, #16;saving 16 to r6 
		mov r7, #17;saving 17 to r7 
		mov r10,#160;saving 160 to r10 
		LDR r8, TEMPADDR1;saving 0x40000000 to r8		
		;STMFA r8,{r0-r7};saving r0~r7 to memory using stack by Full ascending way
		
		b doRegister; go to doRegister
		
		

doRegister
		STMFA r8,{r0-r7};saving r0~r7 to memory using stack by Full ascending way
		add r0, r0, #0;adding r0+0 and saving to r0
		add r1, r1, #1;adding r1+1 and saving to r1
		add r2, r2, #2;adding r2+2 and saving to r2
		add r3, r3, #3;adding r3+3 and saving to r3
		add r4, r4, #4;adding r4+4 and saving to r4
		add r5, r5, #5;adding r5+5 and saving to r5
		add r6, r6, #6;adding r6+6 and saving to r6
		add r7, r7, #7;adding r7+7 and saving to r7
		mov r9,r0;saving r0 to r9
		add r9,r9,r1;saving r1+r9 to r9
		add r9,r9,r2; saving r2+r9 to r9
		add r9,r9,r3; saving r3+r9 to r9
		add r9,r9,r4; saving r4+r9 to r9
		add r9,r9,r5; saving r5+r9 to r9
		add r9,r9,r6; saving r6+r9 to r9
		add r9,r9,r7; saving r7+r9 to r9
		
doGCD
		cmp r9,r10;comparing r9 and r10
		MOVEQ r11,r9;if same, saving r9 to r11
		BEQ store;if same, go to store
		SUBHI r9,r9,r10;if r9 is bigger than r10, r9-10 is saved to r9
		SUBCC r10,r10,r9;if r10 is bigger than r9, r10-r9 is saved to r10
		BNE doGCD; if not same, go to doGCD

		
		

store
		LDR r8, TEMPADDR1;saving 0x40000000 to r8	
		STR r11,[r8],#4 ;saving r11 to memory
		
		
		LDR r12,[r8],#4;reading and saving 0x40000004's value to r12
		ADD r0,r0,r12;saving r12+r0 to r0
		
		LDR r12,[r8],#4;reading and saving 0x40000008's value to r12
		ADD r1,r1,r12;saving r12+r1 to r1
		
		LDR r12,[r8],#4;reading and saving 0x4000000C's value to r12
		ADD r2,r2,r12;saving r12+r2 to r2
		
		LDR r12,[r8],#4;reading and saving 0x40000010's value to r12
		ADD r3,r3,r12;saving r12+r3 to r3
		
		LDR r12,[r8],#4;reading and saving 0x40000014's value to r12
		ADD r4,r4,r12;saving r12+r4 to r4
		
		LDR r12,[r8],#4;reading and saving 0x40000018's value to r12
		ADD r5,r5,r12;saving r12+r5 to r5
		
		LDR r12,[r8],#4;reading and saving 0x4000001C's value to r12
		ADD r6,r6,r12;saving r12+r6 to r6
		
		LDR r12,[r8],#4;reading and saving 0x40000020's value to r12
		ADD r7,r7,r12;saving r12+r7 to r7
		
		LDR r8, TEMPADDR1;saving 0x40000000 to r8
		STMFA r8,{r0-r7};saving r0~r7 to memory using stack by Full ascending way
		
TEMPADDR1 & &40000000;0x40000000 is saved to TEMPADDR1	
		MOV pc,lr
		END; Mark end of file