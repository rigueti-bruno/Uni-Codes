import java.util.UUID;
import java.util.Calendar;
public class Diretor extends Empregado {
    // Metodos
    public Diretor(String nome, Calendar data_nascimento, long CPF, Endereco endereco) {
        super(nome, data_nascimento, CPF, endereco);
    }
    protected void gerarMatricula() {
        matricula = "E-" + UUID.randomUUID( ).toString( );
    }
    protected void alterarMatricula(){
            gerarMatricula();
    }
    protected void alterarMatricula(String matricula){
            this.matricula = matricula;
    }
}
