%{
#include<stdio.h>
%}
%% 
[0-9]+\.[0-9]+ {printf("%s\n",yytext);}
[0-9]+ {printf("%s\n",yytext);}
.|\n {}
%%
int yywrap(){}
int main(int argc,char *argv[]){
yyin = fopen(argv[1],"r");
yylex();
fclose(yyin);
}