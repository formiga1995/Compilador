parser grammar DecafParser;

@header {
package decaf;
}

options
{
  language=Java;
  tokenVocab=DecafLexer;
}

//program: TK_class ID LCURLY RCURLY EOF;
program: CLASS ID LCURLY (stmnt | metodo)* RCURLY EOF;
block: LCURLY (LPAREN stmnt RPAREN)* RCURLY;
stmnt: declaracao;
type: INT | BOOLEAN;
declaracao: type ID (LBRACK (NUMBER) RBRACK)? (EQUAL ( NUMBER | STRING | CHAR))? PEV;
declaracao_metodo: (type | VOID) ID LPAREN (type ID (VIRGULA type ID)*)? RPAREN; 
metodo: declaracao_metodo block;
