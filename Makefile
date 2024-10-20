build: main.o my_lib.o
	g++ main.o my_lib.o -o main

main.o:
	g++ main.cpp -c

my_lib.o:
	g++ my_lib.cpp -c

execute:
	main.exe

clean:
	del *.exe
	del *.o