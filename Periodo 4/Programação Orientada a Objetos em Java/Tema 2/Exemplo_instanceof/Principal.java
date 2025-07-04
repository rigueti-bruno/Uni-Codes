import java.util.Calendar;
public class Principal {
	//Atributos
	private static Fisica p1 , p2;
	private static Pessoa p3;

	//Métodos
	public static void main (String args[]) {
		Calendar data_nasc = Calendar.getInstance();
		data_nasc.set(1980, 10, 23);
		p1 = new Fisica ( "Marco Antônio" , data_nasc , "365.586.875-45", "Brasil" , "Rio de Janeiro" );
		p2 = new Fisica ( "Marco Antônio" , data_nasc , "365.586.875-45", "Brasil" , "Rio de Janeiro" );
		p3 = new Pessoa ( "Classe Pessoa" , null , null, "Brasil" , "Rio de Janeiro");
		System.out.println("HashCode de p1: " + Integer.toHexString(p1.hashCode())); // Exibe o hashCode de p1
		System.out.println("HashCode de p2: " + Integer.toHexString(p2.hashCode()));
		System.out.println("HashCode de p3: " + Integer.toHexString(p3.hashCode()));
		if ( p1 instanceof Pessoa )
		System.out.println("p1 é instância do tipo Pessoa.");
		else
			System.out.println("p1 não é instância do tipo Pessoa.");
		if ( p2 instanceof Pessoa )
		System.out.println("p2 é instância do tipo Pessoa.");
		else
			System.out.println("p2 não é instância do tipo Pessoa.");
		if ( p3 instanceof Pessoa )
			System.out.println("p3 é instância do tipo Pessoa.");
		else
			System.out.println("p3 não é instância do tipo Pessoa.");
		if ( p3 instanceof Fisica )
			System.out.println("p3 é instância do tipo Física.");
		else
			System.out.println("p3 não é instância do tipo Física.");
	}	
}