import java.util.*;
import java.util.stream.*;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;
public class Conta
{   private int cod;
    private String tipo;
    private double saldo;
    private double limite;
    private String date;
    private double taxa;
    private double rend;
    private ArrayList<String> extrato = new ArrayList<>();

    public int getCod(){
        return cod;
    }
    
    public void setCod(int cod){
        this.cod=cod;
    }
    
    public String getDate(){
        return date;
    }
    
    public void setDate(String date){
        this.date=date;
    }
    
    public String getTipo(){
        return tipo;
    }
    
    public void setTipo(String tipo){
        this.tipo=tipo;
    }
    
    public double getSaldo(){
        return saldo;
    }
    
    public void setSaldo(double saldo){
        this.saldo=saldo;
    }
    
    public double getTaxa(){
        return taxa;
    }
    
    public void setTaxa(double taxa){
        this.taxa=taxa;
    }
    
    public double getRendimento(){ 
        return rend;
    }
    
    public void setRend(double rend){
        this.rend=rend;
    }
    
    public ArrayList<String> getExtrato(){
        return this.extrato;
    }
    
    public double getLimite(){ 
        return limite;
    }
    
    public void setLimite(double limite){
        this.limite=limite;
    }
    
    public void deposito(double valor){
        saldo=saldo+valor;
        extrato.add("Deposito: R$" + valor + " | Saldo atual: R$" + saldo + " | Limite atual: R$" + limite + " | Data: " + ZonedDateTime.now());
    }
    
    public boolean sacar(double valor){
        if(valor<= saldo+limite){
            if (valor > saldo){
                saldo=0;
                limite=(valor-saldo);
            }else{saldo=saldo-limite;}
            extrato.add("Saque: R$" + valor + " | Saldo atual: R$" + saldo + " | Limite atual: R$" + limite + " | Data: " + ZonedDateTime.now());
            return true;
        }else{return false;}
    }
    
    public boolean transferir(double valor, Conta conta){
        if(valor<= saldo+limite){
            if (valor > saldo){
                saldo=0;
                limite=(valor-saldo);
            }else{saldo=saldo-limite;}
            conta.saldo+=valor; 
            extrato.add("Valor enviado: R$ " + valor + " | Saldo atual: R$" + saldo + " | Limite disponivel: R$" + limite + " | Data: " + ZonedDateTime.now());
            conta.extrato.add("Valor recebido: R$" + valor + " | Saldo atual: R$" + saldo + " | Limite atual: R$" + limite + " | Data: " + ZonedDateTime.now());
            return true;
        }else{return false;}
    }
    
    public boolean devedor(){
        if(saldo>0){
            return false;
        }else return true;
    }
    
    public void taxmanutencao(){
        if(extrato.stream().filter(t->t.endsWith(DateTimeFormatter.ofPattern("yyyy-MM-dd").format(ZonedDateTime.now()))
         && t.contains("Taxa de Manutenção")).collect(Collectors.toList()).size()<1){
            saldo-=taxa;
            extrato.add("Taxa de manutenção: R$ -" + taxa + " | Saldo atual: R$" + saldo + " | Limite atual: R$" + limite + " | Data: " + ZonedDateTime.now());
        }
    }
    
    public void rend(){
        saldo+= saldo*rend;
        extrato.add("Rendimento: R$ " + saldo*rend + " | Saldo atual: R$" + saldo + " | Limite atual: R$" + limite + " | Data: " + ZonedDateTime.now());    
    }
    
}
    

