# Define the C++ and C compilers and compiler flags
CXX = g++
CC = gcc
CXXFLAGS = -Wall -std=c++17
CFLAGS = -Wall -std=c11

# Add include directories
INC_DIRS = Source/inc GtesFramwork\googletest\googletest\include\gtest
INC_FLAGS = $(addprefix -I, $(INC_DIRS))

CXXFLAGS += $(INC_FLAGS)
CFLAGS += $(INC_FLAGS)

# Define the target executables
TARGET = build/hello_world
TEST_TARGET = build/run_tests

# Define the source file directories
SRC_DIRS = Source/src
TEST_DIR = Test
BUILD_DIR = build
OBJ_DIR = $(BUILD_DIR)/obj

# Collect all source files from the source directories
CPP_SRCS = $(wildcard $(SRC_DIRS)/*.cpp)
C_SRCS = $(wildcard $(SRC_DIRS)/*.c)
TEST_CPP_SRCS = $(wildcard $(TEST_DIR)/*.cpp)
TEST_C_SRCS = $(wildcard $(TEST_DIR)/*.c)

# Define the object files
CPP_OBJS = $(addprefix $(OBJ_DIR)/, $(notdir $(CPP_SRCS:.cpp=.o)))
C_OBJS = $(addprefix $(OBJ_DIR)/, $(notdir $(C_SRCS:.c=.o)))
OBJS = $(CPP_OBJS) $(C_OBJS)
TEST_CPP_OBJS = $(addprefix $(OBJ_DIR)/, $(notdir $(TEST_CPP_SRCS:.cpp=.o)))
TEST_C_OBJS = $(addprefix $(OBJ_DIR)/, $(notdir $(TEST_C_SRCS:.c=.o)))
TEST_OBJS = $(TEST_CPP_OBJS) $(TEST_C_OBJS)

# Default target to build the executable
all: $(TARGET)

# Target to build the executable with unit tests
ut: CXXFLAGS += --coverage
ut: CFLAGS += --coverage
ut: $(TEST_TARGET)

# Target to build the main executable
$(TARGET): $(OBJS) | $(BUILD_DIR)
	$(CXX) $(CXXFLAGS) -o $(TARGET) $(OBJS)

# Target to build and run tests with coverage
$(TEST_TARGET): $(OBJS) $(TEST_OBJS) | $(BUILD_DIR)
	$(CXX) $(CXXFLAGS) --coverage -o $(TEST_TARGET) $(OBJS) $(TEST_OBJS)
	./$(TEST_TARGET)
	gcovr -r .

# Rule to build C++ object files
$(OBJ_DIR)/%.o: $(SRC_DIRS)/%.cpp | $(OBJ_DIR)
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Rule to build C object files
$(OBJ_DIR)/%.o: $(SRC_DIRS)/%.c | $(OBJ_DIR)
	$(CC) $(CFLAGS) -c $< -o $@

# Rule to build test C++ object files
$(OBJ_DIR)/%.o: $(TEST_DIR)/%.cpp | $(OBJ_DIR)
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Rule to build test C object files
$(OBJ_DIR)/%.o: $(TEST_DIR)/%.c | $(OBJ_DIR)
	$(CC) $(CFLAGS) -c $< -o $@

# Create build directory
$(BUILD_DIR):
	mkdir -p $@

# Create object directory
$(OBJ_DIR):
	mkdir -p $@

# Clean rule to remove built files
clean:
	rm -rf $(BUILD_DIR) *.gcda *.gcno *.gcov

# Phony targets
.PHONY: all ut clean

#############################################################################################################################################
# Reference: https://devdocs.io/gnu_make-manual/
#
# Explanation:
# Directory and Source File Definitions:
# 
# SRC_DIRS: Directory for main source files.
# TEST_DIR: Directory for test source files.
# BUILD_DIR: Directory for the build artifacts.
# OBJ_DIR: Directory for the object files.
# Source and Object Files:
# 
# CPP_SRCS, C_SRCS: Lists of C++ and C source files in the main source directory.
# TEST_CPP_SRCS, TEST_C_SRCS: Lists of C++ and C source files in the test directory.
# CPP_OBJS, C_OBJS: Lists of object files corresponding to the main source files.
# TEST_CPP_OBJS, TEST_C_OBJS: Lists of object files corresponding to the test source files.
# OBJS: Combined list of all object files for the main executable.
# TEST_OBJS: Combined list of all object files for the test executable.
# Targets and Rules:
# 
# all: Default target to build the main executable.
# ut: Target to build the test executable with coverage flags and run it.
# $(TARGET): Rule to link the main executable.
# $(TEST_TARGET): Rule to link the test executable and run it with coverage.
# Rules to build object files from source files, ensuring they are placed in the $(OBJ_DIR) directory.
# Directory Creation:
# 
# Targets to create the BUILD_DIR and OBJ_DIR if they don't exist.
# Clean:
# 
# clean: Removes the build directory and any generated coverage files.
# Usage
# Compile Main Executable:
# 
# bash
# Copy code
# make
# This command compiles all source files and links them into build/hello_world.
# 
# Compile and Run Unit Tests:
# make ut
# This command compiles the source and test files with coverage flags, links them into build/run_tests, and runs the tests. It also generates
# coverage reports using gcovr.
# 
# Clean:
# make clean
# This command removes the build directory and any generated coverage files.
# 
# By following these steps and using the revised Makefile, you should be able to compile your project correctly, 
# placing all object files directly into the build/obj directory and ensuring that the unit tests are built and run successfully.
#
#################################################################################################################################################