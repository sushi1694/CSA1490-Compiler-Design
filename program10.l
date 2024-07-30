%{
#include <stdio.h>

void validate(const char* url) {
    printf("URL is valid: %s\n", url);
}
%}

%%

(http|https)://[a-zA-Z0-9]+\.com { validate(yytext); }

%%

int main(void) {
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}
