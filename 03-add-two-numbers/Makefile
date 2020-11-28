all:
	nasm -f elf64 add-two-numbers.asm -o add-two-numbers.o
	gcc -no-pie add-two-numbers.o -o add-two-numbers

clean:
	rm -f add-two-numbers.o add-two-numbers
