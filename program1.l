%{
#include<stdio.h>
%}

%%
[A-Z]+ {printf("this is capital:%s\n",yytext);}
[a-z]+ {printf("this is not capital : %s\n",yytext);}
%%

int main(void){
	yylex();
	return 0;
}

int yywrap(){
	return 1;
}
	