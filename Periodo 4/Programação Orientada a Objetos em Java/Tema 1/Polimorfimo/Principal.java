
import java.nio.file.DirectoryStream;
import java.util.Calendar;
import static java.util.Calendar.DATE;
import static java.util.Calendar.MONTH;
import static java.util.Calendar.YEAR;
import java.util.UUID;
public class Principal {
    // Atributos
    private static Empregado empregado, diretor;

    // Metodo main
    public static void main(String args[]) {
        Calendar data = Calendar. getInstance();
        data.set(1980, 10, 23);
        Empregado empregado = new Empregado("Clara Silva", data, 211456937, null);
        empregado.gerarMatricula();
        Diretor diretor = new Diretor("Marco Antonio", data, 211456937, null);
        diretor.gerarMatricula();
        System.out.println("A matrícula do Diretor é: " + diretor.recuperarMatricula());
        System.out.println("A matrícula do Empregado é: " + empregado.recuperarMatricula());
        diretor.alterarMatricula();
        System.out.println("A matrícula do Diretor é: " + diretor.recuperarMatricula());
        diretor.alterarMatricula("M-202100-1000");
        System.out.println("A matrícula do Diretor é: " + diretor.recuperarMatricula());
        }
    }