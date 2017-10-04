parser grammar DecafParser;

@header {
package decaf;
}

options
{
  language=Java;
  tokenVocab=DecafLexer;
}

//program: TK_class ID LCURLY  RCURLY EOF;
program: CLASS ID LCURLY (stmnt| method)+ RCURLY EOF;
block: LCURLY ((stmnt | declaracao | operation ) PEV )+ RCURLY;
stmnt: declaracao PEV;
type: INT | BOOLEAN;
declaracao: type ID (algo)? ( EQUAL expression )?;
declaracao_method: (type | VOID) ID LPAREN (type ID (VIRGULA type ID)* )? RPAREN;
method: declaracao_method block;
method_call: ID LPAREN (call(VIRGULA call)* )? RPAREN;
call: method_call | expression;
expression: (( (algo | method_call | ID)OP(algo | method_call | ID) ) | ( LPAREN expression RPAREN ))+;
operation: ID EQUAL expression;
algo: ((ID LBRACK ( NUMBER | algo | expression ) RBRACK) | NUMBER ) ;
