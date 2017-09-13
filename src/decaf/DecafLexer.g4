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

NUMBER : ('-'|'+')?('0'..'9')+((','|'.')('0'..'9')+)? ;
CHAR : '\''(ESC|'a'..'z'|'A'..'Z'|'\\t'|'\\\\'|'0'..'9')'\'' ;
//STRING : '"' (~'"'|~'\''|' '|~'\''|CHAR|ESC)* '"';
//STRING : '"' (ID|CHAR)* '"';
STRING: '"' (ESC|ID|NUMBER|OP|' '|','|'.'|';'|':'|'?'|'!'|'\\'|','|',' ~('"'))* '"' ;
HEX : '0x' ('0'..'9'|'a'..'f'|'A'..'F')+ ;

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
ID  : ('a'..'z' | 'A'..'Z' | '_')('a'..'z' | 'A'..'Z' |'_'|'0'..'9')*;

