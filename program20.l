%{
#include<stdio.h>
%}

%%
\<[^>]*\> { fprintf(yyout, "%s\n", yytext); }
%%

int main()
{
yyin=fopen("sample.html","w");
yyout=fopen("HTML.txt","w");
yylex();
return 0;
}

int yywrap()
{
return 1;
}