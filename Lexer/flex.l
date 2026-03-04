%{
#include <iostream>
#include "tokens.h"

void printToken(token::TokenType t, const char* text = "") {
    switch(t) {
        // Keywords
        case token::If: std::cout << "IF"; break;
        case token::Else: std::cout << "ELSE"; break;
        case token::While: std::cout << "WHILE"; break;
        case token::For: std::cout << "FOR"; break;
        case token::Do: std::cout << "DO"; break;
        case token::Return: std::cout << "RETURN"; break;
        case token::Break: std::cout << "BREAK"; break;
        case token::Continue: std::cout << "CONTINUE"; break;
        case token::Switch: std::cout << "SWITCH"; break;
        case token::Case: std::cout << "CASE"; break;
        case token::Default: std::cout << "DEFAULT"; break;
        case token::Int: std::cout << "INT"; break;
        case token::Float: std::cout << "FLOAT"; break;
        case token::Char: std::cout << "CHAR"; break;
        case token::Double: std::cout << "DOUBLE"; break;
        case token::Long: std::cout << "LONG"; break;
        case token::Short: std::cout << "SHORT"; break;
        case token::Void: std::cout << "VOID"; break;
        case token::Bool: std::cout << "BOOL"; break;
        case token::Signed: std::cout << "SIGNED"; break;
        case token::Unsigned: std::cout << "UNSIGNED"; break;
        case token::Const: std::cout << "CONST"; break;
        case token::Static: std::cout << "STATIC"; break;
        case token::Struct: std::cout << "STRUCT"; break;
        case token::Enum: std::cout << "ENUM"; break;
        case token::Typedef: std::cout << "TYPEDEF"; break;
        case token::Sizeof: std::cout << "SIZEOF"; break;
        case token::True: std::cout << "TRUE"; break;
        case token::False: std::cout << "FALSE"; break;
        case token::Read: std::cout << "READ"; break;
        case token::Print: std::cout << "PRINT"; break;
        
        // Identifiers and Literals
        case token::Identifier: std::cout << "IDENTIFIER: " << text; break;
        case token::IntLiteral: std::cout << "INT_LITERAL: " << text; break;
        case token::FloatLiteral: std::cout << "FLOAT_LITERAL: " << text; break;
        case token::DoubleLiteral: std::cout << "DOUBLE_LITERAL: " << text; break;
        case token::LongLiteral: std::cout << "LONG_LITERAL: " << text; break;
        case token::LongLongLiteral: std::cout << "LONG_LONG_LITERAL: " << text; break;
        case token::StringLiteral: std::cout << "STRING_LITERAL: " << text; break;
        case token::CharLiteral: std::cout << "CHAR_LITERAL: " << text; break;
        
        // Arithmetic Operators
        case token::Plus: std::cout << "PLUS"; break;
        case token::Minus: std::cout << "MINUS"; break;
        case token::Multiply: std::cout << "MULTIPLY"; break;
        case token::Divide: std::cout << "DIVIDE"; break;
        case token::Modulo: std::cout << "MODULO"; break;
        case token::Increment: std::cout << "INCREMENT"; break;
        case token::Decrement: std::cout << "DECREMENT"; break;
        
        // Comparison Operators
        case token::Equal: std::cout << "EQUAL"; break;
        case token::NotEqual: std::cout << "NOT_EQUAL"; break;
        case token::LessThan: std::cout << "LESS_THAN"; break;
        case token::GreaterThan: std::cout << "GREATER_THAN"; break;
        case token::LessEqual: std::cout << "LESS_EQUAL"; break;
        case token::GreaterEqual: std::cout << "GREATER_EQUAL"; break;
        
        // Logical Operators
        case token::LogicalAnd: std::cout << "LOGICAL_AND"; break;
        case token::LogicalOr: std::cout << "LOGICAL_OR"; break;
        case token::LogicalNot: std::cout << "LOGICAL_NOT"; break;
        
        // Bitwise Operators
        case token::BitwiseAnd: std::cout << "BITWISE_AND"; break;
        case token::BitwiseOr: std::cout << "BITWISE_OR"; break;
        case token::BitwiseXor: std::cout << "BITWISE_XOR"; break;
        case token::BitwiseNot: std::cout << "BITWISE_NOT"; break;
        case token::LeftShift: std::cout << "LEFT_SHIFT"; break;
        case token::RightShift: std::cout << "RIGHT_SHIFT"; break;
        
        // Assignment Operators
        case token::Assign: std::cout << "ASSIGN"; break;
        case token::PlusAssign: std::cout << "PLUS_ASSIGN"; break;
        case token::MinusAssign: std::cout << "MINUS_ASSIGN"; break;
        case token::MultiplyAssign: std::cout << "MULTIPLY_ASSIGN"; break;
        case token::DivideAssign: std::cout << "DIVIDE_ASSIGN"; break;
        case token::ModuloAssign: std::cout << "MODULO_ASSIGN"; break;
        
        // Delimiters
        case token::Semicolon: std::cout << "SEMICOLON"; break;
        case token::Comma: std::cout << "COMMA"; break;
        case token::Dot: std::cout << "DOT"; break;
        case token::LeftParen: std::cout << "LEFT_PAREN"; break;
        case token::RightParen: std::cout << "RIGHT_PAREN"; break;
        case token::LeftBrace: std::cout << "LEFT_BRACE"; break;
        case token::RightBrace: std::cout << "RIGHT_BRACE"; break;
        case token::LeftBracket: std::cout << "LEFT_BRACKET"; break;
        case token::RightBracket: std::cout << "RIGHT_BRACKET"; break;
        
        case token::Unknown: std::cout << "UNKNOWN: " << text; break;
    }
    std::cout << std::endl;
}
%}

