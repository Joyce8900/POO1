import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'Cerveja';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: MyStatefulWidget(),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key? key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  final _nomeController = TextEditingController();
  final _estiloController = TextEditingController();
  final _ibuController = TextEditingController();
  final List<DataRow> _rows = [
  DataRow(cells: [
    DataCell(Text('La Fin Monde')),
    DataCell(Text('Bock')),
    DataCell(Text('65')),
  ]),
  DataRow(cells: [
    DataCell(Text('Sapporo Premium')),
    DataCell(Text('Sour Ale')),
    DataCell(Text('54')),
  ]),
  DataRow(cells: [
    DataCell(Text('Duvel')),
    DataCell(Text('Pilsner')),
    DataCell(Text('82')),
  ]),
  DataRow(cells: [
    DataCell(Text('Guinness Draught')),
    DataCell(Text('Stout')),
    DataCell(Text('45')),
  ]),
  DataRow(cells: [
    DataCell(Text('Corona Extra')),
    DataCell(Text('Pale Lager')),
    DataCell(Text('19')),
  ]),
  DataRow(cells: [
    DataCell(Text('Heineken')),
    DataCell(Text('Pale Lager')),
    DataCell(Text('28')),
  ]),
  DataRow(cells: [
    DataCell(Text('Paulaner Hefe-Weißbier Naturtrüb')),
    DataCell(Text('Hefeweizen')),
    DataCell(Text('12')),
  ]),
  DataRow(cells: [
    DataCell(Text('Stella Artois')),
    DataCell(Text('Pale Lager')),
    DataCell(Text('30')),
  ]),
  DataRow(cells: [
    DataCell(Text('Brooklyn Lager')),
    DataCell(Text('Amber Lager')),
    DataCell(Text('47')),
  ]),
  DataRow(cells: [
    DataCell(Text('Sierra Nevada Pale Ale')),
    DataCell(Text('American Pale Ale')),
    DataCell(Text('37')),
  ]),
  DataRow(cells: [
    DataCell(Text('Belhaven Scottish Ale')),
    DataCell(Text('Scottish Ale')),
    DataCell(Text('30')),
  ]),
];

  void _addRow() {
    setState(() {
      final nome = _nomeController.text;
      final estilo = _estiloController.text;
      final ibu = _ibuController.text;
      _rows.add(
        DataRow(cells: [
          DataCell(Text(nome)),
          DataCell(Text(estilo)),
          DataCell(Text(ibu)),
        ]),
      );
      _nomeController.clear();
      _estiloController.clear();
      _ibuController.clear();
    });
  }

  @override
  void dispose() {
    _nomeController.dispose();
    _estiloController.dispose();
    _ibuController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          DataTable(
            columns: const <DataColumn>[
              DataColumn(
                label: Expanded(
                  child: Text(
                    'Nome',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
              ),
              DataColumn(
                label: Expanded(
                  child: Text(
                    'Estilo',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
              ),
              DataColumn(
                label: Expanded(
                  child: Text(
                    'IBU',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
              ),
            ],
            rows: _rows,
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: _nomeController,
                  decoration: InputDecoration(
                    labelText: 'Nome',
                    hintText: 'Insira o nome da cerveja',
                  ),
                ),
                TextFormField(
                  controller: _estiloController,
                  decoration: InputDecoration(
                    labelText: 'Estilo',
                    hintText: 'Insira o estilo da cerveja',
                  ),
                ),
                TextFormField(
                  controller: _ibuController,
                  decoration: InputDecoration(
                    labelText: 'IBU',
                    hintText: 'Insira o IBU da cerveja',
                  ),
      ),
            ElevatedButton(
              onPressed: _addRow,
              child: const Text('Adicionar linha'),
            ),
          ],
        ),
      ),
    ],
  ),
);
}
}