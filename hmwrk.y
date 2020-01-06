%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <fcntl.h>
#include <unistd.h>
extern FILE* yyin;
extern char* yytext;
extern int yylineno;
int fd;
char buffer[100];
%}
%union {
int intval;
char* strval;
}
%token <strval>ID STARTCLASS ENDCLASS STARTFCT ENDFCT BGIN END VARS <strval>FCT CLASS <intval>NR String LOOP <strval>TIP <strval>ARRAYTYPE STARTSTR ENDSTR CHARTYPE RET <strval>ASSIGN PLUS OR AND MULTIPLY DIVIDE MODULO MINUS CONCAT LENGTH DECL FUNC CTRL LOOPF LOOPW OPR; 
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

fct: ID '(' TIP ID ')' { snprintf(buffer,100,"%s (%s %s) \n",$1,$3,$4); write(fd, buffer, strlen(buffer));}
   | ID '(' ')' { snprintf(buffer,100,"%s() \n",$1); write(fd, buffer, strlen(buffer));}
   ;

functii: STARTFCT func_block ENDFCT
	   ;

func_block: fct '{' int_func_block '}'
		      | fct '{' int_func_block '}' func_block
		      ;

int_func_block: TIP ID ASSIGN val
			  | RET NR
			  | RET ID
			  | CTRL
			  | LOOP
              ;

mainblock: BGIN main END
         ;

main: var
    | fct
    | RET NR
    | RET ID
    | var main
    | fct_main main
    | if
    | while
    | for
    | if main
    | while main
    | for main
    ;

fct_main: ID '(' ID ')' { snprintf(buffer,100,"%s (%s) \n",$1,$3); write(fd, buffer, strlen(buffer));}
   | ID '(' ')' { snprintf(buffer,100,"%s() \n",$1); write(fd, buffer, strlen(buffer));}
   ;

var: TIP ID { snprintf(buffer,100,"%s %s \n",$1,$2); write(fd, buffer, strlen(buffer));}
   | TIP ID ASSIGN NR { snprintf(buffer,100,"%s %s %s %d \n",$1,$2,$3,$4); write(fd, buffer, strlen(buffer));}
   | TIP ID ASSIGN ID { snprintf(buffer,100,"%s %s %s %s \n",$1,$2,$3,$4); write(fd, buffer, strlen(buffer));}
   | TIP ID var
   | ARRAYTYPE ID ASSIGN '[' arrays ']' { snprintf(buffer,100,"%s %s %s \n",$1,$2,$3); write(fd, buffer, strlen(buffer));}
   | val
   ;

val: NR
   | ID
   ;

arrays : array
       | array ',' arrays
       ;

array : NR { snprintf(buffer,100,"[%d] ",$1); write(fd, buffer, strlen(buffer));}
      | ID { snprintf(buffer,100,"[%s] ",$1); write(fd, buffer, strlen(buffer));}
      ;

if: CTRL '(' ID OPR ID ')' '{' main '}'
  | CTRL '(' NR OPR NR ')' '{' main '}'
  | CTRL '(' ID OPR NR ')' '{' main '}'
  | CTRL '(' NR OPR ID ')' '{' main '}'
  ;

for: LOOPF ID ':' NR ',' NR '{' main '}'
   | LOOPF ID ':' ID ',' NR '{' main '}'
   | LOOPF ID ':' NR ',' ID '{' main '}'
   | LOOPF ID ':' ID ',' ID '{' main '}'
   ;

while: LOOPW '(' ID OPR ID ')' '{' main '}'
     | LOOPW '(' NR OPR NR ')' '{' main '}'
     | LOOPW '(' ID OPR NR ')' '{' main '}'
     | LOOPW '(' NR OPR ID ')' '{' main '}'
     ;

%%
int yyerror(char * s){
printf("eroare: %s la linia:%d\n",s,yylineno);
}

int main(int argc, char** argv){
fd = open ("symbol_table.txt", O_RDWR);
yyin=fopen(argv[1],"r");
yyparse();

} 