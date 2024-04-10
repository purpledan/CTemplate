# Dan's template Makefile for C programs under FreeBSD

SRC := src/main.c src/world.c
OBJS = ${SRC:.c=.o}
CC = clang18

# Includes and Libs
INCS =
LIBS = -lm

# Flags
CPPFLAGS = -D_DEFAULT_SOURCE -D_BSD_SOURCE -D_XOPEN_SOURCE=700
CFLAGS = -std=c23 -pedantic -Wall $(INCS) $(CPPFLAGS)
LDFLAGS = $(LIBS)
DEBUGFLAGS = -o0 
all: CTemplate

CTemplate: $(OBJS)
	$(CC) $(DEBUGFLAGS) $(CFLAGS) -o $(.TARGET) $(.ALLSRC) 

$(OBJS): $(.PREFIX).c 
	$(CC) $(CFLAGS) -c $< -o $@ 


clean:
	rm -rv $(OBJS) CTemplate

.PHONY: all clean
