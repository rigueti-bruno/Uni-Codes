import java.util.Random;
public class Pessoa {
    // Atributos:
    private String nome; //modificador private: torna o atributo oculto ao exterior da classe
    private double codigo_identificador;
    private Random aleatorio;

    // Métodos:
    
    public Pessoa (String nome) { // Construtor da classe
        aleatorio = new Random();
        this.setNome(nome);
        this.codigo_identificador = aleatorio.nextDouble(); //atribui um valor aleatorio ao atributo identificador
    }
    private void setNome (String nome) { //setter do atributo nome
        this.nome = nome;
    }
    public String getNome() { //getter do atributo nome
        return this.nome;
    }
    public double getCodigoIdentificador() { //getter do atributo codigo_identificador
        return this.codigo_identificador;
    }
    public static void main (String[] args) {
        Pessoa p1 = new Pessoa("Teste A");
        System.out.println("Pessoa 1: " + p1.getNome() + ", Codigo Identificador: " + p1.getCodigoIdentificador());
        Pessoa p2 = new Pessoa("Teste B");
        System.out.println("Pessoa 2: " + p2.getNome() + ", Codigo Identificador: " + p2.getCodigoIdentificador());
    }
}