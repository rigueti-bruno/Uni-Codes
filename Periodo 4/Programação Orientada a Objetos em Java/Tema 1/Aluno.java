public class Aluno {
    // Atributos
    private String nome;
    private int idade;
    
    // Metodos
    // Construtor
    public Aluno (String nome, int idade) {
        this.nome = nome;
        this.idade = idade;
    }
    // Setters
    public void definirNome (String nome) {
        this.nome = nome;
    }
    public void definirIdade (int idade) {
        this.idade = idade;
    }
    // Getters
    public String recuperarNome() {
        return this.nome;
    }
    public int recuperarIdade() {
        return this.idade;
    }
}
