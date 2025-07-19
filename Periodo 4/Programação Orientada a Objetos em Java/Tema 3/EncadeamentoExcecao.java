import java.io.IOException;

public class EncadeamentoExcecao {
    public static void main (String args[]) {
        try {
            abrirArquivo();
        } catch (AbrirArquivoExcecao e) {
            System.out.println("Um erro ocorreu na tentativa de abrir o arquivo: " + e.getMessage());
            System.out.println("Causa raiz: " + e.getCause());
        }
    }
    public static void abrirArquivo() throws AbrirArquivoExcecao {
        try {
            // Simulando uma exceção ao abrir o arquivo:
            throw new IOException("Incapaz de abrir o arquivo.");
        } catch (IOException e) {
            // Envolvendo a exceção capturada em uma nova exceção personalizada:
            throw new AbrirArquivoExcecao("Ococrreu um erro ao abrir o arquivo",e);
        }
    }
}
class AbrirArquivoExcecao extends Exception {
    public AbrirArquivoExcecao(String mensagem, Throwable causa) {
        super(mensagem,causa);
    }
}