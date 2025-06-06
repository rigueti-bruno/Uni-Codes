public class Aluno {
    //Atributos    
    private String matricula,nome,naturalidade;
    //Métodos
    public Aluno(String nome,String naturalidade){
            this.nome=nome;
            this.naturalidade=naturalidade;
    }
        @Override
        public String toString(){
            return String.format("%s(%s)",nome,naturalidade);
        }
    public String recuperarNaturalidade(){
        return this.naturalidade;
    }
    public String getMatricula() {
        return matricula;
    }
    public void setMatricula(String matricula) {
        this.matricula = matricula;
    }
}