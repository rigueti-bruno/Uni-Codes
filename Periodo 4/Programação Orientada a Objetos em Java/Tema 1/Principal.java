import java.util.Random;
public class Principal {
    public static void main (String[] args) {
        Pessoa p1 = new Pessoa("Teste A");
        System.out.println("Pessoa 1: " + p1.getNome() + ", Codigo Identificador: " + p1.getCodigoIdentificador());
        Pessoa p2 = new Pessoa("Teste B");
        System.out.println("Pessoa 2: " + p2.getNome() + ", Codigo Identificador: " + p2.getCodigoIdentificador());
    }
}
