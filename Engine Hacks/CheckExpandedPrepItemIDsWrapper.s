.thumb
@r0 is item id, r4 is proc parent
mov r0, r4
mov r1, #8
ldr r3, =0x8002f25 @gotoproclabel
mov lr, r3
.short 0xf800
pop {r4}
pop {r0}
bx r0

.ltorg
