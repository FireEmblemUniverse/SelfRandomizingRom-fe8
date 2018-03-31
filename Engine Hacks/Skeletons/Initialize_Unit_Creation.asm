.thumb
.org 0

@this function puts a pointer to the current UNIT block in the 6C

push	{r4-r5,r14}
mov		r4,r0
ldr		r5,=#0x203A958
ldrb	r0,[r5,#0xC]		@'attacker' unit id
ldr		r1,=#0x8019430
mov		r14,r1
.short	0xF800
ldr		r0,[r0]
ldrb	r0,[r0,#4]			@char id
ldr		r1,=#0x203E884
lsl		r0,#4
add		r0,r1
ldrb	r0,[r0,#4]			@favoritism byte
lsl		r0,#2
ldr		r1,RaisedUnitListPtrTable
add		r0,r1
ldr		r0,[r0]				@pointer to the unit block that will be summoned
str		r0,[r4,#0x34]
mov		r0,r4
ldrb	r1,[r5,#0x13]		@target x
ldrb	r2,[r5,#0x14]		@target y
ldr		r3,=#0x8015E0C
mov		r14,r3
.short	0xF800
@put the current unit's allegiance byte on the unit map
pop		{r4-r5}
pop		{r0}
bx		r0

.ltorg
RaisedUnitListPtrTable:
@
