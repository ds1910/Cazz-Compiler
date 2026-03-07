# Cazz Compiler - Lexical Analyzer

A simple and efficient lexical analyzer (lexer) for the Cazz programming language. This project is part of a compiler design assignment that breaks down source code into meaningful tokens.

## 👥 Project Team

**Created by:**
- Dinesh Sharma
- Mohammad Zafar
- Satish Kumar Singh

## 📚 What is a Lexical Analyzer?

A lexical analyzer, or lexer for short, is the first component of any compiler. Think of it as a reader that scans through your code character by character and groups them into meaningful chunks called "tokens."

### Simple Example
When you write: `int x = 10;`

The lexer breaks it down into:
- `int` → Keyword (data type)
- `x` → Identifier (variable name)  
- `=` → Assignment operator
- `10` → Integer literal (number)
- `;` → Punctuation (end of statement)

This is similar to how you read English - you don't process individual letters, but rather words and punctuation marks. The lexer does the same for programming languages.

## 🎯 Project Overview

This lexer is designed for the **Cazz language**, a simplified programming language that includes:
- Basic data types (int, real, char, bool)
- Control structures (if, else, while, for)
- Arithmetic and comparison operators
- A clean and minimal syntax

The goal is to make compiler concepts easy to understand while keeping the implementation simple and functional.

## ✨ Features

### Keywords Recognized
Our lexer understands these **9 keywords**:
- `if`, `else` - For conditional statements
- `while`, `for` - For loops
- `main` - Program entry point
- `int`, `real`, `char`, `bool` - Data types
- `true`, `false` - Boolean values

### Operators Supported
**Arithmetic Operators:**
- `+` (addition), `-` (subtraction), `*` (multiplication)
- `/` (division), `%` (modulo/remainder)

**Comparison Operators:**
- `==` (equal to), `!=` (not equal to)
- `<` (less than), `>` (greater than)
- `<=` (less than or equal), `>=` (greater than or equal)

**Assignment:**
- `=` (assign value)

### Literals (Values)
- **Integers**: `10`, `255`, `0`
- **Real numbers**: `3.14`, `2.718`, `0.5`
- **Characters**: `'a'`, `'Z'`, `'1'`
- **Booleans**: `true`, `false`

### Delimiters
- `;` (semicolon - ends statements)
- `,` (comma - separates items)
- `( )` (parentheses - for conditions and function calls)
- `{ }` (braces - code blocks)

### Identifiers
Variable names and function names that start with a letter or underscore, followed by letters, digits, or underscores. Examples: `x`, `sum`, `total_count`, `_temp`

## 🏗️ Project Structure

```
Cazz-Compiler/
├── README.md           # This file - project documentation
├── lexer.exe          # Compiled lexer program (ready to run)
└── Lexer/
    ├── test.cz        # Sample Cazz program for testing
    ├── tokens.h       # Token definitions (reference)
    └── flex.l         # Lexer specification file
```

## 🔬 How It Works - The Theory

### Phase 1: Character Reading
The lexer reads your source code one character at a time, like reading a book letter by letter.

### Phase 2: Pattern Matching
It uses **regular expressions** to identify patterns:
- If it sees digits like `123`, it knows it's a number
- If it sees letters like `abc`, it checks if it's a keyword or identifier
- If it sees `==`, it knows it's a comparison operator

### Phase 3: Token Generation
Once a pattern is matched, the lexer creates a token with:
- **Type**: Is it a keyword, operator, or number?
- **Value**: What's the actual text? (for identifiers and literals)
- **Line number**: Where did we find it? (for error reporting)

### Phase 4: Output
The lexer outputs all tokens in a format that the next phase of the compiler (the parser) can understand.

### Example Flow
```
Input: int x = 5;

Step 1: Read 'i', 'n', 't' → Recognize keyword "int"
Step 2: Read space → Ignore
Step 3: Read 'x' → Recognize identifier "x"
Step 4: Read '=' → Recognize assignment operator
Step 5: Read '5' → Recognize integer literal "5"
Step 6: Read ';' → Recognize semicolon

Output:
[Line:1] KEYWORD: int
[Line:1] IDENTIFIER: x
[Line:1] ASSIGNMENT_OPERATOR: =
[Line:1] INTEGER: 5
[Line:1] PUNCTUATION: ;
```

