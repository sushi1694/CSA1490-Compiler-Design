%{
#include<stdio.h>
void validate(const char* email){
	printf("email is valid: %s\n",email);
}
%}

%%
[a-zA-z0-9]+@gmail.com {validate(yytext);}
%%

int main(void){
	yylex();
	return 0;
}

int yywrap(){
	return 1;
}