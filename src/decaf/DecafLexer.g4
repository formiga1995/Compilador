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

ID  : ('a'..'z' | 'A'..'Z')('a'..'z' | 'A'..'Z' |'_'|'0'..'9')*;

//WS_ : (' ' | '\n' ) ;
<<<<<<< HEAD
WS_ : (' ' | '\n' ) -> skip;

SL_COMMENT : '//' (~'\n')* '\n' -> skip;

CHAR : '\'' (ESC|~'\''|'\\t'|'\\\\') '\'';
//STRING : '"' (ESC|CHAR|~'"')* '"'; 
STRING : '"' (ID|CHAR) '"';
//STRING : '"' (ESC|~'"')* '"';
=======
WS_ : (' ' | '\n' | '\t' ) -> skip;

SL_COMMENT : '//' (~'\n')* '\n' -> skip;

NUMBER : ('-'|'+')?('0'..'9')+((','|'.')('0'..'9')+)?;
CHAR : '\''(ESC|'a'..'z'|'A'..'Z'|'\\t'|'\\\\'|'0'..'9')'\'' ;
//STRING : '"' (~'"'|~'\''|' '|~'\''|CHAR|ESC)* '"';
//STRING : '"' (ID|CHAR)* '"';
STRING: '"' (ESC|ID|NUMBER|OP|' '|','|'.'|';'|':'|'?'|'!'|'\\'|','|',' ~('"'))* '"';
HEX : '0x' ('0'..'9'|'a'..'f'|'A'..'F')+;
OP : ( '>' | '<' | '>=' | '<=' | '=' | '==' | '!=' | '&&' | '||' | '+' | '-' | '*' | '/' | '%' | ';' | ',' );

IF : 'if';
ELSE : 'else';
BOOLEAN : 'boolean';
BOOLEANOS : ('true'|'false');
BREAK : 'break';
CONTINUE : 'continue';
>>>>>>> f922356d1d67177ead092271388277191c39b750

fragment
ESC :  '\\'('n'|'t'|'f'|'r'|'b'|'x'|'\\'|'\"'|'\'');
