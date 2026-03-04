# 🔥 Cazz-Compiler

A comprehensive lexical analyzer (lexer) for a C-like programming language, built using Flex and C++. This project implements the first phase of a compiler: tokenization.

## 📋 Table of Contents
- [Overview](#overview)
- [Features](#features)
- [Project Structure](#project-structure)
- [Requirements](#requirements)
- [Installation](#installation)
- [Usage](#usage)
- [Token Types](#token-types)
- [Examples](#examples)
- [License](#license)

## 🎯 Overview

CazzLexer is a lexical analyzer that reads source code and breaks it down into meaningful tokens. It follows the **longest match rule** - when multiple patterns match, it selects the longest one. This lexer recognizes all standard C language constructs including keywords, operators, literals, identifiers, and comments.

## ✨ Features

### **Keywords** (34 total)
- **Control Flow**: `if`, `else`, `while`, `for`, `do`, `switch`, `case`, `default`, `break`, `continue`, `return`
- **Data Types**: `int`, `float`, `char`, `double`, `long`, `short`, `void`, `bool`, `signed`, `unsigned`
- **Type Modifiers**: `const`, `static`
- **Advanced**: `struct`, `enum`, `typedef`, `sizeof`
- **Boolean Literals**: `true`, `false`
- **I/O**: `read`, `print`

### **Operators**
- **Arithmetic**: `+`, `-`, `*`, `/`, `%`, `++`, `--`
- **Comparison**: `==`, `!=`, `<`, `>`, `<=`, `>=`
- **Logical**: `&&`, `||`, `!`
- **Bitwise**: `&`, `|`, `^`, `~`, `<<`, `>>`
- **Assignment**: `=`, `+=`, `-=`, `*=`, `/=`, `%=`

### **Literals**
- **Integer**: `123`, `0`, `-456`
- **Long**: `1000L`, `1000l`
- **Long Long**: `999999LL`, `999999ll`
- **Float**: `3.14f`, `2.5F`
- **Double**: `3.14159`, `2.718d`, `2.718D`
- **String**: `"Hello World"`, `"C++ Compiler"`
- **Character**: `'a'`, `'Z'`, `'\n'`

### **Delimiters & Symbols**
- **Punctuation**: `;`, `,`, `.`
- **Parentheses**: `(`, `)`
- **Braces**: `{`, `}`
- **Brackets**: `[`, `]`

### **Comments**
- **Single-line**: `// comment`
- **Multi-line**: `/* comment */`

### **Identifiers**
- Variable names, function names: `[a-zA-Z_][a-zA-Z0-9_]*`

## 📁 Project Structure

```
Cazz-Compiler/
├── LICENSE                 # MIT License
├── README.md              # This file
└── Lexer/
    ├── flex.l             # Flex lexer specification (CazzLexer)
    ├── tokens.h           # Token type definitions
    └── test.c             # Sample test file
```

## 🛠️ Requirements

### Software Dependencies
- **Flex**: Version 2.6.4 or higher
- **G++/GCC**: Version 6.3.0 or higher (MinGW on Windows)
- **Bison** (optional): For future parser development

### Platforms Supported
- Windows (MinGW/MSYS2)
- Linux
- macOS

## 📦 Installation

### On Windows (MSYS2/MinGW64)

1. **Install MSYS2** (if not already installed)
   ```bash
   # Download from https://www.msys2.org/
   ```

2. **Install Flex, GCC, and Bison**
   ```bash
   pacman -S flex gcc bison
   ```

3. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/Cazz-Compiler.git
   cd Cazz-Compiler/Lexer
   ```

### On Linux/macOS

```bash
# Ubuntu/Debian
sudo apt-get install flex g++ bison

# macOS
brew install flex gcc bison

# Clone repository
git clone https://github.com/yourusername/Cazz-Compiler.git
cd Cazz-Compiler/Lexer
```

## 🚀 Usage

### Building the Lexer

```bash
cd Cazz-Compiler/Lexer

# Generate C++ code from flex specification
flex -o lex.yy.cpp flex.l

# Compile the generated code
g++ lex.yy.cpp -o lexer.exe

# On Linux/macOS, omit .exe extension
g++ lex.yy.cpp -o lexer
```

### Running the Lexer

#### Option 1: Read from file
```bash
./lexer.exe < test.c
# or
./lexer < test.c  # Linux/macOS
```

#### Option 2: Interactive mode
```bash
./lexer.exe

# Type code interactively, then:
# - Windows: Press Ctrl+Z then Enter
# - Linux/macOS: Press Ctrl+D
```

#### Option 3: Pipe input
```bash
echo "int x = 10;" | ./lexer.exe
```

## 🎨 Token Types

The lexer outputs tokens in the following format:

```
TOKEN_NAME: value  (for identifiers and literals)
TOKEN_NAME         (for keywords, operators, symbols)
```

### Example Output
Input:
```c
int x = 10;
```

Output:
```
INT
IDENTIFIER: x
ASSIGN
INT_LITERAL: 10
SEMICOLON
```

## 📝 Examples

### Example 1: Simple Program
```c
// test.c
int main() {
    int x = 10;
    float pi = 3.14f;
    char* msg = "Hello";
    
    if (x >= 5 && x <= 20) {
        x = x + 1;
        x++;
    }
    
    for (int i = 0; i < 10; i++) {
        print(i);
    }
    return 0;
}
```

### Example 2: Operators Test
```c
int a = 5, b = 3;
int sum = a + b;
int diff = a - b;
bool result = (a == b) || (a > b);
a += 10;
b--;
```

### Example 3: Bitwise Operations
```c
int mask = 0xFF & 0x0F;
int shifted = mask << 2;
int inverted = ~mask;
```

## 🏗️ Implementation Details

### Prefix Customization
The lexer uses the prefix `Cazz` for all generated functions:
- `Cazzlex()` - Main lexer function
- `Cazztext` - Current token text
- `Cazzwrap()` - End-of-file handler

### Longest Match Rule
The lexer implements the **longest match rule**: when multiple patterns can match, it selects the longest matching pattern. For example:
- `>=` is recognized as `GREATER_EQUAL`, not `>` followed by `=`
- `++` is recognized as `INCREMENT`, not two `PLUS` operators
- Keywords like `if` are matched before checking if they're identifiers

### Pattern Priority
Patterns are matched in order of definition:
1. Comments (ignored)
2. Keywords (exact matches)
3. Operators (multi-character first, then single)
4. Literals (specific to general)
5. Identifiers (last, to avoid matching keywords)

## 🔮 Future Development

- [ ] Parser implementation (syntax analysis)
- [ ] Semantic analyzer
- [ ] Intermediate code generation
- [ ] Code optimization
- [ ] Target code generation
- [ ] Error recovery and reporting
- [ ] Symbol table management
- [ ] Support for preprocessor directives

## 📜 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

Copyright (c) 2026 dinesh_sharma

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## 👨‍💻 Author

**dinesh_sharma**

## 🙏 Acknowledgments

- Flex and Bison documentation
- Compiler design principles from "Compilers: Principles, Techniques, and Tools" (Dragon Book)
- Open source community for tools and inspiration

---

**Note**: This is an educational project demonstrating compiler construction principles. The lexer follows standard C language tokenization rules with some custom I/O keywords (`read`, `print`) for simplicity.