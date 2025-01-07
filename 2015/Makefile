CC=gcc
LDFLAGS=-march=native -nostdlib -static

BIN=1
OBJ=%.o%$(BIN)

all: $(BIN)

%.o: %.asm
	nasm -g -f elf64 -o $@ $<

clean:
	$(RM) $(BIN) %.o

.PHONY: all clean
