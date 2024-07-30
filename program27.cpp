#include <stdio.h>
#include <stdbool.h>

bool isSingleLineComment(const char* line) {
    return (line[0] == '/' && line[1] == '/');
}

bool isMultiLineCommentStart(const char* line) {
    return (line[0] == '/' && line[1] == '*');
}

bool isMultiLineCommentEnd(const char* line) {
    return (line[0] == '*' && line[1] == '/');
}

int main() {
    char input[1000];
    printf("Enter a line of code: ");
    fgets(input, sizeof(input), stdin);

    if (isSingleLineComment(input)) {
        printf("Single-line comment detected.\n");
    } else if (isMultiLineCommentStart(input)) {
        printf("Multi-line comment start detected.\n");
    } else if (isMultiLineCommentEnd(input)) {
        printf("Multi-line comment end detected.\n");
    } else {
        printf("Not a comment.\n");
    }

    return 0;
}

