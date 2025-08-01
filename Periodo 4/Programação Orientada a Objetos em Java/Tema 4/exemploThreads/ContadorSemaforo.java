import java.util.concurrent.Semaphore;

public class ContadorSemaforo {
	private volatile int contador = 0;
	private final Semaphore semaforo = new Semaphore(1); // Inicializa o semáforo com 1 permissão

	public void incrementar() {
		try {
			semaforo.acquire(); // Adquire a permissão do semáforo
			contador++; // Incrementa o contador de forma segura
		} catch (InterruptedException e) {
			Thread.currentThread().interrupt();
			throw new RuntimeException("Thread interrompida", e);
		} finally {
			semaforo.release(); // Libera a permissão do semáforo
		}
	}

	public int getContador() {
		return contador;
	}
}