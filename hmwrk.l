%{
#include <stdio.h>
#include "y.tab.h"
%}
%%
"/*"(.|\n)+"*/" ;
"int"|"float"|"char"|"string"|"bool" {return TIP;}
"return" {return RET;}
"BEGIN" {return BGIN;}
"END" {return END;}
"CLASS" {return CLASS;}
"decl" {return DECL;}
"func" {return FUNC;}
"STARTSTR" {return STARTSTR;}
"ENDSTR" {return ENDSTR;}
"STARTCLASS" {return STARTCLASS;}
"ENDCLASS" {return ENDCLASS;}
"STARTFCT" {return STARTFCT;}
"ENDFCT" {return ENDFCT;}
"array" {return ARRAYTYPE;}
"String" {return CHARTYPE;}
[A-Za-z][A-Za-z0-9]* {return ID;}
":=" {return ASSIGN;}
"+" {return PLUS;}
"-" {return MINUS;}
"*" {return MULTIPLY;}
"/" {return DIVIDE;}
"%" {return MODULO;}
"||" {return OR;}
"&&" {return AND;}
-?[1-9][0-9]*|0 {return NR;}
[ \t] ;
\n {yylineno++;}
. {return yytext[0];}

 