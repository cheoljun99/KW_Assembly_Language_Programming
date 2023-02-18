	AREA ARMex, CODE,READONLY
		ENTRY

Main
		LDR r0, Address1;saving 0x40000000 to r0
		mov r1,#1;1!
		mov r2, r1,lsl #1;2!
		mov r3,#3
		mul r3,r2,r3;3!
		mov r4,#4
		mul r4,r3,r4;4!
		mov r5,#5
		mul r5,r4,r5;5!
		mov r6,#6
		mul r6,r5,r6;6!
		mov r7,#7
		mul r7,r6,r7;7!
		mov r8,#8
		mul r8,r7,r8;8!
		mov r9,#9
		mul r9,r8,r9;9!
		mov r10,#10
		mul r10,r9,r10;10!
		
		str r1,[r0],#4;saving r0's value to memory 
		str r2,[r0],#4;saving r0's value to memory 
		str r3,[r0],#4;saving r0's value to memory 
		str r4,[r0],#4;saving r0's value to memory 
		str r5,[r0],#4;saving r0's value to memory 
		str r6,[r0],#4;saving r0's value to memory 
		str r7,[r0],#4;saving r0's value to memory 
		str r8,[r0],#4;saving r0's value to memory 
		str r9,[r0],#4;saving r0's value to memory 
		str r10,[r0];saving r0's value to memory 
		
Address1 DCD &40000000; 0x40000000 is saved to Addressl	
		MOV pc,lr
		END; Mark end of file