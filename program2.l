%{
#include<stdio.h>
%}

%%
[0-9]+ {printf("this is a digit: %s\n",yytext);}
[a-zA-Z]+ {printf("this is not a digit : %s\n",yytext);}
%%

int main(void){
	yylex();
	return 0;
}
int yywrap(){
	return 1;
}