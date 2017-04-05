all: build

PP.tab.c PP.tab.h: PP.y
	bison -d PP.y

lex.yy.c: PP.l PP.tab.h
	flex PP.l

build: lex.yy.c PP.tab.c PP.tab.h
	gcc -o PP PP.tab.c environ.c lex.yy.c -lfl

clean:
	rm PP PP.tab.c lex.yy.c PP.tab.h
