#ifndef TOKENS_H
#define TOKENS_H

namespace token {

enum TokenType {
    // Keywords
    If, Else, While, For, Do, Return,
    Break, Continue, Switch, Case, Default,
    Int, Float, Char, Double, Long, Short,
    Void, Bool, Signed, Unsigned,
    Const, Static, Struct, Enum, Typedef, Sizeof,
    True, False,
    Read, Print,
    
    // Identifiers and Literals
    Identifier,
    IntLiteral, FloatLiteral, DoubleLiteral,
    LongLiteral, LongLongLiteral,
    StringLiteral, CharLiteral,
    
    // Arithmetic Operators
    Plus, Minus, Multiply, Divide, Modulo,
    Increment, Decrement,
    
    // Comparison Operators
    Equal, NotEqual,
    LessThan, GreaterThan,
    LessEqual, GreaterEqual,
    
    // Logical Operators
    LogicalAnd, LogicalOr, LogicalNot,
    
    // Bitwise Operators
    BitwiseAnd, BitwiseOr, BitwiseXor, BitwiseNot,
    LeftShift, RightShift,
    
    // Assignment Operators
    Assign,
    PlusAssign, MinusAssign, MultiplyAssign, DivideAssign, ModuloAssign,
    
    // Delimiters
    Semicolon, Comma, Dot,
    LeftParen, RightParen,
    LeftBrace, RightBrace,
    LeftBracket, RightBracket,
    
    Unknown
};

}

#endif