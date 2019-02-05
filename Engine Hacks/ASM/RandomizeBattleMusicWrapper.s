.thumb

@r0 = isdefending
push {lr}
ldr r1, RandomizeBattleMusic
mov lr, r1
.short 0xf800
@now r0 = the music ID
mov r6, r0
pop {r0}
bx r0
.align
RandomizeBattleMusic:
@POIN RandomizeBattleMusic
