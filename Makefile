CXX_VERSION = c++17
CXX = g++
CXX_WARNINGS = -Wall -Wextra -Wpedantic
CXXFLAGS = $(CXX_WARNINGS) -std=$(CXX_VERSION)
LDFLAGS =
COMPILE = $(CXX) $(CXXFLAGS)
DEBUG = 1
EXECUTABLE_NAME = main
CXX_OBJECTS = my_lib.o main.o

ifeq ($(DEBUG), 1)
	CXXFLAGS += -g -O0
else
	CXXFLAGS += -O3
endif

.PHONY: build execute clean

build: $(CXX_OBJECTS)
	$(COMPILE) $^ $(LDFLAGS) -o $(EXECUTABLE_NAME)

execute:
	main.exe

clean:
	del *.exe
	del *.o

%.o: %.cpp
	$(COMPILE) -c $< -o $@