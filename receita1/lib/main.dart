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
          child: ElevatedButton(
            onPressed: (){},
            child:
              Text(
                "Viva Santana",
                style: TextStyle(
                fontSize: 20, 
                fontFamily: 'Roboto', 
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic, 
                color: Colors.white, 
              ),)
             
          )
        )
      ),
    ),
  );
}