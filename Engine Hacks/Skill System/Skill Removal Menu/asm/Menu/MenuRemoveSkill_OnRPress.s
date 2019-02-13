.thumb
.include "_Definitions.h.s"

.set prGetSkillIdByIndex, EALiterals+0
.set lpaSkillDescTable, EALiterals+4
@mimic 804f458

SetupRText:
	push {r4-r6,lr}
	
	mov r2, #0x2a
	ldrsh r0, [r1, r2]
	lsl r0, #3
	mov r4, r0 @save the x coord into r4

	mov r2, #0x2c
	ldrsh r3, [r1,r2]
	lsr r6, r3, #1
	lsl r5, r3, #3 @save the y coord into r5

	mov r2, #0x3c
	ldrb r6, [r1, r2] @get the slot of the skill

	ldr r1, [r1, #0x14] @parent proc
	ldr r1, [r1, #0x14] @grandparent proc
	ldr r0, [r1, #0x2c] @unit pointer
	mov r1, r6 @skill index

	ldr r2, prGetSkillIdByIndex
	mov lr, r2
	.short 0xf800
	@now the id is in r0
	ldr r1, lpaSkillDescTable
	lsl r0, #1
	ldrh r2, [r1, r0] @text id

	mov r0, r4 @x coord
	mov r1, r5 @y coord
	_blh 0x8088de0, r4
	pop {r4-r6}
	pop {r1}
	bx r1

.ltorg
.align

EALiterals:
	@ POIN prGetSkillIdByIndex
