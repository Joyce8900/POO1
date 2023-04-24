import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo de Formulário em Flutter',
      home: FormScreen(),
    );
  }
}

class FormScreen extends StatefulWidget {
  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _email = '';
  String _favoriteColor = 'Vermelho';
  bool _receiveNotifications = false;
  double _priceRange = 50.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Demo de Formulário em Flutter'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Nome'),
              TextFormField(
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Por favor, insira seu nome';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    _name = value;
                  });
                },
              ),
              SizedBox(height: 16.0),
              Text('Email'),
              TextFormField(
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Por favor, insira seu email';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    _email = value;
                  });
                },
              ),
              SizedBox(height: 16.0),
              Text('Cor Favorita'),
              Row(
                children: <Widget>[
                  Radio(
                    value: 'Vermelho',
                    groupValue: _favoriteColor,
                    onChanged: (value) {
                      setState(() {
                        _favoriteColor = value;
                      });
                    },
                  ),
                  Text('Vermelho'),
                  Radio(
                    value: 'Verde',
                    groupValue: _favoriteColor,
                    onChanged: (value) {
                      setState(() {
                        _favoriteColor = value;
                      });
                    },
                  ),
                  Text('Verde'),
                  Radio(
                    value: 'Azul',
                    groupValue: _favoriteColor,
                    onChanged: (value) {
                      setState(() {
                        _favoriteColor = value;
                      });
                    },
                  ),
                  Text('Azul'),
                ],
              ),
              SizedBox(height: 16.0),
              Text('Receber Notificações'),
              Switch(
                value: _receiveNotifications,
                onChanged: (value) {
                  setState(() {
                    _receiveNotifications = value;
                  });
                },
              ),
              SizedBox(height: 16.0),
              Text('Faixa de Preço'),
              Slider(
                value: _priceRange,
                min: 0,
                max: 100,
                divisions: 10,
                onChanged: (value) {
                  setState(() {
                    _priceRange = value;
                  });
                },
              ),
              SizedBox(height: 32.0),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Enviando Formulário...'),
                        ),
                      );
                    }
                  },
                  child: Text('Enviar'),
                ),
              ),
            ],
          ),
  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

       
