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

OP : ( '>' | '<' | '>=' | '<=' | '=' | '==' | '!=' | '&&' | '||' | '+' | '-' | '*' | '/' | '%' ) ;

//WS_ : (' ' | '\n' ) ;
WS_ : (' ' | '\n' | '\t' ) -> skip;

SL_COMMENT : '//' (~'\n')* '\n' -> skip;

NUMBERLITERAL : ('-'|'+')?(NUMBER)+((','|'.')(NUMBER)+)?;
CHAR : '\''(ESC|LETTER|'\\t'|'\\\\'|NUMBER ~('"'))'\'' ;
//STRING : '"' (~'"'|~'\''|' '|~'\''|CHAR|ESC)* '"';
//STRING : '"' (ID|CHAR)* '"';
STRING: '"' (ESC|ID|NUMBER|OP|' '|','|'.'|';'|':'|'?'|'!'|'\\'|','|',' ~('"'))* '"' ;
HEX : '0x' (NUMBER|'a'..'f'|'A'..'F')+ ;
PEV : ';';
VIRGU : ',';
IF : 'if';
ELSE : 'else';
CALLOUT : 'callout';
CLASS : 'class';
INT : 'int';
RETURN : 'return';
VOID : 'void';
FOR : 'for';
BOOLEAN : 'boolean';
BOOLEANOS : ('true'|'false');
BREAK : 'break';
CONTINUE : 'continue';
LBRACK : '[';
RBRACK : ']';
LPAREN : '(';
RPAREN : ')';
ID  : (~'0'..'9')('_' | LETTER) ('_' | LETTER |'0'..'9'(~'.'))*;

fragment
ESC :  '\\'('n'|'t'|'f'|'r'|'b'|'x'|'\\'|'\"'|'\'');


fragment NUMBER: ['0'..'9'];
fragment LETTER: ('a'..'z'|'A'..'Z');
