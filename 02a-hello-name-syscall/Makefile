all:
	mkdir -p build
	nasm -f elf64 hello-name.asm -o build/hello-name.o
	ld build/hello-name.o -o build/hello-name

clean:
	rm -rf build
