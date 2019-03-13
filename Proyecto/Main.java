import java.io.*;
import java_cup.runtime.*;
import java.io.FileReader;


public class Main {
  static public void main(String argv[]) {    
    /* Start the parser */
    try {
      parser p = new parser(new Lexer(new FileReader(argv[0])));
     p.parse(); 
     Object result = p.parse().value;
    } catch (Exception ex) {
      ex.printStackTrace();
    }

  }
}


parser code {:
    
  public void report_error(String message, Object info) {
    System.err.println(message);
  }

  public void syntax_error(Symbol s) {
    String key =  (s.left + 1) + s.right + "";
    String mensaje = ("\nError de sintaxis en linea " + (s.left + 1)  
    		+" columna " + s.right);
    if(AnalizadorLexico.errores.get(key) == null) {
      mensaje += ("\nAl simbolo " + s.value.toString() 
    		  + " le antecede un entero falta el operador");
      report_error(mensaje, null);
    }else {
    mensaje += ("\nERROR: entero o cadena <CARACTER INVALIDO> entero o cadena");
    mensaje += ("\nCORRECTO: entero o cadena <OPERADOR> entero o cadena");
    mensaje += ("\nAl simbolo " + s.value.toString() + " le antecede un token invalido");
    mensaje += (" ==> "+ AnalizadorLexico.errores.get(key)+" <==");
    report_error(mensaje, null);
    }
  }
   
  public void report_fatal_error(String message, Object info) {
	    String fatalError = ("*************************************");
	    fatalError += ("\n*********ERROR IRECUPERABLE**********");
	    fatalError += ("\n*************************************");
	    report_error(fatalError, info);
  }

