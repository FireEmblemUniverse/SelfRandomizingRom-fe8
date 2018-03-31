.thumb
.include "fe8.inc"

RewarpStaff_SelectOnCancel:
	push {lr}
	
	ldr r0, =p6C_GBToUnitMenu @ arg r0 = 6C Code Pointer
	mov r1, #3                @ arg r1 = Thread
	
	_blh New6C
	
	mov r0, #0x0A
	
	pop {r1}
	bx r1

.ltorg
.align

EALiterals:
	@ nothing
