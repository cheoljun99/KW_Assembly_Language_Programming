	AREA ARMex, CODE,READONLY
		ENTRY

Main
		LDR r0, Address1;saving 0x40000000 to r0
		mov r1,#1;1!
		mov r2, r1,lsl#1;2!
		add r3,r2,r2,lsl #1;3!
		mov r4,r3,lsl #2;4!
		add r5,r4,r4, lsl#2;5!
		add r6,r5,r5, lsl #2;5*5!
		add r6,r6,r5;5*5!+5!=6!
		rsb r7,r6,r6, lsl #3;7!
		mov r8,r7,lsl #3;8!
		add r9,r8,r8, lsl #3;9!
		add r10,r9,r9, lsl #3;9*9!
		add r10,r10,r9;9*9!+9!=10!
		
		str r1,[r0],#4;saving r0's value to memory 
		str r2,[r0],#4;saving r0's value to memory 
		str r3,[r0],#4;saving r0's value to memory 
		str r4,[r0],#4;saving r0's value to memory 
		str r5,[r0],#4;saving r0's value to memory 
		str r6,[r0],#4;saving r0's value to memory 
		str r7,[r0],#4;saving r0's value to memory
		str r8,[r0],#4;saving r0's value to memory 
		str r9,[r0],#4;saving r0's value to memory 
		str r10,[r0]  ;saving r0's value to memory 
		
Address1 DCD &40000000; 0x40000000 is saved to Addressl	
		MOV pc,lr
		END; Mark end of file