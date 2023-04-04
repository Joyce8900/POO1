import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.red, // Define a cor vermelha como tema principal
      ),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true, // Centraliza o título da AppBar
          title: Text("Receita1"), // Define o título da AppBar como "Receita1"
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Centraliza os elementos verticalmente
            children: [
              SizedBox(height: 50), // Adiciona um espaço em branco vertical com 50 de altura
              Expanded(
                child: ElevatedButton(
                  onPressed: (){}, // Define a função a ser executada quando o botão for pressionado
                  child: Text(
                    "Botão 01", // Define o texto a ser exibido no botão
                    style: TextStyle(
                      fontSize: 20, // Define o tamanho da fonte como 20
                      fontFamily: 'Roboto', // Define a fonte como Roboto
                      fontWeight: FontWeight.bold, // Define o peso da fonte como negrito
                      fontStyle: FontStyle.italic, // Define a fonte como itálico
                      color: Colors.white, // Define a cor da fonte como branca
                    ),
                  ),
                  style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all(Size.fromHeight(30)), // Define a altura fixa do botão como 50
                  ),
                ),
              ),
              SizedBox(height: 20), // Adiciona um espaço em branco vertical com 20 de altura
              Expanded(
                child: IconButton(
                  icon: Icon(Icons.favorite), // Define o ícone a ser exibido no botão
                  onPressed: () {}, // Define a função a ser executada quando o botão for pressionado
                  color: Colors.black, // Define a cor do ícone como preta
                  iconSize: 40, // Define o tamanho do ícone como 40
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

