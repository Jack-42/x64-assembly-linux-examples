;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; This program asks the user for their name and greets them.
; It uses functions of the C standard library.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

%define MAX_NAME_LENGTH 32

; declare entry point for linker
global main

; declare C library functions
extern puts
extern gets
extern printf

section .data
    question db `What is your name?\0`
    greeting db `Hello, %s!\n\0`

section .bss
    name resb MAX_NAME_LENGTH

section .text
main:
    ; align the stack
    sub rsp, 8

    ; ask user for name
    mov rdi, question       ; address of string
    call puts

    ; read name
    ; TODO: gets is unsafe, might lead to buffer overflow
    mov rdi, name           ; address of buffer
    call gets

    ; print greeting
    mov rax, 0              ; no vector registers
    mov rdi, greeting       ; address of format string
    mov rsi, name           ; first param
    call printf

    ; align the stack
    add rsp, 8

    ; exit program
    mov rax, 0              ; exit code: 0 for success
    ret
