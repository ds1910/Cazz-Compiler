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
        case token::Main: std::cout << "MAIN"; break;
        
        // Data Types
        case token::Int: std::cout << "INT"; break;
        case token::Real: std::cout << "REAL"; break;
        case token::Char: std::cout << "CHAR"; break;
        case token::Bool: std::cout << "BOOL"; break;
        
        // Boolean Values
        case token::True: std::cout << "TRUE"; break;
        case token::False: std::cout << "FALSE"; break;
        
        // Identifiers and Literals
        case token::Identifier: std::cout << "IDENTIFIER: " << text; break;
        case token::IntLiteral: std::cout << "INT_LITERAL: " << text; break;
        case token::RealLiteral: std::cout << "REAL_LITERAL: " << text; break;
        case token::CharLiteral: std::cout << "CHAR_LITERAL: " << text; break;
        
        // Arithmetic Operators
        case token::Plus: std::cout << "PLUS"; break;
        case token::Minus: std::cout << "MINUS"; break;
        case token::Multiply: std::cout << "MULTIPLY"; break;
        case token::Divide: std::cout << "DIVIDE"; break;
        case token::Modulo: std::cout << "MODULO"; break;
        
        // Comparison Operators
        case token::Equal: std::cout << "EQUAL"; break;
        case token::NotEqual: std::cout << "NOT_EQUAL"; break;
        case token::LessThan: std::cout << "LESS_THAN"; break;
        case token::GreaterThan: std::cout << "GREATER_THAN"; break;
        case token::LessEqual: std::cout << "LESS_EQUAL"; break;
        case token::GreaterEqual: std::cout << "GREATER_EQUAL"; break;
        
        // Assignment Operators
        case token::Assign: std::cout << "ASSIGN"; break;
        
        // Delimiters
        case token::Semicolon: std::cout << "SEMICOLON"; break;
        case token::Comma: std::cout << "COMMA"; break;
        case token::LeftParen: std::cout << "LEFT_PAREN"; break;
        case token::RightParen: std::cout << "RIGHT_PAREN"; break;
        case token::LeftBrace: std::cout << "LEFT_BRACE"; break;
        case token::RightBrace: std::cout << "RIGHT_BRACE"; break;
        
        case token::Unknown: std::cout << "UNKNOWN: " << text; break;
    }
    std::cout << std::endl;
}
%}

%option prefix="Cazz"

%%

"if"        { printToken(token::If); }
"else"      { printToken(token::Else); }
"while"     { printToken(token::While); }
"for"       { printToken(token::For); }
"main"      { printToken(token::Main); }

"int"       { printToken(token::Int); }
"real"      { printToken(token::Real); }
"char"      { printToken(token::Char); }
"bool"      { printToken(token::Bool); }

"true"      { printToken(token::True); }
"false"     { printToken(token::False); }

"=="        { printToken(token::Equal); }
"!="        { printToken(token::NotEqual); }
"<="        { printToken(token::LessEqual); }
">="        { printToken(token::GreaterEqual); }
"<"         { printToken(token::LessThan); }
">"         { printToken(token::GreaterThan); }

"="         { printToken(token::Assign); }

"+"         { printToken(token::Plus); }
"-"         { printToken(token::Minus); }
"*"         { printToken(token::Multiply); }
"/"         { printToken(token::Divide); }
"%"         { printToken(token::Modulo); }

";"         { printToken(token::Semicolon); }
","         { printToken(token::Comma); }
"("         { printToken(token::LeftParen); }
")"         { printToken(token::RightParen); }
"{"         { printToken(token::LeftBrace); }
"}"         { printToken(token::RightBrace); }

'([^']|\\')'              { printToken(token::CharLiteral, Cazztext); }

[ \t\n\r]+  { /* ignore whitespace */ }

[0-9]+\.[0-9]+     { printToken(token::RealLiteral, Cazztext); }
[0-9]+             { printToken(token::IntLiteral, Cazztext); }

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