import java_cup.runtime.*;
import java.io.Reader;
import java.util.HashMap;

%%

%unicode
%class Lexer
%line
%column
%int
%standalone
%cup

%{
    private Symbol symbol(int type) {
        return new Symbol(type, yyline, yycolumn);
    }
    private Symbol symbol(int type, Object value) {
        return new Symbol(type, yyline, yycolumn, value);
    }
    
    public static HashMap<String, String> errores = new HashMap<>();
%}


//Ojo Todas las reglas sintacticas deben de estar en un .CUP
// Tokens 

//Palabras Reservadas ADA
    RESERVED = "abort"	| "else" |	"new" |	"return" | "abs"| "elsif" |	"not" | "reverse" | "abstract" | "end" | "null"	|
"accept" |	"entry"	|	"select" |
"access"|	"exception"	|"of" |	"separate"	|
"aliased" |	"exit" |	"or"	|
"all" |		"others" |	"subtype"	|
"and"	| "for" |	"out"	|	
"array"|	"function" |
"at"	|		"tagged" |
"generic" | "package"| "task"	|
"begin"	|"goto"	| "pragma"|"terminate"	|
"body" |		"private"	|"then"	|
"if"|	"procedure"	|"type"	|
"case"|	"in"	|"protected" 	|
"constant"		|	"until" |
"is"	|"raise"	|"use"	|
"declare"	|	"range" |		
"delay"	|"limited"|	"record"|	"when"	|
"delta"	|"loop"	|"rem"	|"while"	|
"digits"|		"renames"|	"with"	|
"do"	|"mod"|	"requeue"  |	"xor"

//tipos
    //integer= "Integer"  // En ada95 comprende los numeros enteros positivos y negativos
    //float= "Float"     // En ada95 debe tener como mínimo un digito antes y después del punto decimal
    //boolean= [""]

    dataType ="Integer" |"Float" | "Character" | "String" | "array" | "Array"

//Funciones de lectura y escritura de tipos

    put = "Put"
    get = "Get"
    //Duda: (Se utilizará Put y Get sin el prefijo asociado referente a la librería; es decir, las funciones estarán sobrecargadas)????, llevara Int_IO???


//Caracteres
    colon=":"
    semicolon=";"
    equal="="
    space=" "
    point= "."
    comma= ","
    hyphen="-"
    underline="_"

    ampersand = "&"
    apostrophe = "'"
    numbersign = "#"

    leftPar = "("
    rightPar = ")"
    
    leftSquareB = "["
    rightSquareB = "]"
    leftCurlyB = "{"
    rightCurlyB = "}"




    //Operadores

    OP_SUMA = "+"|"-"
    OP_MULT ="*" | "/" | "mod" | "rem"
    OP_RELA = ">" | "<" | "==" | ">=" | "<=" | "/="
    OP_LOGIC = "and" | "or" | "xor" | "xand"
    OP_BOOL = "true" | "false"



//Delimitadores compuestos
    ASIG = {colon}{equal}
    arrow = "=>"
    ddot =".."
    dstar = "**"
    leftlabel="<<"
    rightlabel=">>"
    box="<>"
    NotEQUAL= {"/"} {equal}


    

//Variable

    LETTER= [a-zA-Z]
    NUMBER=[0-9]
    IDENTIFIER= {LETTER}+({NUMBER}|{underline}|{LETTER})*// se pueden declarar varias variables seguidas de "," ejem: total, subtotal: Float;
    STRING = \"({LETTER}|{NUMBER})*\"

    INTEGER = [1-9][0-9]* | 0
    DECIMAL= {NUMBER} ({point}{NUMBER}*)?
    

/*
    //Tipo integer
        
        intDeclaration= {space} {variable} {space} {colon} {space} {integer}
        intInit= {intDeclaration} {space} {asig} {space} {numeroInteger}


    //Tipo float

        floatDeclaration = {space} {variable} {space} {colon} {space} {float}
        floatInit= {floatDeclaration} {space} {asig} {space} {numeroFloat}
*/

    //Tipo Boolean



    
        //endlazo= {space} {end}{space}{lazo} {coma}
        //condicionCentinela= {space} {exit} {space} {when} {numero}* {numeroFloat}* {intInit}* {mayorque}* {menorque}* {numero}* {numeroFloat}* {intInit}*  


        //loopFor= {space} {for} {space} {in} {space} {numero} {punto}{2} {numero} {lazo} /*{gramatica}*/ {endlazo}


