%{
#include <stdio.h>
#include "y.tab.h"
%}
%%
"int"|"float"|"char"|"string"|"bool" {return TIP;}
"BEGIN" {return BGIN;}
"END" {return END;}
"CLS" {return CLASS;}
"DECL" {return DECL;}
"FUNC" {return FUNC;}
"STARTSTR" {return STARTSTR;}
"ENDSTR" {return ENDSTR;}
"STARTCLASS" {return STARTCLASS;}
"ENDCLASS" {return ENDCLASS;}
"STARTFCT" {return STARTFCT;}
"ENDFCT" {return ENDFCT;}
"array" {return ARRAYTYPE;}
"String" {return CHARTYPE;}
@[_a-zA-Z][_a-zA-Z0-9]* {return ID;}
"=" {return ASSIGN;}
"+" {return PLUS;}
"-" {return MINUS;}
"*" {return MULTIPLY;}
"/" {return DIVIDE;}
"%" {return MODULO;}
"||" {return OR;}
"&&" {return AND;}
"concat" {return CONCAT;}
"len" {return LENGTH;}
-?[1-9][0-9]* {return NR;}
[ \t] ;
\n {yylineno++;}
. {return yytext[0];}

 