all:
	mkdir -p build
	nasm -f elf64 hello-world-syscall.asm -o build/hello-world-syscall.o
	ld build/hello-world-syscall.o -o build/hello-world-syscall

clean:
	rm -rf build
