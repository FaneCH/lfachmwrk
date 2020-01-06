/* A Bison parser, made by GNU Bison 3.5.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2019 Free Software Foundation,
   Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* Undocumented macros, especially those whose name start with YY_,
   are private implementation details.  Do not rely on them.  */

#ifndef YY_YY_Y_TAB_H_INCLUDED
# define YY_YY_Y_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    ID = 258,
    STARTCLASS = 259,
    ENDCLASS = 260,
    STARTFCT = 261,
    ENDFCT = 262,
    BGIN = 263,
    END = 264,
    VARS = 265,
    FCT = 266,
    CLASS = 267,
    NR = 268,
    String = 269,
    LOOP = 270,
    TIP = 271,
    ARRAYTYPE = 272,
    STARTSTR = 273,
    ENDSTR = 274,
    CHARTYPE = 275,
    RET = 276,
    ASSIGN = 277,
    PLUS = 278,
    OR = 279,
    AND = 280,
    MULTIPLY = 281,
    DIVIDE = 282,
    MODULO = 283,
    MINUS = 284,
    CONCAT = 285,
    LENGTH = 286,
    DECL = 287,
    FUNC = 288,
    CTRL = 289,
    LOOPF = 290,
    LOOPW = 291,
    OPR = 292
  };
#endif
/* Tokens.  */
#define ID 258
#define STARTCLASS 259
#define ENDCLASS 260
#define STARTFCT 261
#define ENDFCT 262
#define BGIN 263
#define END 264
#define VARS 265
#define FCT 266
#define CLASS 267
#define NR 268
#define String 269
#define LOOP 270
#define TIP 271
#define ARRAYTYPE 272
#define STARTSTR 273
#define ENDSTR 274
#define CHARTYPE 275
#define RET 276
#define ASSIGN 277
#define PLUS 278
#define OR 279
#define AND 280
#define MULTIPLY 281
#define DIVIDE 282
#define MODULO 283
#define MINUS 284
#define CONCAT 285
#define LENGTH 286
#define DECL 287
#define FUNC 288
#define CTRL 289
#define LOOPF 290
#define LOOPW 291
#define OPR 292

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
union YYSTYPE
{
#line 13 "hmwrk.y"

int intval;
char* strval;

#line 136 "y.tab.h"

};
typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
