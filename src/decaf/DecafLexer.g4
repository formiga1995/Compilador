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

<<<<<<< HEAD
WS_ : (' ' | '\n' );
=======
WS_ : (' ' | '\n' ) ;
>>>>>>> 2af3f212c7e50fd6755a45a1d7846cf0c2172bef
//WS_ : (' ' | '\n' ) -> skip;

SL_COMMENT : '//' (~'\n')* '\n' -> skip;
//SL_COMMENT : '//' (~'\n')* '\n';

CHAR : '\'' (ESC|~'\''|'\\t'|'\\\\'|'\'') '\'';
STRING : '"' (ESC|~'"')* '"';

fragment
ESC :  '\\' ('n'|'"');
