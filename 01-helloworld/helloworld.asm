%define SYS_WRITE 1
%define SYS_EXIT 60
%define STDOUT 1

section .data
	message db `Hello World!\n`
	length equ $-message

section .text
	global _start			; define entry point

_start:
	; print to stdout (standard output)
	mov rax, SYS_WRITE		; system call id
	mov rdi, STDOUT			; file descriptor
	mov rsi, message		; address of buffer
	mov rdx, length			; size of buffer
	syscall

	; exit program
	mov rax, SYS_EXIT		; system call id
	mov rdi, 0				; exit code
	syscall
