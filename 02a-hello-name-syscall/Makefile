APP_NAME = hello-name-syscall

all:
	mkdir -p build
	nasm -f elf64 $(APP_NAME).asm -o build/$(APP_NAME).o
	ld build/$(APP_NAME).o -o build/$(APP_NAME)

clean:
	rm -rf build
