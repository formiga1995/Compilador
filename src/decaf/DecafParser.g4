parser grammar DecafParser;

@header {
package decaf;
}

options
{
  language=Java;
  tokenVocab=DecafLexer;
}

program: TK_class ID LCURLY RCURLY EOF;
block: LCURLY '(' stmnt ')'* RCURLY;
stmnt: declaracao;
type: INT | BOOLEAN;
declaracao_metodo: (type | VOID) ID '(' type ID + ',' ')' block;
declaracao: type ID (NUMBER | STRING | CHAR) PEV;


