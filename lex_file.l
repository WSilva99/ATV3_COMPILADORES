%option noyywrap
%{
    #include <stdio.h>
    #include <string.h>
    #include <math.h>
%}

    // Definições regulares

START_CODE  "start"
END_CODE    "end"
READ        "read"
WRITE       "write"

NUMBER ([0-9]+"."[0-9]*)|("."[0-9]+)|[0-9]+

VARIABLE [a-zA-Z]+([a-zA-Z]|[0-9])*

IGNORE [\ \n\t]*

%%

    // Tokens

{START_CODE}  { return START_CODE; }
{END_CODE}    { return END_CODE; }
{READ}        { return READ; }
{WRITE}       { return WRITE; }

{VARIABLE}    {
    yylval.str = strdup(yytext);
    return VARIABLE;
}

{NUMBER} {
    yylval.real = atof(yytext);
    return NUMBER;
}

[-+/*^~=()] {
    return *yytext;
}

";" { return END_COMMAND; }

{IGNORE} {;}

. {printf("CARACTERE INVALIDO: %s\n", yytext);}

%%

