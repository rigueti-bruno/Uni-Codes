import java.util.Calendar;

public class Student extends Person {
    //Atributos    
    private String matricula;
    //Métodos
    public Student(String nome, Calendar data_nascimento, long CPF, Endereco endereco){
        super (nome, data_nascimento, CPF, endereco);
    }
}
