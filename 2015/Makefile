CC=gcc
CFLAGS=-Werror
LDFLAGS=-march=native -znoexecstack -no-pie

BIN=d1/d1
OBJ=%.o%$(BIN)

all: $(BIN)

%.o: %.asm
	nasm ${CFLAGS} -g -f elf64 -o $@ $<

clean:
	$(RM) ${BIN} %.o

.PHONY: all clean
