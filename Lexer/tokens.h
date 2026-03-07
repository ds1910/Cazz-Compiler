#ifndef TOKENS_H
#define TOKENS_H

namespace token {

enum TokenType {
    // Keywords
    If, Else, While, For, Main,
    
    // Data Types
    Int, Real, Char, Bool,
    
    // Boolean Values
    True, False,
    
    // Identifiers and Literals
    Identifier,
    IntLiteral, RealLiteral,
    CharLiteral,
    
    // Arithmetic Operators
    Plus, Minus, Multiply, Divide, Modulo,
    
    // Logical Operators
    LogicalAnd, LogicalOr, LogicalNot,
    
    // Comparison Operators
    Equal, NotEqual,
    LessThan, GreaterThan,
    LessEqual, GreaterEqual,
    
    // Assignment Operators
    Assign,
    
    // Delimiters
    Semicolon, Comma,
    LeftParen, RightParen,
    LeftBrace, RightBrace,
    
    Unknown
};

}

#endif