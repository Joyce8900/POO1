import java.util.*;
import java.util.stream.*;
public class Agencia
{
    
    private int codigo;
    private ArrayList<Conta> contas = new ArrayList();    
    public void setCodigo(int codigo){
        this.codigo = codigo;
    }
    public int getCoidgo(){
        return codigo;
    }
    public void setConta (ArrayList<Conta> contas){
        this.contas = contas;
    }
    public ArrayList<Conta> getConta(){
        return contas;
    }
    public double total(){
        return contas.stream().mapToDouble(c->c.getSaldo()).sum();
    }
    public List<Conta> devedores(){
        return contas.stream().filter(c->c.devedor()).collect(Collectors.toList());
    }
    public List<Conta> aniversariante(String date){
        int indice = date.indexOf("/",3);
        String data = date.substring(0,indice);
        return contas.stream().filter(c->c.getDate().startsWith(data)).collect(Collectors.toList());
        
    }
    public void rend(){
        contas.stream().filter(c->c.getTipo().equals("poup")).forEach(c->c.rend());
    }
    
    public void manutencao(){
        contas.stream().forEach(c->c.taxmanutencao());
    }
    
    public void manutencaoCorrente(){
        contas.stream().filter(c->c.getTipo().equals("corrente")).forEach(c->c.taxmanutencao());
    }
}
    
    

    
    


