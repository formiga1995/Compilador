parser grammar DecafParser;

@header {
package decaf;
}

options
{
  language=Java;
  tokenVocab=DecafLexer;
}

type: ( BOOLEAN | INT );

//program: TK_class ID LCURLY  RCURLY EOF;
program: CLASS ID block EOF;

action: ( actionpv | method );
actionpv: ( declare ) PEV;

declare: type ID array?;
method: ( type | VOID ) ID method_args block;

method_args: LPAREN (( type | VOID )ID)? ( VIRGULA ( type | VOID )ID )* RPAREN ;
block: LCURLY action* RCURLY;
array: LBRACK NUMBER RBRACK;

if_stmnt: IF block;
