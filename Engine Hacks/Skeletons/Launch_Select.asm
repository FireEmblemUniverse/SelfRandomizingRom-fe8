.thumb
.org 0

push	{r14}
ldr		r0,=#0x202BCB0		@camera stuff
ldrh	r1,[r0,#0x16]		@y
ldrh	r0,[r0,#0x14]		@x
ldr		r2,=#0x202E4E4		@range map
ldr		r2,[r2]
lsl		r3,r1,#2
add		r2,r3
ldr		r2,[r2]
add		r2,r0
ldrb	r2,[r2]
cmp		r2,#0
beq		InvalidTile
ldr		r2,=#0x203A958
strb	r0,[r2,#0x13]
strb	r1,[r2,#0x14]
mov		r0,#0x27
strb	r0,[r2,#0x11]		@new action
mov		r0,#0x17
b		GoBack

InvalidTile:
mov		r0,#0x10
GoBack:
pop		{r1}
bx		r1

.ltorg
