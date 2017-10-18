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

action: ( actionpv | actionnopv );
actionpv: ( declare | atribuicao | return_stmt | method_call | callout_stmt | BREAK ) PEV;
actionnopv: (if_stmt | for_stmt );

declare: type ID (LBRACK (NUMBER|HEX) RBRACK)? ( EQUAL expression )?;
method: ( type | VOID ) ID method_args block;
method_call: ID args;

args: LPAREN ( expression ( VIRGULA expression )* )? RPAREN;
method_args: LPAREN (( type | VOID )ID)? ( VIRGULA ( type | VOID )ID )* RPAREN ;
block: LCURLY (action | method)* RCURLY;
blockpv: LCURLY action* RCURLY;
array: LBRACK expression RBRACK;

numero: ID array;

atribuicao: (ID | numero) EQUAL expression;
expression: 	value
		| expression OP expression
		| expression COND expression
		| LPAREN expression RPAREN 
		| MOM expression
		| EXCLA expression;
value: (NUMBER | ID | numero | method_call|HEX|CHAR|STRING);
return_stmt: RETURN expression;
condition: expression COND expression;

if_stmt: IF LPAREN condition RPAREN blockpv else_stmt?;
else_stmt: ELSE blockpv;     
for_stmt: FOR declare VIRGULA expression blockpv ;
callout_stmt: CALLOUT LPAREN STRING VIRGULA STRING ( VIRGULA expression )* RPAREN; 
