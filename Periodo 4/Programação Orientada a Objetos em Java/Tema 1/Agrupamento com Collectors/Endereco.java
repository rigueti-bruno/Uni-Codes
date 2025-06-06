public class Endereco {
    private String nome_rua;
    private int numero;
    public Endereco (String nome_rua, int numero) {
        this.setNomeRua(nome_rua);
        this.setNumero(numero);
    }
    private void setNomeRua (String nome_rua) {
        this.nome_rua = nome_rua;
    }
    public String getNomeRua () {
        return this.nome_rua;
    }
    private void setNumero (int numero) {
        this.numero = numero;
    }
    public int getNumero () {
        return this.numero;
    }
    @Override
    public String toString() {
        return nome_rua + ", " + numero;
    }

    public static void main(String[] args) {
        Endereco ender = new Endereco("Rua X", 7);
        System.out.println(ender);
    }
}