//Operaciones aritmeticas


    //SumaInt = ({space} {numero} {space} {suma} {space} {numero}| {intInit} {space} {suma} {space} {intInit}) // suma con el unico proposito de verificar la declaracion de variables de tipo int


%%

<YYINITIAL> {
    {RESERVED} {System.out.println(yytext() +"\t\t RESERVED WORD");
    
                     return symbol(sym.RESERVED); 

                }


    {dataType} {System.out.println(yytext() + "\t\t DATA TYPE");
                
                return symbol(sym.dataType);


    }

    {IDENTIFIER} {System.out.println(yytext() +"\t\t IDENTIFIER");

                return symbol(sym.IDENTIFIER);
    
    }

    {INTEGER} {System.out.println(yytext() +"\t\t INTEGER");

                return new Symbol(sym.INTEGER,0,0,yytext());
    
    }


    {STRING} {System.out.println(yytext() +"\t\t STRING");
                
                return symbol(sym.STRING);

    }

    {DECIMAL} {System.out.println(yytext() +"\t\t DECIMAL");


                return symbol(sym.DECIMAL);


    }


    {colon} {System.out.println(yytext() +"\t\t COLON");
                
                return symbol(sym.colon);
    }

    {semicolon} {System.out.println(yytext() + "\t\t SEMICOLON");

                return symbol(sym.semicolon);

    }

    {ampersand} {System.out.println(yytext() + "\t\t AMPERSAND");

                return symbol(sym.ampersand);
    }

    {comma} {System.out.println(yytext() + "\t\t COMMA");
    
                return symbol(sym.comma);
    
    }


    {point} {System.out.println(yytext() + "\t\t POINT");

                return symbol(sym.point);
    }

    {numbersign} {System.out.println(yytext() + "\t\t NUMBER SIGN");
    
                return symbol(sym.numbersign);

    }

    {apostrophe} {System.out.println(yytext() + "\t\t APOSTROPHE");
    
                return symbol(sym.apostrophe);

    }

    {numbersign} {System.out.println(yytext() + "\t\t NUMBER SIGN");

                return symbol(sym.numbersign);
    
    }

    {leftPar} {System.out.println(yytext() + "\t\t LEFT PARENTHESIS");

                return symbol(sym.leftPar);
    
    }

    {rightPar} {System.out.println(yytext() + "\t\t RIGHT PARENTHESIS");
    
                return symbol(sym.rightPar);

    }

    {hyphen} {System.out.println(yytext() + "\t\t HYPHEN");

                return symbol(sym.hyphen);

    }

    {arrow} {System.out.println(yytext() + "\t\t ARROW");
    
                return symbol(sym.arrow);

    }

    {ddot} {System.out.println(yytext() + "\t\t DOUBLE DOT");

                return symbol(sym.ddot);
    
    }

    {dstar} {System.out.println(yytext() + "\t\t DOUBLE STAR");
    
                return symbol(sym.dstar);

    }

    //{arrow} {System.out.println(yytext() + "\t\t ARROW");}

    {leftlabel} {System.out.println(yytext() + "\t\t LEFT LABEL");

                return symbol(sym.leftlabel);

    }

    {rightlabel} {System.out.println(yytext() + "\t\t RIGHT LABEL");

                return symbol(sym.rightlabel);
    
    }

    {box} {System.out.println(yytext() + "\t\t BOX");
    
                return symbol(sym.box);

    }


    //Operadores
    {ASIG} {System.out.println(yytext() +"\t\t ASIGNACION");
    
                return symbol(sym.ASIG);

    }

    {OP_SUMA} {System.out.println(yytext() +"\t\t ADDING OPERATOR");
    
                return symbol(sym.OP_SUMA);

    }

    {OP_MULT} {System.out.println(yytext() +"\t\t MULTIPLYING OPERATOR");
    
                return symbol(sym.OP_MULT);

    }

    {OP_LOGIC} {System.out.println(yytext() +"\t\t LOGIC OPERATOR ");

                return symbol(sym.OP_LOGIC);
    
    }

    {space} {}
    //. {System.out.println(yytext() + "\t\t ERROR");}
}

[^] 
{ 
  String mensaje = "";
  mensaje += ("\n************************************");
  mensaje += ("\n****Caracter invalido ==> "+yytext()+" <== ****");
  mensaje += ("\nencontrado en la linea ");
  mensaje += ((yyline + 1) + " y columna "  + (yycolumn + 1));
  mensaje += ("\n************************************\n");
  String keyString = (yyline + 1) + (yycolumn + 1) + "";
  errores.put(keyString, yytext());
  System.err.println(mensaje);
}



