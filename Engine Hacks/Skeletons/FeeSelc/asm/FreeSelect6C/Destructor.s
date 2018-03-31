.thumb
.include "fe8.inc"

FreeSelect6C_Destructor:
	push {lr}
	
	_blh UnlockGameLogic
	
	pop {r1}
	bx r1

.ltorg
.align

EALiterals:
	@ noting
