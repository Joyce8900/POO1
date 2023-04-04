import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';


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
            children: <Widget>[
              CachedNetworkImage(
                imageUrl: 'https://via.placeholder.com/350x150',
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
                fadeInDuration: Duration(milliseconds: 500),
              ),
              Container(
                child: Text("Parque"),
              ),
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
