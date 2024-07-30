%{
#include <stdio.h>

void validate_dob(const char* dob) {
    printf("Valid DOB: %s\n", dob);
}
%}

%%

[0-3][0-9].[0-1][0-9].[0-9]{4} {
    validate_dob(yytext);
}
%%

int main() {
    yylex();
    return 0;
}
int yywrap(){
	return 1;

}