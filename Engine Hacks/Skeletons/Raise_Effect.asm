.thumb
.org 0

@replaces 244B8

push	{r4-r7,r14}
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
ldr		r0,=#0x804E884		@clears bgs 0 and 2
mov		r14,r0
.short	0xF800
ldr		r4,=#0x202E4E4		@range
ldr		r4,[r4]
mov		r0,r4
mov		r1,#1				@gonna make the whole map valid
ldr		r2,=#0x80197E4
mov		r14,r2
.short	0xF800
ldr		r0,=#0x3004E50
ldr		r0,[r0]
ldrb	r1,[r0,#0x10]
ldrb	r2,[r0,#0x11]
lsl		r2,#2
add		r2,r4
ldr		r2,[r2]
add		r2,r1
mov		r1,#0
strb	r1,[r2]
ldr		r1,=#0x8018D4C
mov		r14,r1
.short	0xF800				@given char data, returns movement cost pointer
mov		r4,r0
ldr		r0,=#0x202E4D4
ldrh	r5,[r0]				@map x
mov		r6,r5
ldrh	r7,[r0,#0x2]		@map y

Loop1:
sub		r7,#1
cmp		r7,#0
blt		LoopedThroughAllSquares
mov		r5,r6
Loop2:
sub		r5,#1
cmp		r5,#0
blt		Loop1
ldr		r0,=#0x202E4D8		@unit map
ldr		r0,[r0]
lsl		r1,r7,#2
add		r0,r1
ldr		r0,[r0]
add		r0,r5
ldrb	r0,[r0]
cmp		r0,#0
bne		MakeRangeMapNull		@can't summon on a tile with a unit already
ldr		r0,=#0x202E4DC		@terrain map
ldr		r0,[r0]
add		r0,r1
ldr		r0,[r0]
add		r0,r5
ldrb	r0,[r0]
ldrb	r0,[r4,r0]			@terrain cost
cmp		r0,#0xFF
bne		Loop2			@can't summon on tiles that you can't move over
MakeRangeMapNull:
ldr		r0,=#0x202E4E4		@range map
ldr		r0,[r0]
add		r0,r1
ldr		r0,[r0]
add		r0,r5
mov		r1,#0
strb	r1,[r0]
b		Loop2
LoopedThroughAllSquares:

ldr		r0,_pFreeSelectDef
ldr		r1,prNewFreeSelect
mov		r14,r1
.short	0xF800

@ldr		r0,=#0x202BCF0
@add		r0,#0x41
@ldrb	r0,[r0]
@lsl		r0,#0x1E
@cmp		r0,#0
@blt		NoSound
@mov		r0,#0x6A
@ldr		r1,=#0x80D01FC		@plays sound
@mov		r14,r1
@.short	0xF800
@NoSound:

mov		r0,#7
EndRaiseEffect:
pop		{r4-r7}
pop		{r1}
bx		r1

.ltorg
.equ _pFreeSelectDef, CantSummonText+4
.equ prNewFreeSelect, _pFreeSelectDef+4
CantSummonText:
@
