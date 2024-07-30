#include <stdio.h>

int main() {
    int blank_char = 0, tab_char = 0, new_line = 0;
    int c;

    printf("Input some text:\n");
    while ((c = getchar()) != EOF) {
        if (c == ' ') {
            ++blank_char;
        } else if (c == '\t') {
            ++tab_char;
        } else if (c == '\n') {
            ++new_line;
        }
    }

    printf("Blank characters: %d\n", blank_char);
    printf("Tab characters: %d\n", tab_char);
    printf("Newlines: %d\n", new_line);

    return 0;
}

