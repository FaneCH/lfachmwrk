rm -rf lex.yy.c y.tab.c y.tab.h symbol_table.txt
touch symbol_table.txt
flex hmwrk.l
yacc -d hmwrk.y
gcc lex.yy.c y.tab.c -lfl -ly -o exe
