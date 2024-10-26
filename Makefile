DEBUG = 1
ENABLE_WARNINGS = 1
WARNING_AS_ERROR = 0
CXX_WARNINGS =
ifeq ($(ENABLE_WARNINGS), 1)
	CXX_WARNINGS = -Wall -Wextra -Wpedantic
endif
ifeq ($(WARNING_AS_ERROR), 1)
	CXX_WARNINGS += -Werror
endif

CXX = g++
CXX_VERSION = c++17

SRC_FOLDER = src
INCLUDE_FOLDER = include
BUILD_FOLDER = build
CXX_SOURCES = $(wildcard $(SRC_FOLDER)/*.cpp)
CXX_OBJECTS = $(patsubst $(SRC_FOLDER)/%.cpp, $(BUILD_FOLDER)/%.o, $(CXX_SOURCES))

ifeq ($(DEBUG), 1)
	CXXFLAGS += -g -O0
	EXECUTABLE_NAME = mainDebug
else
	CXXFLAGS += -O3
	EXECUTABLE_NAME = mainRelease
endif
CPPFLAGS = -I $(INCLUDE_FOLDER)
CXXFLAGS = $(CXX_WARNINGS) -std=$(CXX_VERSION) $(CPPFLAGS)
LDFLAGS =

COMPILE = $(CXX) $(CXXFLAGS)


.PHONY: create build execute clean

create:
	mkdir -p $(BUILD_FOLDER)

build: create $(CXX_OBJECTS)
	$(COMPILE) $(CXX_OBJECTS) $(LDFLAGS) -o $(BUILD_FOLDER)/$(EXECUTABLE_NAME)

execute:
	./$(BUILD_FOLDER)/$(EXECUTABLE_NAME).exe

clean:
	rm -rf $(BUILD_FOLDER)

$(BUILD_FOLDER)/%.o: $(SRC_FOLDER)/%.cpp
	$(COMPILE) -c $< -o $@