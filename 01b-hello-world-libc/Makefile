all:
	mkdir -p build
	nasm -f elf64 hello-world-libc.asm -o build/hello-world-libc.o
	gcc -no-pie build/hello-world-libc.o -o build/hello-world-libc

clean:
	rm -rf build
