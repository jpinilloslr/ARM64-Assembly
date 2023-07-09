/******************************************
*  Write buffer to stdout.
*  str: Pointer to null terminated string.
*
******************************************/
.macro  print   str
    ldr     x0, =\str
    mov     x1, x0
1: 
    ldrb    w2, [x1]
    cmp     x2, #0
    beq     2f
    add     x1, x1, #1
    b       1b
2:
    sub     x3, x1, x0
    mov     x0, #1
    ldr     x1, =\str
    mov     x2, x3
    mov     x8, #0x40
    svc     0
.endm

/******************************************
*  Exit with code.
*  code: Exit code.
*
******************************************/
.macro exit code
    mov     x0, \code
    mov     x8, #0x5D
    svc     0
.endm
