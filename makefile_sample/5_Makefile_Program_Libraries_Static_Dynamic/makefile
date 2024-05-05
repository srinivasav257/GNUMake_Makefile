CC = gcc
CFLAGS = -Wall -g -I.
#LD_LIBRARY_PATH = "./"

all : hello1.exe hello2.exe hello3.exe
	./hello1.exe
	./hello2.exe
	./hello3.exe

hello1.exe : hello.c hello_world.o
	$(CC) $(CFLAGS) -o $@ $^

hello2.exe : hello.c hello_world.a
	$(CC) $(CFLAGS) -o $@ $^

hello3.exe : hello.c hello_world.so
	#$(CC) $(CFLAGS) -o $@ $^ -L. -lhello_world.so
	#$(CC) $(CFLAGS) -o $@ $^ -L./ -lhello_world

hello_world.o : hello_world.c Helloworld.h
	$(CC) $(CFLAGS) -c hello_world.c

hello_world.a: hello_world.o
	ar rcs hello_world.a hello_world.o

hello_world.so:
	$(CC) $(CFLAGS) -fPIC -shared -o $@ hello_world.c
clean:
	rm *.o *.a *.so hello1.exe hello2.exe hello3.exe