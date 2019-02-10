.thumb

@In installer, set 2B54E to jump here.
mov     r1,#0x4
ldsh    r0,[r4,r1]        @r4 = battle stats data? Damage to be dealt
cmp     r0,#0x0
beq     noDamage
mov     r1,r6
add     r1,#0x7C          @Has dealt damage this turn.
ldrb r2, [r1]
mov     r0,#0x1
orr r2, r0
strb    r2,[r1]

noDamage: @this is vanilla flashy mode replacement!
ldr r0, proc__flashymode
mov lr, r0
mov r0, r6 @attacker
mov r1, r8 @defender
ldr r2, [r7] @battle buffer
mov r3, r5 @battle data
.short 0xf800

pop     {r3-r5}
mov     r8,r3
mov     r9,r4
mov     r10,r5
pop     {r4-r7}
pop     {r0}
bx      r0

.align
proc__flashymode:
@POIN proc__flashymode
