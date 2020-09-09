;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; This program asks the user for their name and greets them.    ;
; It uses the C standard library.                               ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

%define MAX_NAME_LENGTH 32

; declare entry point for linker, this is called by the C library startup code
global main

; declare C library functions
extern puts
extern gets
extern printf

section .data
    question db `What is your name?\0`      ; zero-terminated string
    greeting db `Hello, %s!\n\0`            ; zero-terminated string with format specifier

section .bss
    name resb MAX_NAME_LENGTH               ; reserve static memory for name

section .text
main:
    ; ask user for name
    mov rdi, question       ; address of string
    call puts

    ; read name
    ; TODO: gets is unsafe, may lead to buffer overflow
    mov rdi, name           ; address of buffer
    call gets

    ; print greeting
    mov rax, 0              ; no vector (xmm) registers
    mov rdi, greeting       ; address of format string
    mov rsi, name           ; first param
    call printf

    ; exit program, return back to C library wrapper
    mov eax, 0              ; exit code: 0 for success
    ret
