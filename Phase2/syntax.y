%{
 #include <stdio.h>
 #include <stdlib.h>
 #include <string.h>
 void yyerror(const char *msg);
 extern int currLine;
 extern int currPos;
 //extern int yylex();
 FILE * yyin;

%}

%union{
  double dval;
  int ival;
  char* sval;
}

%%

Program: function | 


function -> function identifier ; beginparams loopdeclarations enpdarams 


loopdeclarations -> Declaration ; | Declaration ; declarations


Declaration -> identifier loopidentifier : integer | identifier : integer | identifier : uloopnumber integer | identifier loopidentifier  

loopidentifier ->  

loopnumber -> [ number ] of   

 %%
 
 int main(int argc, char **argv) {
    if (argc > 1) {
       yyin = fopen(argv[1], "r");
       if (yyin == NULL){
          printf("syntax: %s filename\n", argv[0]);
       }//end if
    }//end if
    yyparse(); // Calls yylex() for tokens.
    return 0;
 }
 
 void yyerror(const char *msg) {
    printf("** Line %d, position %d: %s\n", currLine, currPos, msg);
 }
