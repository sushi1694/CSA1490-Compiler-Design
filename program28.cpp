#include <stdio.h>
#include <string.h>

int main() {
    char input[100];
    printf("Enter an operator: ");
    scanf("%s", input);

    if (strcmp(input, "+") == 0 || strcmp(input, "-") == 0 ||
        strcmp(input, "*") == 0 || strcmp(input, "/") == 0) {
        printf("Valid arithmetic operator: %s\n", input);
    } else {
        printf("Not a valid arithmetic operator.\n");
    }

    return 0;
}

