	%{
#include <stdio.h>
extern FILE* yyin;
extern char* yytext;
extern int yylineno;
%}
%token ID STARTCLASS ENDCLASS STARTFCT ENDFCT BGIN END VARS FCT CLASS NR String LOOP TIP ARRAYTYPE STARTSTR ENDSTR CHARTYPE RET ASSIGN PLUS OR AND MULTIPLY DIVIDE MODULO MINUS CONCAT LENGTH DECL FUNC; 
%start program
%%
program: structblock mainblock {printf("program corect sintactic\n");}
       ;

structblock: STARTSTR interior ENDSTR
           ;

interior: clase
        | functii
        | clase interior
        | functii interior
        ;

clase: STARTCLASS class ENDCLASS
	 ;

class: clasa
     | clasa class
     ;

clasa: CLASS ID '{' interior_clasa '}'
     ;

interior_clasa: DECL ':' var
		   | FUNC ':' fct
		   | DECL ':' var interior_clasa
		   | FUNC ':' fct interior_clasa
		   ;

fct: ID '(' TIP var ')'
   | ID '(' ')'
   ;

functii: STARTFCT func_block ENDFCT
	   ;

func_block: fct '{' int_func_block '}'
		      | fct '{' int_func_block '}' func_block
		      ;

int_func_block: TIP ID ASSIGN val
			  | RET NR
			  | RET ID
              ;

mainblock: BGIN main END
         ;

main: var
    | fct
    | RET
    ;

var: TIP ID
   | TIP ID ASSIGN val
   | TIP ID ',' var
   | ARRAYTYPE ID ASSIGN '[' arrays ']'
   | ARRAYTYPE ID ASSIGN '{' arrays '}'
   | val
   ;

val: NR
   | ID
   | arrays
   ;

arrays : array
       | array ',' arrays
       ;

array : NR
      | ID
      ;

%%
int yyerror(char * s){
printf("eroare: %s la linia:%d\n",s,yylineno);
}

int main(int argc, char** argv){
yyin=fopen(argv[1],"r");
yyparse();
} 