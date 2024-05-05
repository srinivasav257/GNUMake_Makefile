CC = gcc
CFLAGS = -Wall -I$(HEADER_DIR)
TRAGET_EXE = hello

OBJ = hello.o hello_world.o
OBJ_PATH = out/hello.o out/hello_world.o

DEPS = inc/Helloworld.h
HEADER_DIR = inc/

OBJ_EXT    = .o
C_EXT      = .c
HEADER_EXT = .h

#-------------------------make Rule starts from here------------------------------------------

$(TRAGET_EXE): hello.exe
	./out/hello.exe

hello.exe: $(OBJ)
	$(CC) $(CFLAGS) -o out/hello.exe $(OBJ_PATH)

hello.o: src/hello.c src/hello_world.c $(HEADER) out
	$(CC) $(CFLAGS) -c src/hello.c -o out/hello.o
	
hello_world.o: src/hello_world.c $(HEADER) out
	$(CC) $(CFLAGS) -c src/hello_world.c -o out/hello_world.o

out :
	mkdir out

.PHONY : clean
clean:
	 rm -rf out/**
