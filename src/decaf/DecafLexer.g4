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

//WS_ : (' ' | '\n' ) ;
WS_ : (' ' | '\n' ) -> skip;

SL_COMMENT : '//' (~'\n')* '\n' -> skip;

NUMBER : ('-'|'+')?('0'..'9')+(','('0'..'9')+)?;
CHAR : '\''(ESC|'a'..'z'|'A'..'Z'|'\\t'|'\\\\'|'0'..'9')'\'' ;
//STRING : '"' (~'"'|~'\''|' '|~'\''|CHAR|ESC)* '"';
//STRING : '"' (ID|CHAR)* '"';
STRING: '"' (ESC|[a-zA-Z0-9 ]|~'"') '"';
HEX : '0x' ('0'..'9'|'a'..'f'|'A'..'F')+;
OP : ( '>' | '<' | '>=' | '<=' | '==' | '!=' | '&&' | '||' | '+' | '-' | '*' | '/' | '%' );

IF : 'if';
ELSE : 'else';
BOOLEAN : 'boolean';
BOOLEANOS : ('true'|'false');
BREAK : 'break';
CONTINUE : 'continue';

fragment
ESC :  '\\' ('n'|'t'|'\"'|'\''|'\\'~'A'..'Z'|~'a'..'z');
