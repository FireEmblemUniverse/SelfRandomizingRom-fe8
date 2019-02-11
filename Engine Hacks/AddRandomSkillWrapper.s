.thumb
@r0 is pc
@r6 is parent proc
push {r4,r5}
mov r4, r6
ldr r1, =0x203a958
ldrb r0, [r1, #0xc] @get deployment no
ldr r1, =0x8019430
mov lr, r1
.short 0xf800
@r0 = Unit*
mov r5, r0 @save this for later 
mov r1, r4
mov r2, r8 @used item ID
@r1 = Parent Proc*
ldr r3, AddRandomSkill @(Unit* unit, Proc* Parent)
mov lr, r3
.short 0xf800

mov r0, r5 @Unit*
ldr r1, =0x203a958
ldrb r1, [r1, #0x12] @item slot number
ldr r3, =0x8018994
mov lr, r3
.short 0xf800 @decrement

pop {r4,r5}
ldr r0, =0x802ff77 @return
bx r0

.ltorg
AddRandomSkill:
@POIN AddRandomSkill
