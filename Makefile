# Dan's template Makefile for C programs under FreeBSD

BIN = CTemplate
SRC = main.c world.c
OBJ = $(SRC:.c=.o)

# Compiler
CC = clang18

# Includes and Libs
INCS =
LIBS = -lm

# Flags
CPPFLAGS = -D_GNU_SOURCE
CFLAGS = -std=c23 -Wall $(INCS) $(CPPFLAGS)
LDFLAGS = $(LIBS)
DEBUG = -glldb -Og
RELEASE = -O3

#NOTE: Set default build below, or use -D BUILD_RELEASE/BUILD_DEBUG
.ifdef BUILD_RELEASE
CFLAGS += ${RELEASE}
.elifdef BUILD_DEBUG
CFLAGS += ${DEBUG}
.else
CFLAGS += ${DEBUG}
.endif

#NOTE: Use -D BUILD_VERBOSE to get clang verbose build output
.ifdef BUILD_VERBOSE
CFLAGS += -v
.endif

all: $(BIN)

.PATH: ../src

.SUFFIXES: .o .c
.c.o:
	$(CC) $(CFLAGS) -c $(.IMPSRC)


$(BIN): $(OBJ)
	$(CC) -o $(.TARGET) $(.ALLSRC)

clean:
	rm -rv *.o $(BIN)

.PHONY: all clean
