section .data
	message db `Hello World!\n`
	length equ $-message

section .text
	global _start

_start:
	; print to stdout (standard output)
	mov rax, 1				; system call id: write
	mov rdi, 1				; file descriptor: stdout
	mov rsi, message		; address of buffer
	mov rdx, length			; size of buffer
	syscall

	; exit program
	mov rax, 60				; syscall id: exit
	mov rdi, 0				; exit code
	syscall
