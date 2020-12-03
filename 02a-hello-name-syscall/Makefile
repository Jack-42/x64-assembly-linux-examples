APP_NAME = hello-name-syscall

all: pre-build $(APP_NAME).o
	ld build/$(APP_NAME).o -o build/$(APP_NAME)

pre-build:
	mkdir -p build
	
$(APP_NAME).o: $(APP_NAME).asm
	nasm -f elf64 $(APP_NAME).asm -o build/$(APP_NAME).o

clean:
	rm -rf build
