.thumb
.include "fe8.inc"

.set pTCS_PositionSelectCursor, 0x085A0EA0

FreeSelect6C_Init:
	push {r4, lr}
	
	mov r4, r0 @ var r4 = 6C
	
	@ Making TCS for cursor
	ldr r0, =pTCS_PositionSelectCursor
	mov r1, #0
	
	_blh TCS_New
	
	str r0, [r4, #0x30]
	
	mov  r1, #0
	strh r1, [r0, #0x22] @ TCS.OAM2Base = 0
	
	_blh TCS_SetAnim
	
	ldr r3, [r4, #0x2C] @ routine array pointer
	ldr r3, [r3, #0x00] @ routine 0x00 = OnInit
	
	cmp r3, #0
	beq End
	
	mov r0, r4 @ arg r0 = 6C
	bl BXR3
	
End:
	pop {r4}
	
	pop {r3}
BXR3:
	bx r3

.ltorg
.align

EALiterals:
	@ noting
