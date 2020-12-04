;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; This program writes "Hello World!" to standard output.
; It uses functions of the C standard library.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; declare entry point for linker
global main

; declare C library functions
extern puts

section .data
    message db `Hello World!\0`

section .text
main:
    ; align the stack
    sub rsp, 8

    ; write to standard output
    mov rdi, message            ; address of string
    call puts

    ; align the stack
    add rsp, 8

    ; exit program
    mov rax, 0                  ; exit code: 0 for success
    ret
