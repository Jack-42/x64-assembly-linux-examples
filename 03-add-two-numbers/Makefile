all:
	mkdir -p build
	nasm -f elf64 add-two-numbers.asm -o build/add-two-numbers.o
	gcc -no-pie build/add-two-numbers.o -o build/add-two-numbers

clean:
	rm -rf build
