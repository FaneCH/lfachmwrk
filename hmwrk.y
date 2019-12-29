	%{
#include <stdio.h>
extern FILE* yyin;
extern char* yytext;
extern int yylineno;
%}
%token ID STARTCLASS ENDCLASS STARTFCT ENDFCT BEGIN END VARS FCT CLASS NR STRING LOOP; 
%start program
%%
s: program: {printf("program corect sintactic\n");}

program: structblock mainblock
       ;

structblock: STARTSTR interior ENDSTR
           ;

interior: clase
        | functii
        | clase interior
        | functii interior
        ;

clase: STARTCLASS 

%%
int yyerror(char * s){
printf("eroare: %s la linia:%d\n",s,yylineno);
}

int main(int argc, char** argv){
yyin=fopen(argv[1],"r");
yyparse();
} 