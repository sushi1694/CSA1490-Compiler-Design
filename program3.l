%{
#include<stdio.h>
%}

%%
^[7-9][0-9]{9}$ {printf("this is a valid mobile number: %s\n",yytext);}
[0-9]+ {printf("this is not valid: %s\n",yytext);}
%%

int main(void){
	yylex();
	return 0;
}

int yywrap(){
	return 1;	
}