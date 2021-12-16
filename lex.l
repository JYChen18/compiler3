%{
    #include"yacc.tab.h"
    void yyerror(const char*);
    int lineno = 1;
%}

integer     (-)?[0-9]+
name_string [a-zA-Z_]([a-zA-Z_0-9])*
func        f_{name_string}
label       l{integer}
var         v{integer}
reg         a[0-7]|s[0-9]|s10|s11|t[0-6]|x0

%%


":"           return COL;
"["         return LBRK;
"]"         return RBRK;
if          return IF;
goto        return GOTO;
return      return RETURN;
call        return CALL;
store       return STORE;
load        return LOAD;
loadaddr    return LOADARRD;
malloc      return MALLOC;
end         return END;
"="           return ASSIGN;

"!="          {yylval=yytext; return OP;}
"=="          {yylval=yytext; return OP;}
"<"           {yylval=yytext; return OP;}
">"           {yylval=yytext; return OP;}
"<="          {yylval=yytext; return OP;}
">="          {yylval=yytext; return OP;}
"+"           {yylval=yytext; return OP;}
"-"           {yylval=yytext; return OP;}
"*"           {yylval=yytext; return OP;}
"/"           {yylval=yytext; return OP;}
"!"           {yylval=yytext; return OP;}
"&&"          {yylval=yytext; return OP;}
"||"          {yylval=yytext; return OP;}
"%"           {yylval=yytext; return OP;}


label       {yylval=yytext; return LABEL;}
func        {yylval=yytext; return FUNC;}
reg         {yylval=yytext; return REG;}
var         {yylval=yytext; return VAR;}
integer     {yylval=yytext; return INT;}
[\n]	    { lineno++; return ENTER; }
[ \t]+                  /* ignore whitespace */;
"//"[^\n]*                 /* ignore comment */;
. {
    char msg[100] = "unrecognized input ";
	strcat(msg, yytext);
	yyerror(msg);
}
%%
