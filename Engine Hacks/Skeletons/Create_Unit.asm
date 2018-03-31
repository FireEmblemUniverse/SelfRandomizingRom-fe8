.thumb
.org 0

@create a unit with UNIT ptr in 6C+0x34

push	{r4-r7,r14}
add		sp,#-0x4
mov		r4,r0
ldr		r5,[r4,#0x34]
ldrb	r0,[r5]
cmp		r0,#0
bne		MakeAUnit
@if 0, then we've made all units and should break out of the loop
mov		r0,r4
mov		r1,#0x21
ldr		r2,=#0x8002F24
mov		r14,r2
.short	0xF800
b		GoBack

MakeAUnit:
ldr		r6,=#0x3001C38
mov		r7,r6
ldmia	r5!,{r0-r3}
stmia	r6!,{r0-r3}
ldmia	r5!,{r0}
stmia	r6!,{r0}
@MAKING A FAKE REDA MIGHT BE UNNECESSARY AT THIS POINT, BUT I'M TOO LAZY TO CONFIRM THIS
ldrb	r0,[r7,#0x5]		@bottom 4 bits are y coord, top 4 are flags
mov		r1,#0xF0
and		r0,r1				@keep only the flags
lsl		r0,#0x8
ldr		r3,=#0x203A958
ldrb	r2,[r3,#0x13]		@target x
mov		r1,#0x3F
and		r2,r1
orr		r0,r2
ldrb	r2,[r3,#0x14]		@target y
and		r2,r1
lsl		r2,#0x6
orr		r0,r2
strh	r0,[r7,#0x4]		@store actual coordinates + flags
@make the reinforcement data (REDA)
strh	r0,[r6]
mov		r0,#0
strh	r0,[r6,#0x2]
str		r0,[r6,#0x4]
str		r6,[r7,#0x8]		@pointer to REDA
mov		r0,#1
strb	r0,[r7,#0x7]		@number of REDAs

@create unit
mov		r0,r7
ldr		r1,=#0x8017AC4		@creates the unit, returns r0=char ptr
mov		r14,r1
.short	0xF800
@r0 has char data ptr for new unit
str		r5,[r4,#0x34]
mov		r5,r0
ldr		r1,=#0x803BDE0
mov		r14,r1
ldr		r1,=#0x3004E50
ldr		r1,[r1]
ldr		r6,=#0x202E4D8		@unit map
ldr		r6,[r6]
ldrb	r2,[r1,#0x11]
lsl		r2,#2
add		r6,r2
ldr		r6,[r6]
ldrb	r2,[r1,#0x10]
add		r6,r2
ldrb	r2,[r1,#0xB]
strb	r2,[r6]				@store Death's allegiance byte on the unit map temporarily
ldrb	r1,[r0,#0x10]		@temp x
ldrb	r2,[r0,#0x11]		@temp y
mov		r3,sp
strb	r1,[r3]
strb	r2,[r3,#1]
.short	0xF800				@returns new coordinates on provided sp
mov		r0,sp
ldrh	r1,[r0]				@actual x
strb	r1,[r5,#0x10]
strh	r1,[r4,#0x38]
ldrh	r1,[r0,#2]			@actual y
strb	r1,[r5,#0x11]
strh	r1,[r4,#0x3A]
mov		r2,#0
strb	r2,[r6]				@zero out Death's unit again
GoBack:
add		sp,#0x4
pop		{r4-r7}
pop		{r0}
bx		r0

.ltorg
