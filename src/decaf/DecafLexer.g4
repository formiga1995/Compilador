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

//WS_ : (' ' | '\n' );
WS_ : (' ' | '\n' ) -> skip;

SL_COMMENT : '//' (~'\n')* '\n' -> skip;
//SL_COMMENT : '//' (~'\n')* '\n';

CHAR : '\'' (ESC|~'\''|'\\t'|'\\\\') '\'';
//STRING : '"' (ESC|~'"'|~'?'|~'\''|'\"')* '"';
STRING : '"' (ESC|[a-zA-Z0-9 ]|~'"')* '"';
HEX: '0x'('0'..'9'|'a'..'f'|'A'..'Z')+;

fragment
ESC :  '\\' ('n'|'"'|'\'');
