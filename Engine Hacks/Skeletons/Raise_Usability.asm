.thumb
.org 0

@shouldn't have to check chapter number because Death is only playable in ch 1

push	{r4-r5,r14}
ldr		r0,=#0x202BCF0
ldrb	r0,[r0,#0xE]
cmp		r0,#1
bne		RetFalse
ldr		r0,=#0x3004E50		@current char ptr
ldr		r0,[r0]
ldr		r1,[r0]
ldrb	r1,[r1,#0x4]		@current char's char number
ldr		r3,DeathOptions
lsl		r2,r3,#0x8
lsr		r2,#0x18			@in order, bytes are x, y, char #, max # of summons
cmp		r1,r2
bne		RetFalse
ldr		r2,=#0x203E884		@character battle stats thing
lsl		r1,#4
add		r1,r2
ldrb	r1,[r1,#0x4]		@current number of times summoned (usually favoritism stat, written at A47B6
lsr		r2,r3,#0x18
cmp		r1,r2
bge		RetFalse
ldrb	r1,[r0,#0x10]		@x
mov		r2,#0xFF
and		r2,r3
cmp		r1,r2
bne		RetFalse
ldrb	r1,[r0,#0x11]		@y
lsl		r2,r3,#0x10
lsr		r2,#0x18
cmp		r1,r2
bne		RetFalse
mov		r4,#40
mov		r5,#0
Loop1:
mov		r0,r4
ldr		r1,=#0x8019430
mov		r14,r1
.short	0xF800
cmp		r0,#0
beq		NextUnit
ldr		r1,[r0]
cmp		r1,#0
beq		NextUnit
ldr		r1,[r0,#0xC]
mov		r2,#0x4
tst		r1,r2
bne		NextUnit
add		r5,#1
NextUnit:
add		r4,#1
cmp		r4,#0x55
ble		Loop1
cmp		r5,#20
blt		RetTrue
mov		r0,#2				@display option, but greyed out
b		GoBack
RetTrue:
mov		r0,#1
b		GoBack
RetFalse:
mov		r0,#3
GoBack:
pop		{r4-r5}
pop		{r1}
bx		r1

.ltorg
DeathOptions:
@
