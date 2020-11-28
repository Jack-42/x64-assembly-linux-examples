APP_NAME = add-two-numbers

all: $(APP_NAME).o
	mkdir -p build
	gcc -no-pie build/$(APP_NAME).o -o build/$(APP_NAME)
	
$(APP_NAME).o: $(APP_NAME).asm
	mkdir -p build
	nasm -f elf64 $(APP_NAME).asm -o build/$(APP_NAME).o

clean:
	rm -rf build
