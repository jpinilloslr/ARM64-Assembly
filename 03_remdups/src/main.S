/******************************************
*  Copy source to destination buffer 
*  removing duplicated bytes.
*
*
******************************************/
.include "macros.S"

.global _start

.section .text
_start:
    ldr     x0, =input      /* Pointer to source buffer */
    ldr     x1, =output     /* Pointer to destination buffer */
    mov     w3, #0          /* Use w3 to track last byte. Start with 0x0 */
loop:
    ldrb    w2, [x0], #1    /* Read byte from input and increment pointer */
    cmp     w2, w3          /* Compare with last byte */
    beq     loop_check      /* Skip copy if equals */
    strb    w2, [x1], #1    /* Copy byte to dest and increment pointer */
loop_check:
    mov     w3, w2          /* Track last byte */
    cmp     w2, #0          /* Is it the end of the string? */
    bne     loop            /* Return to loop if it's not the end */
report:
    print   input_label
    print   input
    print   output_label
    print   output
    exit    0

.section .data
    input_label:    .asciz      "Input: "
    output_label:   .asciz      "Output: "
    input:          .ascii      "Looooreeemm ipsssum dooolor sittt ammmet, "
                    .asciz      "cccconssectetttuurrr addddipisscing eliiit.\n"
    output:         .fill       128, 1, 0

