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

//declare: type ID (LBRACK (NUMBER | HEX ) RBRACK)? ( EQUAL expression )?;
paramether: type ID;
param: ( type | VOID )ID;
declare: paramether (array)? ( VIRGULA ID (array)? )* ;
method: param method_args block;
method_call: ID args;

args: LPAREN ( expression ( VIRGULA expression )* )? RPAREN;
method_args: LPAREN (param)? ( VIRGULA param )* RPAREN ;
block: LCURLY (action | method)* RCURLY;
blockpv: LCURLY action* RCURLY;
array: LBRACK expression RBRACK;

valor_numero: NUMBER | HEX;

numero: ID array;

atribuicao: (ID | numero) EQUAL expression;
expression: 	value
		| expression (OP|MENOS) expression
		| expression COND expression
		| LPAREN expression RPAREN 
		//| MENOS expression
		| callout_stmt
		| EXCLA expression;
value: (MENOS)? (ID | numero | method_call | valor_numero | CHAR | STRING);
return_stmt: RETURN expression;
condition: expression COND expression;

if_stmt: IF LPAREN condition RPAREN blockpv else_stmt?;
else_stmt: ELSE blockpv;     
for_stmt: FOR atribuicao VIRGULA expression blockpv ;
callout_stmt: CALLOUT LPAREN STRING( VIRGULA expression )* RPAREN;

