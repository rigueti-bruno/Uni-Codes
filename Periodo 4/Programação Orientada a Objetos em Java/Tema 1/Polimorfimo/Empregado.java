import java.util.Calendar;
public class Empregado extends Person {
    //Atributos
    protected String matricula;
    private Calendar data_admissao , data_demissao;
    //Métodos
    public Empregado(String nome, Calendar data_nascimento, long CPF, Endereco endereco) {
        super(nome, data_nascimento, CPF, endereco);
        gerarMatricula();
        data_admissao = Calendar.getInstance();
    }
    public void demitirEmpregado() {
        data_demissao = Calendar.getInstance();
    }
    protected void gerarMatricula() {
        this.matricula = "Matrícula não definida.";
    }
    protected String recuperarMatricula() {
        return this.matricula;
    }
}