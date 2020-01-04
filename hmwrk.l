%{
#include <stdio.h>
#include "y.tab.h"
%}
%%
"int"|"float"|"char"|"string"|"bool" {return TIP;}
"BEGIN" {return BGIN;}
"END" {return END;}
"array" {return ARRAYTYPE;}
"string" {return CHARTYPE;}
@[_a-zA-Z][_a-zA-Z0-9]* {return ID;}
"=" {return ASSIGN;}
"+" {return PLUS;}
"-" {return MINUS;}
"*" {return MULTIPLY;}
"/" {return DIVIDE;}
"%" {return MODULO;}
"||" {return OR;}
"&&" {return AND;}

-?[1-9][0-9]* {return NR;}
[ \t] ;
\n {yylineno++;}
. {return yytext[0];}

 