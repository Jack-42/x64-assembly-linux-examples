;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; This program asks the user for a number n,
; adds all numbers from 1 to n and prints the result.
; It uses functions of the C standard library.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; declare entry point for linker
global main

; declare C library functions
extern printf
extern scanf

section .data
    message_n db `Enter a number n: \0`
    message_sum db `The sum from 1 to %lld is %lld.\n\0`

    format_n db `%lld\0`

section .bss
    n resq 1
    sum resq 1

section .text
main:
    ; align the stack
    sub rsp, 8

    ; ask user for number n
    mov rax, 0                      ; no vector registers
    mov rdi, message_n              ; address of format string
    call printf

    ; read number n
    mov rax, 0                      ; no vector registers
    mov rdi, format_n               ; address of format string
    mov rsi, n                      ; address of first param
    call scanf

    ; add numbers from 1 to n
    mov rax, 0                      ; init sum
    mov rcx, 1                      ; init counter
add_loop_check:
    ; if counter > n then exit loop
    cmp rcx, [n]                    
    jg add_loop_exit
add_loop_body:
    add rax, rcx                    ; add counter to sum
    inc ecx                         ; increment counter
    jmp add_loop_check              ; continue loop
add_loop_exit:
    mov [sum], rax                  ; store sum

    ; print sum
    mov rax, 0                      ; no vector registers
    mov rdi, message_sum            ; address of format string
    mov rsi, [n]                    ; first param
    mov rdx, [sum]                  ; second param
    call printf

    ; align the stack
    add rsp, 8

    ; exit program
    mov rax, 0                      ; exit code: 0 for success
    ret
