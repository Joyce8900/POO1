import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Receita1"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 50), 
              Expanded(
                child: ElevatedButton(
                  onPressed: (){},
                  child: Text(
                    "Botão 01",
                    style: TextStyle(
                      fontSize: 20, 
                      fontFamily: 'Roboto', 
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic, 
                      color: Colors.white, 
                    ),
                  ),
                  style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all(Size.fromHeight(50)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.zero))
                  ),
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                child: IconButton(
                  icon: Icon(Icons.favorite),
                  onPressed: () {},
                  color: Colors.black,
                  iconSize: 40,
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
