public class ContadorMonitor {
    private int contador = 0;

    public synchronized void incrementar() {
        contador++;
    }

    public int getContador() {
        return contador;
    }
}
