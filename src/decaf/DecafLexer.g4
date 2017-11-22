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
WS_ : (' ' | '\n' | '\t' ) -> skip;

SL_COMMENT : '//' (~'\n')* '\n' -> skip;
//SL_COMMENT : '//' (~'\n')* '\n';




OP: ('+'|'*'|'/'|'%');
COND: ('>'|'<'|'>='|'<='|'=='|'!='|'&&'|'||');
CHAR : '\'' (ESC|'a'..'z'|'A'..'Z'|'0'..'9'|~'\''|'\\t'|'\\\\') '\'';
NUMBER: ('0'..'9')+;

//NUMBER: ('-'|'+')?('0'..'9')+((','|'.')('0'..'9')+)?;
//STRING : '"' (ESC|~'"'|~'?'|~'\''|'\"')* '"';
STRING : '"' (ESC|ID|OP|' '|','|'.'|';'|':'|'?'|'!'|'\\'|',' ~('"')|NUMBER)* '"';
HEX:'0x' ('0'..'9'|'a'..'f'|'A'..'F')+;


EQUAL: '=';

PEV: ';';
VIRGULA: ',';
EXCLA: '!';
MENOS: ('-');
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



ID  :('a'..'z' | 'A'..'Z'|'_')('a'..'z' | 'A'..'Z'|'_'|'0'..'9')*;
//ID: ('_'|LETTER) ('_'|LETTER|NUM)*;
//fragment NUM: [0..9] fragment LETTER: ['a'..'z'|'A'..'Z']

fragment
ESC :  '\\' ('n'|'\"'|'\''|'t'|'r'|'b'|'x');
