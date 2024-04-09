# Dan's template Makefile for C programs under FreeBSD

SRC_DIR = src
OBJ_DIR = src
BIN_DIR = .

#Program binary name
BIN = ${BIN_DIR}/program

#SRC := ${$(SRC_DIR)/*.c}
#SRC := $(SRC_DIR)/main.c $(SRC_DIR)/world.c
SRC != ls ${SRC_DIR}/*.c
OBJ := ${SRC:.c=.o}

.PHONY: all clean

all: $(BIN)

$(BIN): $(OBJ)
	$(CC) $(OBJ) -o $@ 

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c
	$(CC)  -c $< -o $@ 

clean:
	rm -rv $(OBJ) $(BIN)

