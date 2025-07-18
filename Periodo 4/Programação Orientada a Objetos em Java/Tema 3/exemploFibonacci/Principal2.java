//imports 
import java.io.IOException; 
import java.util.Scanner; 

public class Principal2 { 
    //Atributos 
    private static Scanner entrada; 

    public static void main ( String args [ ] ) { 
        double num = 0; 
        entrada = new Scanner ( System.in ); 

        do { 
            System.out.println ( "Entre com um numero de 4 dígitos ou -0001 para sair: "); 
            if ( num == -1 ) 
                System.exit ( 0 );
            try { 
            num = Double.parseDouble( lerEntrada ( 4 ) );} catch ( IOException e ) { 
                System.out.println ( "Erro ao ler a entrada: " + e.getMessage() ); 
                continue; 
            } catch ( NumberFormatException e ) { 
                System.out.println ( "Entrada inválida, tente novamente." ); 
                continue; 
            }
            System.out.println ( "O numero lido eh: " + num ); 
        } while ( num >= 0 ); 
    } 

    private static String lerEntrada ( int tam_entrada ) throws IOException { 
        String entrada = null;              
        entrada = new String ( System.in.readNBytes ( tam_entrada ) ); 
        return entrada; 
    } 
}