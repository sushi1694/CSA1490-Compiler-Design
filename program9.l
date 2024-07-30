%{
#include<stdio.h>
#include<string.h>
int max =0;

%}

%%
[a-zA-Z]+ {
	int len = yyleng;
	if(len > max){
		max = len;
	}
}
%%

int main(void){
	yylex();
	printf("longest length of words:%d\n",max);
	return 0;
}

int yywrap(){
	return 1;
}