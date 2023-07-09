/******************************************
*  Uses write syscall to output
*  message to stdout.
*
******************************************/
.global _start

.section .data
    msg:   .asciz  "Hello world!\n"

.section .text
_start:
    mov     x8, #0x40   /* setup write syscall */
    mov     x0, #1      /* stdout */
    ldr     x1, =msg    /* buffer */
    mov     x2, #13     /* buffer size */
    svc     0
_exit:
    mov     x8, #0x5D   /* setup exit syscal */
    mov     x0, #0      /* 0 exit code */
    svc     0
