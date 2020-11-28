all:
	mkdir -p build
	nasm -f elf64 hello-name-libc.asm -o build/hello-name-libc.o
	gcc -no-pie build/hello-name-libc.o -o build/hello-name-libc

clean:
	rm -rf build
