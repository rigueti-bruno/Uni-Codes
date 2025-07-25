public class ErroOperando extends NullPointerException { 
    ErroOperando ( String msg_erro ) { 
        super ( msg_erro ); 
    }     
    ErroOperando ( Throwable causa ) { 
        initCause ( causa ); 
    }         
    @Override 
    public String toString ( ) { 
        return "Operando nulo: " + this.getMessage(); 
    } 
}