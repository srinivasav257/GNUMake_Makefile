all: hello.exe	
	./out/hello.exe
	objcopy -O ihex out/hello.exe out/hello.hex

hello.exe: hello.o
	gcc -Iinc -o out/hello.exe out/hello.o out/hello_world.o	

hello.o: src/hello.c src/hello_world.c inc/Helloworld.h out
	gcc -Iinc -E src/hello.c > out/hello.i	
	gcc -Iinc -S out/hello.i -o out/hello.s	
	gcc -Iinc -c src/hello.c -o out/hello.o
	gcc -Iinc -c src/hello_world.c -o out/hello_world.o

out : 
	mkdir out
	  
.PHONY : clean
clean:
	 #rm -rf out/hello.i out/hello.s out/hello.o out/hello.exe out/hello.hex
	 rm -rf out/**
