CC = gcc
CFLAGS = -Wall -I.
TRAGET_EXE = hello

SRC_LIST := $(wildcard *.c)   #This cmd will get list of source files present in current directory
OBJ_LIST := $(patsubst %.c,%.o,$(wildcard *.c)) #This cmd will generate .obj files with source file names having .c
#OBJ_LIST := $(SRC_LIST: .c =.o)

#-------------------------make Rule starts from here------------------------------------------

$(TRAGET_EXE): $(OBJ_LIST)
	@echo "source files : $(SRC_LIST)"
	@echo "Obj files    : $(OBJ_LIST)"
	$(CC) $(CFLAGS) -o $@ $^
	./hello.exe

hello_world.o : hello_world.c
	#gcc ./*c -o hello.exe -I.
	$(CC) $(CFLAGS) -c $^
	
hello.o : hello.c
	#gcc ./*c -o hello.exe -I.
	$(CC) $(CFLAGS) -c $^	

.PHONY : clean
clean:
	 rm *.exe
