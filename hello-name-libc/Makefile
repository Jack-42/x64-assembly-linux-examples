all:
	nasm -f elf64 hello-name-libc.asm -o hello-name-libc.o
	gcc hello-name-libc.o -o hello-name-libc

clean:
	rm hello-name-libc.o hello-name-libc
