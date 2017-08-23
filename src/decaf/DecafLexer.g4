lexer grammar DecafLexer;

@header {
package decaf;
}

options
{
  language=Java;
}

tokens
{
  TK_class
}

LCURLY : '{';
RCURLY : '}';

ID  :
  ('a'..'z' | 'A'..'Z')+;

WS_ : (' ' | '\n' );
//WS_ : (' ' | '\n' ) -> skip;

SL_COMMENT : '//' (~'\n')* '\n' -> skip;
//SL_COMMENT : '//' (~'\n')* '\n';

CHAR : '\'' (ESC|~'\''|'\\t'|'\\\\') '\'';
STRING : '"' (ESC|~'"')* '"';

fragment
ESC :  '\\' ('n'|'"'|''');
