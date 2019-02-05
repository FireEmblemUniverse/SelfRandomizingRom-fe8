@Silencer Check, branched at 2acf8

.thumb

push {r4,r5,r14}
mov r4, r0
mov r5, r1
ldr r0, SkillsOffChecker
mov lr, r0
.short 0xf800
cmp r0, #0 @if no skills, we do the vanilla
bne DoNothing
	mov r0, r4
	mov r1, r5
	pop {r4, r5}
	push {r4} @put the stack in order, lol
	mov r3, r0
	mov r4, r1
	ldr r0, [r3]
	ldr r1, [r3, #4]
	ldr r2, [r0, #0x28]
	ldr r0, =0x802ad05
	bx r0

DoNothing:
pop {r4,r5}
pop {r0}
bx r0

.ltorg

SkillsOffChecker:
