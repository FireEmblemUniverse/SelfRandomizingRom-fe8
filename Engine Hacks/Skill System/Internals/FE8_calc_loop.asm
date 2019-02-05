.org 0
.thumb
.equ LoopTable, SkillsOffChecker + 4

CheckForVanillaMode:
push {r4,r5,lr}
mov r4, r0
mov r5, r1

ldr r0, SkillsOffChecker
mov lr, r0
.short 0xf800
cmp r0, #0 @if no skills, we do the vanilla battle routine
bne ContinueToLoop

	ldr r0, =0x802aa44
	mov lr, r0
	mov r0, r4
	.short 0xf800
	ldr r0, =0x802a967
	bx r0

ContinueToLoop:
mov r0, r4
mov r1, r5
bl LoopParent
pop {r4,r5}
pop {r0}
bx r0

LoopParent:
push {lr}
mov r2,pc
add r2, #(LoopTable - Subtract) @need to double check here
Subtract:
bl MainLoop
pop {r0}
bx r0

MainLoop:
push {r4-r6,lr}
mov r4,r0
mov r5,r1
mov r6,r2
StartLoop:
ldr r2,[r6]
cmp r2,#0 @end of loop?
beq EndLoop
mov r0,#1
orr r2,r0 @in case you forgot the +1... get rid of this if you want ARM code
mov r0,r4
mov r1,r5
bl RunCalc
add r6,#4
b StartLoop
EndLoop:

pop {r4-r6}
pop {r0}
bx r0

RunCalc:
push {r4-r6,lr}
mov r4,r0
mov r5,r1
mov r6,r2
bl GOTO_r6
@ mov r0,r5
@ mov r1,r4
@ bl GOTO_r6 @don't flip it???
pop {r4-r6}
pop {r0}
bx r0
GOTO_r6:
bx r6

.align 2
.ltorg
SkillsOffChecker:
@this is a table of pointers
