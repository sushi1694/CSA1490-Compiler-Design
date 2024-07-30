#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_RULES 100
#define MAX_NAME_LENGTH 50
#define MAX_PRODUCTION_LENGTH 100

typedef struct {
    char name[MAX_NAME_LENGTH];                // Stores the Head of production rule
    char productionRules[MAX_RULES][MAX_PRODUCTION_LENGTH]; // Stores the body of production rules
    int ruleCount;                             // Count of production rules
} NonTerminal;

typedef struct {
    NonTerminal nonTerminals[MAX_RULES];
    int nonTerminalCount;                      // Count of non-terminals
} Grammar;

void initNonTerminal(NonTerminal *nt, const char *name) {
    strcpy(nt->name, name);
    nt->ruleCount = 0;
}

void addRule(NonTerminal *nt, const char *rule) {
    strcpy(nt->productionRules[nt->ruleCount++], rule);
}

void printRule(NonTerminal *nt) {
    printf("%s ->", nt->name);
    for (int i = 0; i < nt->ruleCount; i++) {
        printf(" %s |", nt->productionRules[i]);
    }
    printf("\b \n"); // Remove the last '|'
}

void addNonTerminal(Grammar *grammar, const char *name) {
    initNonTerminal(&grammar->nonTerminals[grammar->nonTerminalCount++], name);
}

void addGrammarRule(Grammar *grammar, const char *rule) {
    char parse[MAX_NAME_LENGTH] = "";
    int nt = 0;

    for (int i = 0; rule[i] != '\0'; i++) {
        char c = rule[i];
        if (c == ' ') {
            if (!nt) {
                addNonTerminal(grammar, parse);
                nt = 1;
                parse[0] = '\0';
            } else if (strlen(parse) > 0) {
                addRule(&grammar->nonTerminals[grammar->nonTerminalCount - 1], parse);
                parse[0] = '\0';
            }
        } else if (c != '|' && c != '-' && c != '>') {
            strncat(parse, &c, 1);
        }
    }
    if (strlen(parse) > 0) {
        addRule(&grammar->nonTerminals[grammar->nonTerminalCount - 1], parse);
    }
}

void inputData(Grammar *grammar) {
    addGrammarRule(grammar, "S -> Sa | Sb | c | d");
}

void solveNonImmediateLR(NonTerminal *A, NonTerminal *B) {
    char newRulesA[MAX_RULES][MAX_PRODUCTION_LENGTH];
    int newRuleCount = 0;

    for (int i = 0; i < A->ruleCount; i++) {
        if (strncmp(A->productionRules[i], B->name, strlen(B->name)) == 0) {
            for (int j = 0; j < B->ruleCount; j++) {
                sprintf(newRulesA[newRuleCount++], "%s", B->productionRules[j]);
                strcat(newRulesA[newRuleCount - 1], A->productionRules[i] + strlen(B->name));
            }
        } else {
            strcpy(newRulesA[newRuleCount++], A->productionRules[i]);
        }
    }
    A->ruleCount = newRuleCount;
    for (int i = 0; i < newRuleCount; i++) {
        strcpy(A->productionRules[i], newRulesA[i]);
    }
}

void solveImmediateLR(Grammar *grammar, NonTerminal *A) {
    char newName[MAX_NAME_LENGTH];
    sprintf(newName, "%s'", A->name);

    char alphas[MAX_RULES][MAX_PRODUCTION_LENGTH];
    char betas[MAX_RULES][MAX_PRODUCTION_LENGTH];
    int alphaCount = 0, betaCount = 0;

    for (int i = 0; i < A->ruleCount; i++) {
        if (strncmp(A->productionRules[i], A->name, strlen(A->name)) == 0) {
            strcpy(alphas[alphaCount++], A->productionRules[i] + strlen(A->name));
        } else {
            strcpy(betas[betaCount++], A->productionRules[i]);
        }
    }

    if (alphaCount == 0) return;

    if (betaCount == 0) {
        addRule(A, newName);
    }

    for (int i = 0; i < betaCount; i++) {
        sprintf(A->productionRules[i], "%s%s", betas[i], newName);
    }

    for (int i = 0; i < alphaCount; i++) {
        sprintf(alphas[i], "%s%s", alphas[i], newName);
    }

    NonTerminal newNonTerminal;
    initNonTerminal(&newNonTerminal, newName);
    for (int i = 0; i < alphaCount; i++) {
        addRule(&newNonTerminal, alphas[i]);
    }
    addRule(&newNonTerminal, "e");
    grammar->nonTerminals[grammar->nonTerminalCount++] = newNonTerminal;
}

void applyAlgorithm(Grammar *grammar) {
    for (int i = 0; i < grammar->nonTerminalCount; i++) {
        for (int j = 0; j < i; j++) {
            solveNonImmediateLR(&grammar->nonTerminals[i], &grammar->nonTerminals[j]);
        }
        solveImmediateLR(grammar, &grammar->nonTerminals[i]);
    }
}

void printRules(Grammar *grammar) {
    for (int i = 0; i < grammar->nonTerminalCount; i++) {
        printRule(&grammar->nonTerminals[i]);
    }
}

int main() {
    Grammar grammar;
    grammar.nonTerminalCount = 0;

    inputData(&grammar);
    applyAlgorithm(&grammar);
    printRules(&grammar);

    return 0;
}


