%%

%unicode
%class Lexer
%line
%column
%int
%standalone

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
    {RESERVED} {System.out.println(yytext() +"\t\t RESERVED WORD");}
    {dataType} {System.out.println(yytext() + "\t\t DATA TYPE");}
    {IDENTIFIER} {System.out.println(yytext() +"\t\t IDENTIFIER");}
    {INTEGER} {System.out.println(yytext() +"\t\t INTEGER");}
    {STRING} {System.out.println(yytext() +"\t\t STRING");}
    {DECIMAL} {System.out.println(yytext() +"\t\t DECIMAL");}



    {colon} {System.out.println(yytext() +"\t\t COLON");}
    {semicolon} {System.out.println(yytext() + "\t\t SEMICOLON");}
    {ampersand} {System.out.println(yytext() + "\t\t AMPERSAND");}
    {comma} {System.out.println(yytext() + "\t\t COMMA");}
    {point} {System.out.println(yytext() + "\t\t POINT");}
    {numbersign} {System.out.println(yytext() + "\t\t NUMBER SIGN");}
    {apostrophe} {System.out.println(yytext() + "\t\t APOSTROPHE");}    
    {numbersign} {System.out.println(yytext() + "\t\t NUMBER SIGN");}
    {leftPar} {System.out.println(yytext() + "\t\t LEFT PARENTHESIS");}
    {rightPar} {System.out.println(yytext() + "\t\t RIGHT PARENTHESIS");}
    {hyphen} {System.out.println(yytext() + "\t\t HYPHEN");}
    {arrow} {System.out.println(yytext() + "\t\t ARROW");}
    {ddot} {System.out.println(yytext() + "\t\t DOUBLE DOT");}
    {dstar} {System.out.println(yytext() + "\t\t DOUBLE STAR");}
    {arrow} {System.out.println(yytext() + "\t\t ARROW");}
    {leftlabel} {System.out.println(yytext() + "\t\t LEFT LABEL");}
    {rightlabel} {System.out.println(yytext() + "\t\t RIGHT LABEL");}
    {box} {System.out.println(yytext() + "\t\t BOX");}



    //Operadores
    {ASIG} {System.out.println(yytext() +"\t\t ASIGNACION");}
    {OP_SUMA} {System.out.println(yytext() +"\t\t ADDING OPERATOR");}
    {OP_MULT} {System.out.println(yytext() +"\t\t MULTIPLYING OPERATOR");}
    {OP_LOGIC} {System.out.println(yytext() +"\t\t LOGIC OPERATOR ");}
    {space} {}
    . {System.out.println(yytext() + "\t\t ERROR");}
}


