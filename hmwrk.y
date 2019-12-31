	%{
#include <stdio.h>
extern FILE* yyin;
extern char* yytext;
extern int yylineno;
%}
%token ID STARTCLASS ENDCLASS STARTFCT ENDFCT BEGIN END VARS FCT CLASS NR STRING LOOP TIP; 
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

clase: STARTCLASS class_block ENDCLASS
	 ;

class_block: var
		   | fct
		   | var class_block
		   | fct class_block
		   ;

var: TIP ID
   | TIP ID '=' ID
   | TIP ID ',' var
   ;

fct: ID '(' var ')'
   | ID '(' ')'
   ;

functii: STARTFCT func_block ENDFCT
	   ;

func_block: ID '(' ')' '{' int_func_block '}'
		  | ID '(' var ')' '{' int_func_block '}'
		  ;

int_func_block: var
			  | 


%%
int yyerror(char * s){
printf("eroare: %s la linia:%d\n",s,yylineno);
}

int main(int argc, char** argv){
yyin=fopen(argv[1],"r");
yyparse();
} 