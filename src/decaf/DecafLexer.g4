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


//WS_ : (' ' | '\n' );
WS_ : (' ' | '\n' ) -> skip;

SL_COMMENT : '//' (~'\n')* '\n' -> skip;
//SL_COMMENT : '//' (~'\n')* '\n';




OPERADOR: ('>'|'<'|'>='|'<='|'='|'=='|'!='|'&&'|'||'|'+'|'-'|'*'|'/'|'%');
CHAR : '\'' (ESC|'a'..'z'|'A'..'Z'|'0'..'9'|~'\''|'\\t'|'\\\\') '\'';
NUMBER: ('-'|'+')?('0'..'9')+((','|'.')('0'..'9')+)?;
//STRING : '"' (ESC|~'"'|~'?'|~'\''|'\"')* '"';
STRING : '"' (ESC|ID|' '|','|'.'|';'|':'|'?'|'!'|'\\'|',' ~('"')|NUMBER)* '"';
HEX: '0x' ('0'..'9'|'a'..'f'|'A'..'F')+;

PEV: ';';
VIRGULA: ',';
IF: 'if';
ELSE: 'else';
CALLOUT: 'callout';
CLASS: 'class';
INT: 'int';
RETURN: 'return';
VOID: 'void';
FOR: 'for';
BOOLEAN : 'boolean';
BOOLEANOS: ('true'|'false');
BREAK: 'break';
CONTINUE: 'continue';
LBRACK: '[';
RBRACK: ']';
LPAREN: '(';
RPAREN: ')';



ID  :  ('a'..'z' | 'A'..'Z'|'_')('a'..'z' | 'A'..'Z'|'_'|'0'..'9')*;


fragment
ESC :  '\\' ('n'|'\"'|'\''|'t'|'r'|'b'|'x');
