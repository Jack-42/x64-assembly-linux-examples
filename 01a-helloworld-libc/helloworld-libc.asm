;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; This program writes "Hello World!" to standard output using the C standard library. ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

%define STDOUT 1

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

