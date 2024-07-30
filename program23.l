%{
#include <stdio.h>
#include <stdlib.h>
%}

%%
"int"|"float"|"double"|"char"|"void" { printf("Keyword: %s\n", yytext); }
"if"|"else"|"while"|"for"|"return" { printf("Keyword: %s\n", yytext); }
[a-zA-Z_][a-zA-Z0-9_]* { printf("Identifier: %s\n", yytext); }
[0-9]+ { printf("Number: %s\n", yytext); }
"="|"+"|"-"|"*"|"/" { printf("Operator: %s\n", yytext); }
"(" { printf("Left Parenthesis: %s\n", yytext); }
")" { printf("Right Parenthesis: %s\n", yytext); }
"{" { printf("Left Brace: %s\n", yytext); }
"}" { printf("Right Brace: %s\n", yytext); }
";" { printf("Semicolon: %s\n", yytext); }
[ \t\n]+ ; // Ignore whitespace
. { printf("Unknown character: %s\n", yytext); }
%%

int yywrap(void) {
    return 1;
}

int main(int argc, char **argv) {
    if (argc > 1) {
        FILE *file = fopen(argv[1], "r");
        yyin = file;
    }
    yylex();
    return 0;
}