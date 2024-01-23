# C++ Compiler
CXX = g++

# Optimised variables
CFLAGS = -Wall -Ofast
SRC= RiemannSiegel_opti.cpp
BIN= $(SRC:.cpp=)


# Non-optimised variables
CFLAGS_NO_OPT = -Wall -O
SRC_NO_OPT= RiemannSiegel.cpp
BIN_NO_OPT= $(SRC_NO_OPT:.cpp=)

# "make" => Compile the optimised file
all:
	$(CXX) $(CFLAGS) $(SRC) -o $(BIN)

# "make no_opt" => Compile the base src file
no_opt:
	$(CXX) $(CFLAGS_NO_OPT) $(SRC_NO_OPT) -o $(BIN_NO_OPT)

# "make clean" => Clean build files
clean: 
	rm -rf $(BIN) $(BIN_NO_OPT) *.o *.i *.s *.ii
