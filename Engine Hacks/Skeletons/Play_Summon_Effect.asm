.thumb
.org 0

@focus the camera on the newly-summoned unit

push	{r14}
ldrh	r1,[r0,#0x38]
ldrh	r2,[r0,#0x3A]
ldr		r3,=#0x8080D2C
mov		r14,r3
.short	0xF800
pop		{r0}
bx		r0

.ltorg
