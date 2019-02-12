@runesword fix, write hp to heal to battlebuffer+5
.thumb

@hook at 802b758 with manual jumptohack using r0
@ byte 00 48 00 47 POIN offset|1

@ONLY DO ANYTHING IF VANILLA MODE, OTHERWISE THIS IS HANDLED IN PROC LOOP
push {r3}
ldr r0, SkillsOffChecker
mov lr, r0
.short 0xf800
pop {r3}
cmp r0, #0 @if 0, it's vanilla mode
bne Original
@write hp update
ldr r0, =0x203a4d4 @battle data
ldrb r1, [r0, #4] @damage dealt
mov r2, #5
ldsb r2, [r3, r2] @signed hp delta
add r2, r1
strb r2, [r3, #5]

Original:
ldr r0, [r4, #4]
ldrb r0, [r0, #4]
cmp r0, #0x66
beq return_a
ldr r0, =0x802b761
bx r0

return_a:
ldr r2, =0x802b7eb
bx r2

.ltorg
SkillsOffChecker:
@POIN SkillsOffChecker
