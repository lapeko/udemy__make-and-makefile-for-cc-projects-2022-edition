CXX_VERSION = c++17
CXX = g++
CXX_WARNINGS = -Wall -Wextra -Wpedantic
CXXFLAGS = $(CXX_WARNINGS) -std=$(CXX_VERSION)
LDFLAGS =
COMPILE = $(CXX) $(CXXFLAGS)
DEBUG = 1
EXECUTABLE_NAME = main

ifeq ($(DEBUG), 1)
	CXXFLAGS += -g -O0
else
	CXXFLAGS += -O3
endif

build: main.o my_lib.o
	$(COMPILE) main.o my_lib.o $(LDFLAGS) -o $(EXECUTABLE_NAME)

main.o:
	$(COMPILE) main.cpp -c

my_lib.o:
	$(COMPILE) my_lib.cpp -c

execute:
	main.exe

clean:
	del *.exe
	del *.o

.PHONY: build main.o my_lib.o execute clean
