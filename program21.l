%{
#include <stdio.h>
int line_num = 1;
%}

%%
\n       { printf("%d %s", line_num++, yytext); }
.|\t     { printf("%s", yytext); }
%%

int main(int argc, char *argv[]) {
    FILE *in = fopen(argv[1], "r");
    yyin = in;
    yylex();
    fclose(in);
    return 0;
}

int yywrap(){
	return 1;
}