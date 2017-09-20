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

<<<<<<< HEAD
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
=======



OP: ('>'|'<'|'>='|'<='|'='|'=='|'!='|'&&'|'||'|'+'|'-'|'*'|'/'|'%');
CHAR : '\'' (ESC|'a'..'z'|'A'..'Z'|'0'..'9'|~'\''|'\\t'|'\\\\') '\'';
NUMBER: ('-'|'+')?('0'..'9')+((','|'.')('0'..'9')+)?;
//STRING : '"' (ESC|~'"'|~'?'|~'\''|'\"')* '"';
STRING : '"' (ESC|ID|OP|' '|','|'.'|';'|':'|'?'|'!'|'\\'|',' ~('"')|NUMBER)* '"';
HEX:'0x' ('0'..'9'|'a'..'f'|'A'..'F')+;


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

>>>>>>> 072c233e25cb3e3354a84732c76c11e8fcc7dcc8


<<<<<<< HEAD

fragment NUMBER: ['0'..'9'];
fragment LETTER: ('a'..'z'|'A'..'Z');
=======
ID  :  (~'0'..'9')('a'..'z' | 'A'..'Z'|'_')('a'..'z' | 'A'..'Z'|'_'|'0'..'9')*;
//ID: ('_'|LETTER) ('_'|LETTER|NUMBER)*;
//fragment NUMBER: [0..9] fragment LETTER: ['a'..'z'|'A'..'Z']

fragment
ESC :  '\\' ('n'|'\"'|'\''|'t'|'r'|'b'|'x');
>>>>>>> 072c233e25cb3e3354a84732c76c11e8fcc7dcc8
