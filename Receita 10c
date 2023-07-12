import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Ordenador {
  List ordenarFuderoso(List objetos, CompareFunction comparador) {
    List objetosOrdenados = List.of(objetos);
    bool trocouAoMenosUm;

    do {
      trocouAoMenosUm = false;

      for (int i = 0; i < objetosOrdenados.length - 1; i++) {
        var atual = objetosOrdenados[i];
        var proximo = objetosOrdenados[i + 1];

        if (comparador(atual, proximo)) {
          var aux = objetosOrdenados[i];
          objetosOrdenados[i] = objetosOrdenados[i + 1];
          objetosOrdenados[i + 1] = aux;
          trocouAoMenosUm = true;
        }
      }
    } while (trocouAoMenosUm);

    return objetosOrdenados;
  }
}

typedef bool CompareFunction(dynamic atual, dynamic proximo);

class DataService {
  Future<List<dynamic>> buscarDadosAleatorios() async {
    final response = await http.get(Uri.parse('https://randomuser.me/api/?results=10'));

    if (response.statusCode == 200) {
      final decodedResponse = jsonDecode(response.body);
      return decodedResponse['results'];
    } else {
      throw Exception('Falha ao buscar os dados');
    }
  }

  void ordenarEstadoAtual(final String propriedade, bool crescente) {
    buscarDadosAleatorios().then((objetos) {
      if (objetos.isEmpty) return;

      Ordenador ord = Ordenador();
      CompareFunction comparador = (atual, proximo) {
        try {
          int resultado = atual[propriedade].compareTo(proximo[propriedade]);
          return crescente ? resultado > 0 : resultado < 0;
        } catch (error) {
          return false;
        }
      };

      var objetosOrdenados = ord.ordenarFuderoso(objetos, comparador);

      emitirEstadoOrdenado(objetosOrdenados, propriedade);
    });
  }

  void emitirEstadoOrdenado(List objetosOrdenados, String propriedade) {
    print('Objetos Ordenados pela propriedade $propriedade:');
    objetosOrdenados.forEach((objeto) {
      print(objeto[propriedade]);
    });
  }
}

void main() {
  DataService dataService = DataService();
  dataService.ordenarEstadoAtual("name", true);
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<dynamic> data = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final response = await http.get(Uri.parse('https://randomuser.me/api/?results=10'));
    if (response.statusCode == 200) {
      final decodedResponse = jsonDecode(response.body);
      setState(() {
        data = decodedResponse['results'];
      });
    } else {
      throw Exception('Falha ao buscar os dados');
    }
  }

  void sortData(String propriedade, bool crescente) {
    Ordenador ord = Ordenador();
    CompareFunction comparador = (atual, proximo) {
      try {
        int resultado = atual[propriedade].compareTo(proximo[propriedade]);
        return crescente ? resultado > 0 : resultado < 0;
      } catch (error) {
        return false;
      }
    };

    var objetosOrdenados = ord.ordenarFuderoso(data, comparador);

    setState(() {
      data = objetosOrdenados;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Tabela de Dados'),
        ),
        body: DataTableWidget(data: data, sortData: sortData),
      ),
    );
  }
}

class DataTableWidget extends StatelessWidget {
  final List<dynamic> data;
  final Function(String, bool) sortData;

  DataTableWidget({required this.data, required this.sortData});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        sortAscending: true,
        sortColumnIndex: 0,
        columns: [
          DataColumn(
            label: Text('Name'),
            onSort: (columnIndex, ascending) {
              sortData('name', ascending);
            },
          ),
          DataColumn(
            label: Text('Age'),
            onSort: (columnIndex, ascending) {
              sortData('age', ascending);
            },
          ),
          DataColumn(
            label: Text('Email'),
            onSort: (columnIndex, ascending) {
              sortData('email', ascending);
            },
          ),
        ],
        rows: data
            .map(
              (item) => DataRow(
                cells: [
                  DataCell(Text(item['name']['first'])),
                  DataCell(Text(item['dob']['age'].toString())),
                  DataCell(Text(item['email'])),
                ],
              ),
            )
            .toList(),
      ),
    );
  }
}