## 🚀 How to Run

### For Windows Users (MINGW64 Terminal)

1. **Navigate to the project folder:**
```bash
cd /c/Users/YourName/Desktop/compiler/Cazz-Compiler
```

2. **Run the lexer with the test file:**
```bash
./lexer.exe < Lexer/test.cz
```

3. **Or create your own Cazz file and test it:**
```bash
./lexer.exe < your_program.cz
```

### Understanding the Output

When you run the lexer, you'll see output like:
```
[Line:1] KEYWORD: int
[Line:1] KEYWORD: main
[Line:1] OPEN_BRACE: (
[Line:1] CLOSE_BRACE: )
[Line:1] OPEN_BRACE: {
[Line:2] KEYWORD: int
[Line:2] IDENTIFIER: x
[Line:2] ASSIGNMENT_OPERATOR: =
[Line:2] INTEGER: 10
[Line:2] PUNCTUATION: ;
...
```

Each line shows:
- **Line number**: Where the token appears in your code
- **Token type**: What kind of token it is
- **Value**: The actual text (for identifiers and literals)

## 📝 Sample Cazz Program

Here's a simple program you can test (saved in `Lexer/test.cz`):

```c
int main() {
    int x = 10;
    real pi = 3.14;
    char ch = 'A';
    bool flag = true;
    
    if (x < 20) {
        x = x + 5;
    }
    
    while (x > 0) {
        x = x - 1;
    }
}
```

## 🧪 Testing Your Own Code

You can create a new `.cz` file with your own Cazz code and test it:

1. Create a file (e.g., `mycode.cz`)
2. Write some Cazz code using the supported keywords and operators
3. Run: `./lexer.exe < mycode.cz`
4. Check the token output!

## 📖 Assignment Learning Objectives

Through this project, we learned:

1. **Compiler Basics**: Understanding how compilers work from the ground up
2. **Pattern Recognition**: Using regular expressions to identify code patterns
3. **Token Design**: Deciding what information a token should carry
4. **Error Handling**: Recognizing invalid characters and reporting errors
5. **Language Design**: Making choices about what features a language should have
6. **C Programming**: Building a practical tool using C
7. **Testing**: Creating test cases to verify the lexer works correctly

## 🎓 Key Concepts Explained

### What is a Token?
A token is the smallest meaningful unit in a programming language. Just like words in English, tokens are the building blocks of code.

### Why Keep It Simple?
We deliberately kept the Cazz language simple to focus on understanding the core concepts without getting overwhelmed. Real compilers (like GCC or Clang) handle hundreds of keywords and complex rules, but the fundamental principles are the same.

### The Longest Match Rule
When the lexer can match multiple patterns, it always chooses the longest one. For example, when it sees `>=`, it recognizes it as one "greater than or equal" operator rather than `>` followed by `=`.

### Whitespace and Comments  
The lexer ignores spaces, tabs, and newlines (except for counting line numbers). This is why you can write code with any spacing style you like!

## 🔧 Technical Details

**Language**: C  
**Implementation**: Hand-written lexical analyzer  
**Input**: Source code files (.cz extension)  
**Output**: Sequence of tokens with line numbers  
**Token Format**: `[Line:N] TYPE: value`

## 🎯 Future Enhancements

This lexer is just the beginning. Future phases could include:
1. **Parser**: Build a syntax tree from the tokens
2. **Semantic Analyzer**: Check for logical errors (like using undeclared variables)
3. **Code Generator**: Produce executable machine code
4. **Optimization**: Make the generated code run faster

## 💡 Conclusion

Building a lexer from scratch gives you a deep appreciation for how programming languages work. Every time you write code and hit "run," a lexer just like this one is breaking down your code into tokens. Now you know exactly how that works!

---

**Project Type**: Compiler Design Assignment  
**Phase**: Lexical Analysis (Phase 1)  
**Status**: Completed ✅  

For questions or suggestions, feel free to reach out to any team member!
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