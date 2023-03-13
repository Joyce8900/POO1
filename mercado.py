from datetime import datetime
from random import randint

def gerar_data():
    ano = randint(2023, 2024)
    mes = randint(1, 12)
    max_dias = 31 if mes in [1, 3, 5, 7, 8, 10, 12] else 30 if mes in [4, 6, 9, 11] else 29 if ano % 4 == 0 and (ano % 100 != 0 or ano % 400 == 0) else 28
    dia = randint(1, max_dias)
    return (f"{dia:02d}/{mes:02d}/{ano}")


def DataTime():
    data_e_hora_atuais = datetime.now()
    data_formatada = data_e_hora_atuais.strftime("%d/%m/%Y %H:%M:%S")
    return (data_formatada)


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
               f"Total: {self.total()}"


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
    
    chocolate = Produto(preco = 10.50, descricao=   "Chocolate", validade= gerar_data())
    pacote = Item(2, chocolate)
    venda = Venda(DataTime(), [pacote])

    carne = Produto(preco = 34.99, descricao= "Carne", validade = gerar_data())
    pacote = Item(2, carne)
    venda.set_item(pacote.quantidade, pacote.produto)

    macarrao = Produto(preco = 3.75, descricao="Macarrão",validade= gerar_data())
    pacote = Item(5, macarrao)
    venda.set_item(pacote.quantidade, pacote.produto)

    suco_laranja = Produto(preco=5.00, descricao="Suco de Laranja", validade = gerar_data())
    pacote = Item(3, suco_laranja)
    venda.set_item(pacote.quantidade, pacote.produto)

    biscoito = Produto(preco=3.29, descricao = "Biscoito", validade=gerar_data())
    pacote = Item(1, biscoito)
    venda.set_item(pacote.quantidade, pacote.produto)



    print(venda)
