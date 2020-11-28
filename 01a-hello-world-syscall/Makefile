all:
	nasm -f elf64 hello-world.asm -o hello-world.o
	ld hello-world.o -o hello-world

clean:
	rm -f hello-world.o hello-world
