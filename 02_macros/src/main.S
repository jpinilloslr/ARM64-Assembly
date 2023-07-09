/******************************************
*  Testing macros.
*
******************************************/
.include "macros.S"

.global _start

.section .data
    msg:   .asciz  "Hello macros!\n"

.section .text
_start:
    print   msg
    exit    0
