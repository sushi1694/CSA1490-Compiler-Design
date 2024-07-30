%{
#include<stdio.h>
int vowel=0;
int con=0;
%}

%%
[AEIOUaeiou]+ {vowel++; printf(" vowel:%s", yytext); }
[b-df-hj-np-tv-zB-DF-HJ-NP-TV-Z]+ {con++; printf(" consonants:%s", yytext); }
%%

int main(void){
    printf("Enter any sentence: ");
    yylex();
    printf("Number of vowels: %d\n", vowel);
    printf("Number of consonants: %d\n", con);
    return 0;
}

int yywrap(){
    return 1;
}
