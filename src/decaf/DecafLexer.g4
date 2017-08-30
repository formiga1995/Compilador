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
//WS_ : (' ' | '\n' ) ;
WS_ : (' ' | '\n' ) -> skip;
=======
<<<<<<< HEAD
WS_ : (' ' | '\n' );
=======
WS_ : (' ' | '\n' ) ;
>>>>>>> 2af3f212c7e50fd6755a45a1d7846cf0c2172bef
//WS_ : (' ' | '\n' ) -> skip;
>>>>>>> fdac7e98be86b1caf190b812ad897784d5523bb2

SL_COMMENT : '//' (~'\n')* '\n' -> skip;
//SL_COMMENT : '//' (~'\n')* '\n';

<<<<<<< HEAD
CHAR : '\''(ESC|'a'..'z'|'A'..'Z'|'\\t'|'\\\\')'\'' ;
=======
CHAR : '\'' (ESC|~'\''|'\\t'|'\\\\'|'\'') '\'';
>>>>>>> fdac7e98be86b1caf190b812ad897784d5523bb2
STRING : '"' (ESC|~'"')* '"';

fragment
ESC :  '\\' ('n'|'t'|'"'|'\''|'\\'~'p');
