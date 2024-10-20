build:
	g++ main.cpp -c
	g++ my_lib.cpp -c
	g++ main.o my_lib.o -o main

execute:
	main.exe

clean:
	del *.exe
	del *.o