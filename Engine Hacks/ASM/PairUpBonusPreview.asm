.thumb
.org 0
@hook at 8035272, return to 803528c
@r8 is the unit whose data i need to draw
push {r5}
mov r5, #0 @loop counter

LoopStart:
lsr r0,r5,#1
lsl r0,#2
ldr r0,[r6,r0] @get r6+nth pointer of memory allocated
add r0,#0x38
mov r1,r8
mov r2,r5
bl DrawStat @was 8034a5c
lsr r0,r5,#1
lsl r0,#2
ldr r0,[r6,r0]
add r0,#0x38
mov r2,#0xe1
add r1,r4,r2
lsl r1,#1
add r1,r9 @at this point r1 is the top left. Add 0x80 for each row, add 0xC for each column

mov r2,#(ScreenLocations - LoadScreenLoc + 2)
add r2,pc
lsl r3,r5,#1
add r2,r3

LoadScreenLoc:
ldrh r2,[r2]
add r1,r2

ldr r3, CommitToScreen
mov lr,r3
.short 0xf800

add r5,#1
cmp r5, #8
blt LoopStart

pop {r5}
ldr r3,ReturnLoc
bx r3

.align
CommitToScreen:
.long 0x8003e70
ReturnLoc:
.long 0x803528c|1
ScreenLocations:
.short 0
.short 0x80
.short 0x100
.short 0x180
.short 0xc
.short 0x8c
.short 0x10c
.short 0x18c

Caller:
push {r4-r7,lr}
mov r7,r0
mov r5,r2
mov r6,r3
ldr r4, Caller1
mov lr,r4
.short 0xf800
mov r0,r7
mov r1,r5
ldr r4,Caller2
mov lr,r4
.short 0xf800
mov r0,r7
mov r1,r6
bl PlusDrawer
pop {r4-r7}
pop {r0}
bx r0

PlusDrawer:
push {r4-r6,r14}
mov r4, r0
cmp r1, #0xff
beq Null
    lsl r1, #0x18       @unsigned to signed byte conversion
    asr r1, #0x18
  cmp r1, #0
  bpl Positive
    Negative:
    ldrb r2,[r4,#2]
    mov r6,r2
    neg r1,r1
    mov r5,r1         @r5 = positive r1
    cmp r1, #0xA      @2 digit, need to move left
    blt OneDigit
      sub r2,#8
    OneDigit:
    sub r2,#8
    strb r2,[r4,#2]
    mov r1, #3
    neg r1,r1
    mov r0,r4
      ldr r3, Drawfunc @call the draw func with -3
      bl gotoR3
    strb r6,[r4,#2] @put the x pos back
    mov r1,r5
    b DrawNumber

    Positive:
    ldrb r2,[r4,#2]
    mov r6,r2
    mov r5,r1         @r5 = positive r1
    cmp r1, #0xA      @2 digit, need to move left
    blt OneDigita
      sub r2,#8
    OneDigita:
    sub r2,#8
    strb r2,[r4,#2]
    mov r1, #5
    neg r1,r1
    mov r0,r4
      ldr r3, Drawfunc @call the draw func with -5
      bl gotoR3
    strb r6,[r4,#2] @put the x pos back
    mov r1,r5

  DrawNumber:
    mov r0,r4
      ldr r3, Drawfunc @draw the negative number
      bl gotoR3
    b End
  Null:
    mov r1,#8
    neg r1,r1
    mov r0,r4
    ldr r3,Caller3
    bl gotoR3
    ldr r0,Caller4
    ldr r3,Caller5
    bl gotoR3
    mov r1,r0
    mov r0, r4
    ldr r3,Caller6
    bl gotoR3
End:
pop {r4-r6}
pop {r3}
gotoR3:
bx r3

.align
Drawfunc:
.long 0x8004075
Caller1:
.long 0x8003e54
Caller2:
.long 0x8003e60
Caller3:
.long 0x8003e59
Caller4:
.long 0x535
Caller5:
.long 0x800a241
Caller6:
.long 0x8004005

DrawStat:
push {r4-r7,lr}
mov r5,r0
mov r4,r1
mov r6,r2
push {r7}
ldr r3, ClearSpace
mov lr,r3
.short 0xf800

mov r0, #(TextIDs - LoadText + 2)
add r0,pc
lsl r2,r6,#1 @r2 = loop counter x 2
add r0,r2
LoadText:
ldrh r0,[r0]

ldr r3, UncompText
mov lr,r3
.short 0xf800

mov r3,r0
mov r0,r5
mov r1,#0
mov r2,#3
ldr r7, DrawStatName
mov lr,r7
.short 0xf800

lsl r0,r6,#2 @r0 = loop counter x 4
mov r2, #(Getters - LoadGetter)
add r2,pc
add r2,r0
LoadGetter:
ldr r2,[r2]
mov r0,r4 @rescuee's data
pop {r1} @rescuer's data
mov lr,r2
.short 0xf800 @getter assumed to take chardata in r0 and return value in r0

mov r3,r0
mov r0,r5
mov r1,#0x24
mov r2,#0x2
bl Caller

pop {r4-r7}
pop {r0}
bx r0

.align
ClearSpace:
.long 0x8003dc8
UncompText:
.long 0x800a240
DrawStatName:
.long 0x8004480

TextIDs:
.short 0x4fe //str
@ .short 0x4ff //mag
.short 0x4ec //skl
.short 0x4ed //spd
.short 0x4ee //luck
.short 0x4ef //def
.short 0x4f0 //res
.short 0x4f7 //con
.short 0x4f6 //move

Getters:
