package Dev;
import java_cup.runtime.Symbol;
%%
%class LexicoCup
%type java_cup.runtime.Symbol
%cup
%full
%line
%char
L=[a-zA-Z_]+
D=[0-9]+
espacio=[ ,\t,\r,\n]+
%{
    private Symbol symbol(int type, Object value){
        return new Symbol(type, yyline, yycolumn, value);
    }
    private Symbol symbol(int type){
        return new Symbol(type, yyline, yycolumn);
    }
%}
%%

/* Espacios en blanco */
{espacio} {/*Ignore*/}

/* Comentarios */
( "//"(.)* ) {/*Ignore*/}

( "procedure" ) { return new Symbol(sym.Procedure,(int) yychar, yyline, yytext()); }

( "begin" ) { return new Symbol(sym.Begin, (int) yychar, yyline, yytext()); }

( "end" ) { return new Symbol(sym.End,(int) yychar, yyline, yytext()); }

/* Tipo de dato String */
( String ) {return new Symbol(sym.Cadena,(int) yychar, yyline, yytext());}

/* Parentesis de apertura */
( "(" ) {return new Symbol(sym.Parentesis_a, (int)yychar, yyline, yytext());}

/* Parentesis de cierre */
( ")" ) {return new Symbol(sym.Parentesis_c,(int) yychar, yyline, yytext());}


/* Punto y coma */
( ";" ) {return new Symbol(sym.PuntoComa,(int) yychar, yyline, yytext());}

/* Identificador */
[a-zA-Z_][a-zA-Z0-9_]* {return new Symbol(sym.Identificador,(int) yychar, yyline, yytext());}

/* Signos */
( "'|¡|." ) { return new Symbol(sym.Signos,(int) yychar, yyline, yytext()); }

/* Error de analisis */
 . {return new Symbol(sym.error, (int) yychar, yyline, yytext());}
