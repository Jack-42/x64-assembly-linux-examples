APP_NAME = hello-name-libc

all:
	mkdir -p build
	nasm -f elf64 $(APP_NAME).asm -o build/$(APP_NAME).o
	gcc -no-pie build/$(APP_NAME).o -o build/$(APP_NAME)

clean:
	rm -rf build
