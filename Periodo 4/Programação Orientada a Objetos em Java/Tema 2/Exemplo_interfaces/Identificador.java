public interface Identificador {
	final int tamanho_max = 21;
	boolean validarID (String id);
	void formatarID (int tipo);
	void atualizarID (String id);
	String recuperarID ();
}