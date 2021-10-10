%{
    // Definições em C
    #include <stdio.h>
    #include <stdlib.h>
    #include <math.h>
    #include "hash.h"
    
    variablesTable* var_table;

    int yylex();

    void yyerror (char *s) {
        printf("%s\n", s);
    }

%}

%union {
    float real;
    char* str;
}

%token START_CODE
%token END_CODE
%token READ
%token WRITE
%token <str>VARIABLE
%token <real>NUMBER
%token END_COMMAND

%type  <real>EXPRESSION
%type  <real>VALUE


%left '+' '-'
%left '*' '/'
%left '^' '~'

%%

PROGRAM: START_CODE CODE END_CODE;

CODE: COMMANDS END_COMMAND CODE
    | ;

COMMANDS: VARIABLE '=' EXPRESSION {
        insertVariable(var_table, $1, $3);
    }
    | READ '(' VARIABLE ')' {
        float aux;
        scanf("%f", &aux);
        insertVariable(var_table, $3, aux);
    }
    | WRITE '(' EXPRESSION ')' {
        printf("%.2f\n", $3);
    };

EXPRESSION: EXPRESSION '+' EXPRESSION {
        $$ = $1 + $3;
    }
    | EXPRESSION '-' EXPRESSION {
        $$ = $1 - $3;
    }
    | EXPRESSION '*' EXPRESSION {
        $$ = $1 * $3;
    }
    | EXPRESSION '/' EXPRESSION {
        $$ = $1 / $3;
    }
    | EXPRESSION '^' EXPRESSION {
        $$ = pow($1, $3);
    }
    | '~' EXPRESSION {
        $$ = sqrt($2);
    }
    | VARIABLE {
        variable* var = findVariable(var_table, $1);
        $$ = var->value;
    }
    | VALUE {
        $$ = $1;
    };

VALUE: NUMBER {
        $$ = $1;
    };

%%

#include "lex.yy.c"

int main() {
    var_table = createTable(CAPACITY);
    yyin=fopen("example_code.es", "r");
    yyparse();
    yylex();
    fclose(yyin);
    freeTable(var_table);
    return 0;
}