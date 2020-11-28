all:
	nasm -f elf64 hello-name.asm -o hello-name.o
	ld hello-name.o -o hello-name

clean:
	rm -f hello-name.o hello-name
