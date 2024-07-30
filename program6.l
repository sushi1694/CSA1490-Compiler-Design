%{
#include<stdio.h>
int pos=0;
int neg=0;
%}

%%
^[-][0-9]+ {neg++; printf(" negative number:%s", yytext); }
[0-9]+ {pos++; printf("positive number:%s", yytext); }
%%

int main(void){
    printf("Enter any num w space: ");
    yylex();
    printf("Number of pos: %d\n", pos);
    printf("Number of neg: %d\n", neg);
    return 0;
}

int yywrap(){
    return 1;
}