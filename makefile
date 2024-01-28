# C++ Compiler
CXX = armclang++

# Optimised variables
CFLAGS = -Wall -Ofast -mcpu=native
SRC= RiemannSiegel_opti.cpp
BIN= $(SRC:.cpp=)

# parallel variables
CFLAGS_PARA = -Wall -Ofast -armpl=parallel -fopenmp -mcpu=native
SRC_PARA= RiemannSiegel_para.cpp
BIN_PARA= $(SRC_PARA:.cpp=)

# Non-optimised variables
CFLAGS_NO_OPT = -Wall -O
SRC_NO_OPT= RiemannSiegel.cpp
BIN_NO_OPT= $(SRC_NO_OPT:.cpp=)

# "make" => Compile the optimised file
all:
	$(CXX) $(CFLAGS) $(SRC) -o $(BIN)

# "make para" => Compile the parallelized file without post-processing of zeros
para:
	$(CXX) $(CFLAGS_PARA) $(SRC_PARA) -o $(BIN_PARA)

# "make para_post" => Compile the parallelized file with post-processing of zeros
#										(takes a lot of memory to run)
para_post:
	$(CXX) $(CFLAGS_PARA) -DPOST $(SRC_PARA) -o $(BIN_PARA)
para_buffer:
	$(CXX) $(CFLAGS_PARA) -DBUFFER $(SRC_PARA) -o $(BIN_PARA)
# "make no_opt" => Compile the base src file
no_opt:
	$(CXX) $(CFLAGS_NO_OPT)  $(SRC_NO_OPT) -o $(BIN_NO_OPT)

# "make asm" => Outputs the assembly of both files
asm:

	$(CXX) $(CFLAGS) -fverbose-asm $(SRC) -S
	$(CXX) $(CFLAGS_PARA) -DPOST -fverbose-asm $(SRC_PARA) -S
	$(CXX) $(CFLAGS_NO_OPT) -fverbose-asm $(SRC_NO_OPT) -S

# "make debug" => Compile with debug info
debug:
	$(CXX) $(CFLAGS) $(SRC) -g -o $(BIN)

# "make para_g" => Compile parallelized with debug info
para_g:
	$(CXX) $(CFLAGS_PARA) $(SRC_PARA) -g -o $(BIN_PARA)

# "make clean" => Clean build files
clean: 
	rm -rf $(BIN) $(BIN_NO_OPT) $(BIN_PARA) *.o *.i *.s *.ii
