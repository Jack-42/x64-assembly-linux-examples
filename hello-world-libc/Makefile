all:
	nasm -f elf64 hello-world-libc.asm
	gcc hello-world-libc.o -o hello-world-libc

clean:
	rm hello-world-libc.o hello-world-libc
