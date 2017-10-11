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
actionpv: ( declare | atribuicao |return_stmt) PEV;

declare: type ID (array)?;
method: ( type | VOID ) ID method_args block;
method_call: ID args;

args: LPAREN ( expression ( VIRGULA expression )* )? RPAREN;
method_args: LPAREN (( type | VOID )ID)? ( VIRGULA ( type | VOID )ID )* RPAREN ;
block: LCURLY action* RCURLY;
array: LBRACK expression RBRACK;

numero: ID array;

atribuicao: ID EQUAL expression;
expression: (value( OP value )* (OPLPAREN expression RPAREN)? | LPAREN expression RPAREN);
value: (NUMBER | ID | numero | method_call);
return_stmt: RETURN expression;
condition: expression COND expression;

if_stmt: IF LPAREN condition* RPAREN block else_stmt?; 
else_stmt: ELSE LPAREN condition* RPAREN block;
