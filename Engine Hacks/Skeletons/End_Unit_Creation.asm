.thumb
.org 0

@increments the skeletons summoned counter
.equ RemoveBonesEvent2, RemoveBonesEvent1+4
.equ RemoveBonesEvent3, RemoveBonesEvent2+4

push	{r14}
ldr		r0,=#0x203A958
ldrb	r0,[r0,#0xC]
ldr		r1,=#0x8019430
mov		r14,r1
.short	0xF800
ldr		r0,[r0]
ldrb	r0,[r0,#0x4]
ldr		r1,=#0x203E884
lsl		r0,#4
add		r0,r1
ldrb	r1,[r0,#0x4]
add		r1,#1
strb	r1,[r0,#0x4]
cmp		r1,#4
beq		RemoveBones1
cmp		r1,#8
beq		RemoveBones2
cmp		r1,#12
beq		RemoveBones3
b		GoBack
RemoveBones1:
ldr		r0,RemoveBonesEvent1
b		ExecuteEvent
RemoveBones2:
ldr		r0,RemoveBonesEvent2
b		ExecuteEvent
RemoveBones3:
ldr		r0,RemoveBonesEvent3
ExecuteEvent:
mov		r1,#0
ldr		r2,=#0x800D07C
mov		r14,r2
.short	0xF800
GoBack:
pop		{r0}
bx		r0

.ltorg
RemoveBonesEvent1:
@
