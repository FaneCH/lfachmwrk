rm -rf lex.yy.c y.tab.c y.tab.h
flex hmwrk.l
yacc -d hmwrk.y
gcc lex.yy.c y.tab.c -lfl -ly -o exe
