/******************************************
*  Simplest possible program.
*  Calls exit syscall for correct
*  termination.
*
******************************************/
.global _start

.section .text
_start:
    mov     x0, #0      /* Exit code 0  */
    mov     x8, #0x5D   /* exit syscall */
    svc     0           /* syscall */
