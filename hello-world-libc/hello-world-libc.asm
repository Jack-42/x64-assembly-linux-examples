;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; This program writes "Hello World!" to standard output.    ;
; It uses the C standard library.                           ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

global main                     ; make entry point visible to linker, this is called by the C library startup code
extern puts                     ; declare C library function

section .data
    message db "Hello World!", 0    ; zero-terminated string

section .text
main:
    ; write to standard output
    mov rdi, message            ; address of string
    call puts

    ret                         ; return back to C library wrapper
