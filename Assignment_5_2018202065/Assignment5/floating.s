	AREA ARMex,CODE,READONLY
		ENTRY

floating_add_main

	LDR r0,=float1
	LDR r1,=float2
	ldr r2,[r0]
	ldr r3,[r1]
	mov r4, r2, lsr #31;float1's sign
	mov r5, r2, lsl #1
	mov r5, r5, lsr #24;float1's mantissa
	mov r6,r2,lsl #9
	mov r6,r6, lsr #9;float1's mantissa
	add r6,r6,#0x00800000;float1's mantissa include number 1
	
	mov r7, r3, lsr #31;float2's sign
	mov r8, r3, lsl #1
	mov r8, r8, lsr #24;float2's mantissa
	mov r9,r3,lsl #9
	mov r9,r9, lsr #9;float2's mantissa
	add r9,r9,#0x00800000;float2's mantissa include number 1
	
	cmp r5,#0x00000000;Check if two numbers are zero.
	cmpeq r6,#0x00800000;Check if two numbers are zero.
	cmpeq r8,#0x00000000;Check if two numbers are zero.
	cmpeq r9,#0x00800000;Check if two numbers are zero.
	mov r10,#0x00000000;Check if two numbers are zero, if yes, result is zero
	beq floating_add_finish;Check if two numbers are zero, if yes, go to finishbranch
	
	cmp r4,r7;Check the sign of two numbers.
	beq floating_add_same;if same, go to same branch
	bne floating_add_notsame;if  not smae go to notsame branch
	
floating_add_same
	cmp r5,r8;compare exponent
	subeq r10, r5,r8; this case is that shift num is zero
	SUBGT r10, r5,r8; this is shift num
	SUBLT r10, r8,r5; this is shift num
	MOVGT r9,r9,lsr r10;changing mantissa using shift num
	MOVLT r6,r6,lsr r10;changing mantissa using shift num
	add r11,r6,r9;adding mantisa
	mov r12,r11,lsr#24;checking mantissa for normalizing
	ADDLT r10,r12,r8;changing exponent
	ADDGT r10,r12,r5;changing exponent
	ADDEQ r10,r12,r5;changing exponent
	cmp r12,#0;checking mantissa for normalizing
	MOVNE r11,r11,lsr#1;normalizing mantissa
	sub r11,r11,#0x00800000;Subtract 1 from the mantissa that contains 1.
	mov r12,r10
	mov r10,r11;saving result to r10
	add r10,r10,r12,lsl#23;saving result to r10
	add r10,r10,r4,lsl#31;saving result to r10
	b floating_add_finish;go to finish branch for ending
	
floating_add_notsame
	cmp r5,r8;compare exponent
	SUBGT r10, r5,r8; this is shift num
	SUBLT r10, r8,r5; this is shift num
	MOVGT r9,r9,lsr r10;changing mantissa using shift num
	MOVLT r6,r6,lsr r10;changing mantissa using shift num
	cmp r6,r9
	SUBGT r11,r6,r9;substracting mantissa
	SUBLT r11,r9,r6;substracting mantissa
	
	
	mov r12,r11,lsr#23;checking mantsissa's state
	cmp r12,#1;this case is no required normalizing
	beq floating_add_nonormalize;so if this case go to nonormalize branch
	
	cmp r11,#0x00000000;checking mantsissa's state, if mantissa sum is zero 
	cmpeq r5,r8;if mantissa sum is zero,check exponent state
	moveq r10,#0x00000000;if exponent are same, this case's result is zero so save zero to r10
	beq floating_add_finish;go to finish branch for ending
	
	cmp r12,#0;checking mantsissa's state
	moveq r10,#0;this case is required mantisa's normalizing and changing exponent
	beq floating_add_loop; so go to loop branch for mantisa's normalizing and changing exponent
	

floating_add_nonormalize
    ;this branch is made for normalize case
	sub r11,r11,#0x00800000;Subtract 1 from the mantissa that contains 1.
	mov r10,r11;saving result to r10
	cmp r5,r8
	
	ADDEQ r10,r10,r5,lsl#23;saving result to r10
	cmpeq r6,r9
	ADDGT r10,r10,r4,lsl#31;saving result to r10
	ADDLT r10,r10,r7,lsl#31;saving result to r10
	
	cmp r5,r8
	ADDGT r10,r10,r5,lsl#23;saving result to r10
	ADDLT r10,r10,r8,lsl#23;saving result to r10
	b floating_add_finish;go to finish branch for ending
	
	
floating_add_loop
	;this branch is made for mantisa's normalizing and changing exponent
	add r10,r10,#1;counter
	mov r12, r11,lsr r10;find first 1 for mantisa's normalizing 
	cmp r12,#1;if you find first 1
	beq floating_add_endloop;if you find first 1, go to endloop
	bne floating_add_loop;if you don't find first 1, Repeat loop
	
	
floating_add_endloop
	rsb r10,r10,#23;Revising counter for mantisa's normalizing and changing exponent
	mov r11,r11,lsl r10;mantisa's normalizing using counter
	sub r11,r11,#0x00800000;Subtract 1 from the mantissa that contains 1
	cmp r5,r8
	SUBEQ r12,r5,r10;changing exponent using counter
	SUBGT r12,r5,r10;changing exponent using counter
	SUBLT r12,r8,r10;changing exponent using counter
	
	mov r10,r11;saving result to r10
	ADD r10,r10,r12,lsl#23;saving result to r10
	
	cmp r5,r8
	cmpeq r6,r9;if exponents are same, we check mantisa for conclude sign bit
	ADDGT r10,r10,r4,lsl#31;saving result to r10
	ADDLT r10,r10,r7,lsl#31;saving result to r10
	b floating_add_finish;go to finish branch for ending
	
floating_add_finish
	LDR r0, Address1;saving 0x40000000 to r0
	str r10,[r0],#32;saving r10's value to memory
	mov pc,lr
	
float1 & 0x4141F9A7 
float2 & 0x4158B0FD  

Address1 DCD &40000000
	END