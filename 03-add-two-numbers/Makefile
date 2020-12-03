APP_NAME = add-two-numbers

all: pre-build $(APP_NAME).o
	gcc -m64 -no-pie -O0 build/$(APP_NAME).o -o build/$(APP_NAME)

pre-build:
	mkdir -p build
	
$(APP_NAME).o: $(APP_NAME).asm
	nasm -f elf64 -O0 $(APP_NAME).asm -o build/$(APP_NAME).o

clean:
	rm -rf build
