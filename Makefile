CXX_VERSION = c++17
CXX = g++
CXX_WARNINGS = -Wall -Wextra -Wpedantic
CXXFLAGS = $(CXX_WARNINGS) -std=$(CXX_VERSION)
LDFLAGS =
COMPILE = $(CXX) $(CXXFLAGS)
DEBUG = 1
CXX_SOURCES = $(wildcard *.cpp)
CXX_OBJECTS = $(patsubst %.cpp, %.o, $(CXX_SOURCES))

ifeq ($(DEBUG), 1)
	CXXFLAGS += -g -O0
	EXECUTABLE_NAME = mainDebug
else
	CXXFLAGS += -O3
	EXECUTABLE_NAME = mainRelease
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