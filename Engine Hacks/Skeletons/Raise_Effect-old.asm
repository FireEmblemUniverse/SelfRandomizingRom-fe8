.thumb
.org 0

@replaces 244B8

push	{r14}
add		r1,#0x3D
ldrb	r1,[r1]
cmp		r1,#2
bne		RaiseRange
ldr		r1,CantSummonText
ldr		r2,=#0x804F580
mov		r14,r2
.short	0xF800
mov		r0,#8
b		EndRaiseEffect
RaiseRange:
ldr		r0,=#0x3004E50
ldr		r0,[r0]
bl		Func_25CA4
ldr		r0,=#0x859D338
ldr		r1,=#0x804FA3C
mov		r14,r1
.short	0xF800
mov		r0,#7
EndRaiseEffect:
pop		{r1}
bx		r1

.ltorg

Func_25CA4:
push	{r4-r5,r14}
mov		r4,#0x10
ldsb	r4,[r0,r4]
mov		r5,#0x11
ldsb	r5,[r0,r5]
ldr		r1,=#0x2033F3C
str		r0,[r1]
ldr		r0,=#0x202E4E4
ldr		r0,[r0]
mov		r1,#0
ldr		r2,=#0x80197E4
mov		r14,r2
.short	0xF800
ldr		r2,=#0x8025C35
mov		r0,r4
mov		r1,r5
bl		Func_24FA4
pop		{r4,r5}
pop		{r0}
bx		r0

.ltorg

Func_24FA4:
push	{r4-r6,r14}
mov		r4,r0
mov		r5,r1
mov		r6,r2
ldr		r2,=#0x804F8A4
mov		r14,r2
.short	0xF800
mov		r0,r4
mov		r1,r5
mov		r2,#0xFF			@the whole reason I need to rewrite this damn thing
ldr		r3,=#0x801AABC
mov		r14,r3
mov		r3,#1
.short	0xF800
mov		r3,#1
neg		r3,r3
mov		r0,r4
mov		r1,r5
ldr		r2,=#0x801AABC
mov		r14,r2
mov		r2,#0
.short	0xF800
mov		r0,r6
ldr		r1,=#0x8024F18
mov		r14,r1
.short	0xF800
pop		{r4-r6}
pop		{r0}
bx		r0

.ltorg

CantSummonText:
@
