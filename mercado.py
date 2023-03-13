from datetime import datetime
import random

def gerar_data():
    ano = random.randint(2023, 2024)
    mes = random.randint(1, 12)
    max_dias = 31 if mes in [1, 3, 5, 7, 8, 10, 12] else 30 if mes in [4, 6, 9, 11] else 29 if ano % 4 == 0 and (ano % 100 != 0 or ano % 400 == 0) else 28
    dia = random.randint(1, max_dias)
    return f"{dia:02d}/{mes:02d}/{ano}"


class DataTime:
    @staticmethod
    def now():
        return datetime.now()


class Produto:
    def __init__(self, preco, descricao, validade):
        self.preco = preco
        self.descricao = descricao
        self.validade = validade

    def __str__(self):
        return f"Preco: {self.preco} -- Descricao: {self.descricao} -- Validade: {self.validade}\n"


class Item:
    def __init__(self, quantidade, produto):
        self.quantidade = quantidade
        self.produto = produto

    def total(self):
        return self.quantidade * self.produto.preco

    def __str__(self):
        return f"Quantidade: {self.quantidade} -- Produto: {self.produto}" \
               f" -- Total: {self.total()}"


class Venda:
    def __init__(self, data, itens):
        self.data = data
        self.itens = itens

    def total(self):
        return sum([item.total() for item in self.itens])

    def set_item(self, quantidade, produto):
        item = Item(quantidade, produto)
        self.itens.append(item)

    def __str__(self):
        itens_str = '\n'.join([str(item) for item in self.itens])
        return f"Data: {self.data} ---- \nItens: \n{itens_str}\n \nTotal R$: {self.total()}"


if __name__ == "__main__":
    chocolate = Produto(10.50, "Chocolate", gerar_data())
    pacote = Item(2, chocolate)
    venda = Venda(DataTime.now(), [pacote])
    macarrao = Produto(2.50, "Macarrão", gerar_data())
    pacote1 = Item(5, macarrao)
    venda= Venda(DataTime.now(),[pacote1])

    venda.set_item(pacote.quantidade, pacote.produto)
    print(venda)
