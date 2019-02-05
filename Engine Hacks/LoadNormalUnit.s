.thumb

push {r4-r7, lr}
sub sp, #0x14
mov r6, r0
mov r5, #0
ldr r0, =0x8017baa|1
bx r0

.ltorg
