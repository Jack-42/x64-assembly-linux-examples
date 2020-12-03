;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; This program writes "Hello World!" to standard output.    ;
; It uses the C standard library.                           ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

global main         ; make entry point visible to linker, this is called by the C library startup code
extern puts         ; declare C library function

section .data
    message db `Hello World!\0`     ; zero-terminated string

section .text
main:
    sub rsp, 8                  ; align the stack

    ; write to standard output
    mov rdi, message            ; address of string
    call puts

    ; exit program, return back to C library wrapper
    mov rax, 0                  ; exit code: 0 for success
    add rsp, 8                  ; align the stack
    ret
