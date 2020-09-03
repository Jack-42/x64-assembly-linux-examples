section .data
	message db `Hello World!\n`
	length equ $-message

section .text
	global _start

_start:
	; print to stdout (standard output)
	mov rax, 1			; syscall id: write
	mov rdi, 1			; file descriptor: stdout
	mov rsi, message	; address offer
	mov rdx, length		; number of bytes
	syscall

	; exit program
	mov rax, 60
	mov rdi, 0
	syscall
