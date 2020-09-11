;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;:::::::::::::::::::::;;
; This program asks the user for two numbers, adds them and prints the result.  ;
; It uses the C standard library.                                               ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; declare entry point for linker
global main

; declare C library functions
extern printf
extern scanf

section .data
    message_number1 db `Enter first number: \0`     ; zero-terminated string
    message_number2 db `Enter second number: \0`    ; zero-terminated string
    message_sum db `The sum is %d.\n\0`             ; zero-terminated format string

    format_number db `%d\0`    ; zero-terminated format string

section .bss
    number1 resq 1      ; reserve static memory for first number (64-bit)
    number2 resq 1      ; reserve static memory for second number (64-bit)
    sum resq 1          ; reserve static memory for sum (64-bit)

section .text
main:
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
    mov rbx, [number2]          ; load second number
    add rax, rbx                ; add numbers
    mov [sum], rax              ; store sum

    ; print sum
    mov rax, 0
    mov rdi, message_sum
    mov rsi, [sum]
    call printf

    ; exit program
    mov eax, 0                  ; exit code: 0 for success
    ret
