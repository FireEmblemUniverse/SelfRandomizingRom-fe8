.thumb
.include "fe8.inc"

.set EAL_p6CFreeSelect, (EALiterals+0x00)

@ Arguments: r0 = Routine Array Pointer
@ Returns:   r0 = FreeSelect 6C Struct
NewFreeSelect:
	push {r4, lr}
	
	mov r4, r0 @ var r4 = Routine Array Pointer
	
	@ Locking game logic
	_blh LockGameLogic
	
	ldr r0, EAL_p6CFreeSelect
	mov r1, #3
	
	_blh New6C
	
	@ Storing routine list
	str r4, [r0, #0x2C]
	
	pop {r4}
	
	pop {r1}
	bx r1

.ltorg
.align

EALiterals:
	@ POIN p6C_FreeSelect
