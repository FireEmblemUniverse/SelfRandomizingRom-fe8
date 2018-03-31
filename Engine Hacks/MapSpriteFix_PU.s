.thumb
@branching from 271da, return to 271e0 (draw) or 27282 (no draw)
ldr r0, =0x20c
and r0, r3
cmp r0, #0
bne NoDraw
@now check 0x1
mov r0, #1
and r0, r3
cmp r0, #0
beq Draw

mov r0, #0x20 @being rescued
and r0, r3
cmp r0, #0
bne Draw

NoDraw:
ldr r0, =0x8027283
bx r0

Draw:
ldr r0, =0x80271e1
bx r0
