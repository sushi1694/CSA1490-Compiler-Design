%{
#include <stdio.h>
%}

%%

[0-9]+[+\-*/][0-9]+ {
    int a, b;
    char op;
    sscanf(yytext, "%d%c%d", &a, &op, &b);
    switch(op) {
        case '+':
            printf("%d + %d = %d\n", a, b, a + b);
            break;
        case '-':
            printf("%d - %d = %d\n", a, b, a - b);
            break;
        case '*':
            printf("%d * %d = %d\n", a, b, a * b);
            break;
        case '/':
            if (b != 0) {
                printf("%d / %d = %d\n", a, b, a / b);
            } else {
                printf("Division by zero is not allowed.\n");
            }
            break;
    }
}

%%

int main() {
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}
