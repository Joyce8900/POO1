import java.util.*;
import java.util.stream.*;
public class Banco
{
    private int cod;
    private String nome;
    private ArrayList<Agencia> agencias = new ArrayList();  
    public void setCod(int cod){  
        this.cod=cod;
    }
    
    public int getCod(){
        return cod;
    }
    
    public void setNome(String nome){  
        this.nome=nome;
    }
    
    public String getNome(){
        return nome;
    }
    
    public void setAgencia(ArrayList<Agencia> agencias){  
        this.agencias=agencias;
    }
    
    public ArrayList<Agencia> getAgencias(){
        return agencias;
    }
    
    public double total(){
        return agencias.stream().mapToDouble(a->a.total()).sum();
    }
    
    public void rend(){
        agencias.stream().forEach(a->a.rend());
    }
 
}