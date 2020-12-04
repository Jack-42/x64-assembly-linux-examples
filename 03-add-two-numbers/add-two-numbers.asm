;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;:::::::::::::::::::::;
; This program asks the user for two numbers, adds them and prints the result.  
; It uses functions of the C standard library.                                               
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; declare entry point for linker
global main

; declare C library functions
extern printf
extern scanf

section .data
    message_number1 db `Enter first number: \0`
    message_number2 db `Enter second number: \0`
    message_sum db `The sum is %lld.\n\0`

    format_number db `%lld\0`

section .bss
    number1 resq 1
    number2 resq 1
    sum resq 1

section .text
main:
    ; align the stack
    sub rsp, 8

    ; ask user for first number
    mov rax, 0                  ; no vector registers
    mov rdi, message_number1    ; address of format string
    call printf

    ; read first number
    mov rax, 0                  ; no vector registers
    mov rdi, format_number      ; address of format string
    mov rsi, number1            ; address of first param
    call scanf

    ; ask user for second number
    mov rax, 0                  ; no vector registers
    mov rdi, message_number2    ; address of format string
    call printf

    ; read second number
    mov rax, 0                  ; no vector registers
    mov rdi, format_number      ; address of format string
    mov rsi, number2            ; address of first param
    call scanf

    ; add numbers
    mov rax, [number1]          ; load first number
    add rax, [number2]          ; add second number
    mov [sum], rax              ; store sum

    ; print sum
    mov rax, 0                  ; no vector registers
    mov rdi, message_sum        ; address of format string
    mov rsi, [sum]              ; first param
    call printf

    ; align the stack
    add rsp, 8

    ; exit program
    mov rax, 0                  ; exit code: 0 for success
    ret
