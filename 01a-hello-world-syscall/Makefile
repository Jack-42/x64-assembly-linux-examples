all:
	mkdir -p build
	nasm -f elf64 hello-world.asm -o build/hello-world.o
	ld build/hello-world.o -o build/hello-world

clean:
	rm -rf build
