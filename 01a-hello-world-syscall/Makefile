APP_NAME = hello-world-syscall

all: pre-build $(APP_NAME).o
	ld build/$(APP_NAME).o -o build/$(APP_NAME)
	
pre-build:
	mkdir -p build
	
$(APP_NAME).o: $(APP_NAME).asm
	nasm -f elf64 -O0 $(APP_NAME).asm -o build/$(APP_NAME).o

clean:
	rm -rf build
