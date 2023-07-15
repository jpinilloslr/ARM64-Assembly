/******************************************
*  Switch to output valid DNA based on input.
*  A64 instruction set does not include the 
*  concept of predicated or conditional 
*  execution.
*
******************************************/
.include "macros.S"

.global _start

.section .data
    input:      .ascii  "GTATCGATCGATCGATCGATTATATTTTCGACGAGATTTAAATATATATA"
                .asciz  "TATACGAGAGAATACAGATAGACAGATTA"

.section .text

_start:
    ldr     x0, =input
loop:
    ldrb    w1, [x0]
    cmp     w1, #0
    beq     exit
case_a:
    cmp     w1, #'A'
    bne     case_t
    mov     w2, #'T'
    b       write
case_t:
    cmp     w1, #'T'
    bne     case_c
    mov     w2, #'A'
    b       write
case_c:
    cmp     w1, #'C'
    bne     case_default
    mov     w2, #'G'
    b       write
case_default:
    mov     w2, #'C'
write:
    strb    w2, [x0], #1
    b   loop
exit:
    print input
    exit 0
