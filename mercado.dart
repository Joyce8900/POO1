void main(){
    
}

class Venda{
    final DataTime data;
    List<Item> itens = [];
    

    double total(){
      double soma =  itens.fold(0,(value, element) => value + element.total());
      return soma;
    Venda(this.data);

    void setItem(double quantidade, Produto produto){
        Item item = Item (quantidade,produto);
        itens.add(item);

    }
}}
class DataTime{

  DateTime now = DateTime.now();
  
}
class Item{
    final double quantidade;
    Produto produto;

    double total(){
        return (quantidade*produto.preco);
    }

    Item(this.quantidade,this.produto);
}

class Produto{
    final double preco;
    final String descricao;
    final DataTime validade;

    Produto(this.preco, this.descricao, this.validade);
}