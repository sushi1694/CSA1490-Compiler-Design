%{
#include <stdio.h>
%}

%%
"if"|"else"|"while"    { printf("Keyword: %s\n", yytext); }
[a-zA-Z_][a-zA-Z0-9_]* { printf("Identifier: %s\n", yytext); }
%%

int main() {
    printf("Enter code to analyze:\n");
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}