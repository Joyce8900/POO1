void main() {
  Produto chocolate = new Produto(10.50, "Chocolate", DataTime());
}

class Venda {
  final DataTime data;
  List<Item> itens = [];

  double total() {
    double soma = itens.fold(0, (value, element) => value + element.total());
    return soma;

    Venda(this.data, this.itens);

    void setItem(double quantidade, Produto produto) {
      Item item = Item(quantidade, produto);
      itens.add(item);
    }
  }

  @override
  String toString() =>
      "Data: ${this.data} ---- Itens: ${this.itens} --- Total item: ${this.total()}";
}

class DataTime {
  DateTime now = DateTime.now();
}

class Item {
  final double quantidade;
  Produto produto;

  double total() {
    return (quantidade * produto.preco);
  }

  Item(this.quantidade, this.produto);
  @override
  String toString() =>
      "Quantidade: ${this.quantidade} -- Produto: ${this.produto} --- Total: ${this.total}";
}

class Produto {
  final double preco;
  final String descricao;
  final DataTime validade;

  Produto(this.preco, this.descricao, this.validade);
  @override
  String toString() =>
      "Preco: ${this.preco} -- Descrição: ${this.descricao} -- Data: ${this.validade}";
}
