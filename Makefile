CC = gcc
YACC = yacc -v
LEX = lex
.PHONY: all
.SUFFIXES: .c .l .y .o .h

all: project

project: y.tab.o lex.yy.o
	$(CC) $(CLIBS) -o $@ $^

%: %.o
	$(CC) $(CLIBS) -o $@ $^

.c.o:
	$(CC) $(CLIBS) -c $<

y.tab.c: PP.y nodeFunctions.c
	$(YACC) -d $<

lex.yy.c: PP.l
	$(LEX) $<

clean:
	rm y.tab.c
	rm y.tab.h
	rm *.o
	rm *.output
	rm lex.yy.c
	rm project

CC=gcc
CFLAGS:= -std=gnu99
LDFLAGS:= -lfl
SRCS = $(wildcard *.l)

PROGS = $(patsubst %.auto.l,%,$(SRCS))

all: $(PROGS)

%: %.auto.l %.auto.y
	bison --file-prefix=$@.auto.y -d $@.auto.y
	$(CC) $(CFLAGS) -c -o $@.auto.y.o $@.auto.y.tab.c
	flex -o $@.auto.c $< 
	$(CC) $(CFLAGS) -c -o $@.auto.o $@.auto.c $(LDFLAGS)
	$(CC) $(CFLAGS) -o $@ $@.auto.o $@.auto.y.o

clean :
	rm -f *.tab.*

