;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; This program asks the user for their name and greets them.      ;
; It uses Linux system calls.                                     ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

%define SYS_READ 0
%define SYS_WRITE 1
%define SYS_EXIT 60

%define STDIN 0
%define STDOUT 1

%define MAX_NAME_LENGTH 32

global _start   ; make entry point visible to linker

section .data
    question db `What is your name?\n`
    question_length equ $-question
    greeting db `Hello, `
    greeting_length equ $-greeting

section .bss
    name resb MAX_NAME_LENGTH       ; reserve static memory for name

section .text
_start:
    ; ask user for name
    mov rax, SYS_WRITE              ; system call id
    mov rdi, STDOUT                 ; file descriptor
    mov rsi, question               ; address of buffer
    mov rdx, question_length        ; size of buffer
    syscall

    ; read name
    mov rax, SYS_READ               ; system call id
    mov rdi, STDIN                  ; file descriptor
    mov rsi, name                   ; address of buffer
    mov rdx, MAX_NAME_LENGTH        ; size of buffer
    syscall
    push rax                        ; store result = number of bytes read

    ; print greeting
    mov rax, SYS_WRITE              ; system call id
    mov rdi, STDOUT                 ; file descriptor
    mov rsi, greeting               ; address of buffer
    mov rdx, greeting_length        ; size of buffer
    syscall

    ; print name
    mov rax, SYS_WRITE              ; system call id
    mov rdi, STDOUT                 ; file descriptor
    mov rsi, name                   ; address of buffer
    pop rdx                         ; size of buffer (result stored before)
    syscall

    ; exit program
    mov rax, SYS_EXIT               ; system call id
    mov rdi, 0                      ; exit code
    syscall
