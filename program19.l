%{
#include<stdio.h>
int macro=0;
int header=0;
%}

%%
"#define" {macro++;}
"#include" {header++;}
.|\n 
%%
int yywrap(){}
int main(int argc ,char *argv[0]){
yyin=fopen(argv[1],"r");
yylex();
printf("no of macro is:%d\n",macro);
printf("no of header is:%d\n",header);
fclose(yyin);
}