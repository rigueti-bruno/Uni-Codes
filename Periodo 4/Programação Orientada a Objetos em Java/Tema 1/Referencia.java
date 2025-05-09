public class Referencia {
    private Aluno a1, a2;
    public Referencia () {
        a1 = new Aluno ("Carlos", 20);
        a2 = new Aluno ("Ana", 23);
        System.out.println("O nome do aluno a1 é " + a1.recuperarNome());
        System.out.println("O nome do aluno a2 é " + a2.recuperarNome());
        a1 = a2;
        a2.definirNome("Flávia");
        System.out.println("O nome do aluno a1 é " + a1.recuperarNome());
        manipulaAluno(a1);
        System.out.println("O nome do aluno a1 é " + a1.recuperarNome());
    }
    public void manipulaAluno(Aluno aluno) {
        aluno.definirNome("Márcia");
    }
    public static void main(String args[]) {
        Referencia r = new Referencia();
        System.out.println("Fim da Execução.");
    }
}
