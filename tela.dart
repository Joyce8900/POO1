import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Hello World"),
        ),
        body: Center(
          child: Column(
            children:[
              Text("Viva Santana"),
              Text("Viva Jesus")
            ]
          )
        ),
        bottomNavigationBar: Text("Botão"),
      ),
    ),
  );
}
