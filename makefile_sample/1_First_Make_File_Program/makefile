all: hello.exe	
	./hello.exe
	objcopy -O ihex hello.exe hello.hex

hello.exe: hello.o
	gcc -o hello.exe hello.o	

hello.o: hello.c 
	gcc -E hello.c > hello.i
	gcc -S hello.i
	gcc -c hello.c
    
.PHONY : clean
clean:
	 rm -rf hello.i hello.s hello.o hello.exe hello.hex