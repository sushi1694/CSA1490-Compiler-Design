%{
#include <stdio.h>
void print_word(const char* word) {
    printf("Word: %s\n", word);
}
void print_operator(const char* op) {
    printf("Relational Operator: %s\n", op);
}
%}

%%
[a-zA-Z]+ { print_word(yytext); }
"=="|"!="|"<="|">="|"<"|">" { print_operator(yytext); }
%%

int main() {
    yylex();
    return 0;
}