%option prefix="Cazz"

%%

"//".*                  { /* single-line comment */ }
"/*"([^*]|"\n"|"\*"[^/])*"*/"  { /* multi-line comment */ }

"if"        { printToken(token::If); }
"else"      { printToken(token::Else); }
"while"     { printToken(token::While); }
"for"       { printToken(token::For); }
"do"        { printToken(token::Do); }
"return"    { printToken(token::Return); }
"break"     { printToken(token::Break); }
"continue"  { printToken(token::Continue); }
"switch"    { printToken(token::Switch); }
"case"      { printToken(token::Case); }
"default"   { printToken(token::Default); }
"int"       { printToken(token::Int); }
"float"     { printToken(token::Float); }
"char"      { printToken(token::Char); }
"double"    { printToken(token::Double); }
"long"      { printToken(token::Long); }
"short"     { printToken(token::Short); }
"void"      { printToken(token::Void); }
"bool"      { printToken(token::Bool); }
"signed"    { printToken(token::Signed); }
"unsigned"  { printToken(token::Unsigned); }
"const"     { printToken(token::Const); }
"static"    { printToken(token::Static); }
"struct"    { printToken(token::Struct); }
"enum"      { printToken(token::Enum); }
"typedef"   { printToken(token::Typedef); }
"sizeof"    { printToken(token::Sizeof); }
"true"      { printToken(token::True); }
"false"     { printToken(token::False); }
"read"      { printToken(token::Read); }
"print"     { printToken(token::Print); }

"=="        { printToken(token::Equal); }
"!="        { printToken(token::NotEqual); }
"<="        { printToken(token::LessEqual); }
">="        { printToken(token::GreaterEqual); }
"<<"        { printToken(token::LeftShift); }
">>"        { printToken(token::RightShift); }
"<"         { printToken(token::LessThan); }
">"         { printToken(token::GreaterThan); }

"&&"        { printToken(token::LogicalAnd); }
"||"        { printToken(token::LogicalOr); }
"!"         { printToken(token::LogicalNot); }

"++"        { printToken(token::Increment); }
"--"        { printToken(token::Decrement); }

"+="        { printToken(token::PlusAssign); }
"-="        { printToken(token::MinusAssign); }
"*="        { printToken(token::MultiplyAssign); }
"/="        { printToken(token::DivideAssign); }
"%="        { printToken(token::ModuloAssign); }
"="         { printToken(token::Assign); }

"+"         { printToken(token::Plus); }
"-"         { printToken(token::Minus); }
"*"         { printToken(token::Multiply); }
"/"         { printToken(token::Divide); }
"%"         { printToken(token::Modulo); }

"&"         { printToken(token::BitwiseAnd); }
"|"         { printToken(token::BitwiseOr); }
"^"         { printToken(token::BitwiseXor); }
"~"         { printToken(token::BitwiseNot); }

";"         { printToken(token::Semicolon); }
","         { printToken(token::Comma); }
"."         { printToken(token::Dot); }
"("         { printToken(token::LeftParen); }
")"         { printToken(token::RightParen); }
"{"         { printToken(token::LeftBrace); }
"}"         { printToken(token::RightBrace); }
"["         { printToken(token::LeftBracket); }
"]"         { printToken(token::RightBracket); }

\"([^\"]|\\\")*\"         { printToken(token::StringLiteral, Cazztext); }
'([^']|\\')'              { printToken(token::CharLiteral, Cazztext); }

[ \t\n\r]+  { /* ignore whitespace */ }

[0-9]+[Ll][Ll]           { printToken(token::LongLongLiteral, Cazztext); }
[0-9]+[Ll]              { printToken(token::LongLiteral, Cazztext); }
[0-9]+\.[0-9]+[fF]      { printToken(token::FloatLiteral, Cazztext); }
[0-9]+\.[0-9]+[dD]?     { printToken(token::DoubleLiteral, Cazztext); }
[0-9]+                  { printToken(token::IntLiteral, Cazztext); }

[a-zA-Z_][a-zA-Z0-9_]*   { printToken(token::Identifier, Cazztext); }

.           { printToken(token::Unknown, Cazztext); }

%%

int Cazzwrap() {
    return 1;
}

int main() {
    std::cout << "CazzLexer - Enter code (Ctrl+Z then Enter on Windows to end):" << std::endl;
    Cazzlex();
    return 0;
}