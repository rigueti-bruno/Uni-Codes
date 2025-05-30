// Execução:
public class Main{
    public static void main(String[] args){
        Animal cachorro = new Cachorro();
        Animal gato = new Gato();
        Leao leao = new Leao();

        // Execução do objeto Cachorro:
        cachorro.emitirSom();
        cachorro.dormir();

        // Execução do objeto Gato:
        gato.emitirSom();
        gato.dormir();

        // Execução do objeto Leão:
        leao.emitirSom();
        leao.tipoDeAnimal();
        leao.dormir();
    }
}