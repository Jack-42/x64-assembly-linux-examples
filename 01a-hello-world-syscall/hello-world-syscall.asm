;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; This program writes "Hello World!" to standard output.
; It uses Linux system calls.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

%define SYS_WRITE 1
%define SYS_EXIT 60
%define STDOUT 1

; declare entry point for linker
global _start

section .data
    message db `Hello World!\n`
    length equ $-message

section .text
_start:
    ; write to standard output
    mov rax, SYS_WRITE      ; system call id
    mov rdi, STDOUT         ; file descriptor
    mov rsi, message        ; address of buffer
    mov rdx, length         ; size of buffer
    syscall

    ; exit program
    mov rax, SYS_EXIT       ; system call id
    mov rdi, 0              ; exit code: 0 for success
    syscall
