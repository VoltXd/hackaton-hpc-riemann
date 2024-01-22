CXX = g++
CFLAGS = -Wall -O -save-temps

SRC= RiemannSiegel.cpp
BIN= $(SRC:.cpp=)

# Runned using "make" only
all:
	$(CXX) $(CFLAGS) $(SRC) -o $(BIN)

# Runned using "make clean"
clean: 
	rm $(BIN) *.o *.i *.s 