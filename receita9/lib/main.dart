import 'package:flutter/material.dart';

import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:http/http.dart' as http;

import 'dart:convert';



enum TableStatus{idle,loading,ready,error}

enum ItemType{beer, coffee, nation, none}



class DataService{

  

  final ValueNotifier<Map<String,dynamic>> tableStateNotifier 

                            = ValueNotifier({

                              'status':TableStatus.idle,

                              'dataObjects':[],

                              'itemType': ItemType.none

                            });

  

  void carregar(index){

    final funcoes = [carregarCafes, carregarCervejas, carregarNacoes];

    funcoes[index]();

  }



  void carregarCafes(){

    //ignorar solicitação se uma requisição já estiver em curso

    if (tableStateNotifier.value['status'] == TableStatus.loading) return;

    if (tableStateNotifier.value['itemType'] != ItemType.coffee){

      tableStateNotifier.value = {

        'status': TableStatus.loading,

        'dataObjects': [],

        'itemType': ItemType.coffee

      };

    }



    var coffeesUri = Uri(

      scheme: 'https',

      host: 'random-data-api.com',

      path: 'api/coffee/random_coffee',

      queryParameters: {'size': '10'});



    http.read(coffeesUri).then( (jsonString){

      var coffeesJson = jsonDecode(jsonString);  

      

      //se já houver cafés no estado da tabela...

      if (tableStateNotifier.value['status'] != TableStatus.loading) coffeesJson = [...tableStateNotifier.value['dataObjects'], ...coffeesJson];

      

      tableStateNotifier.value = {

        'itemType': ItemType.coffee,

        'status': TableStatus.ready,

        'dataObjects': coffeesJson,

        'propertyNames': ["blend_name","origin","variety"],

        'columnNames': ["Nome", "Origem", "Tipo"]

      };

    });

    

  }



  void carregarNacoes(){

    //ignorar solicitação se uma requisição já estiver em curso

    if (tableStateNotifier.value['status'] == TableStatus.loading) return;

    if (tableStateNotifier.value['itemType'] != ItemType.nation){

      tableStateNotifier.value = {

        'status': TableStatus.loading,

        'dataObjects': [],

        'itemType': ItemType.nation

      };

    }



    var nationsUri = Uri(

      scheme: 'https',

      host: 'random-data-api.com',

      path: 'api/nation/random_nation',

      queryParameters: {'size': '10'});



    http.read(nationsUri).then( (jsonString){

      var nationsJson = jsonDecode(jsonString);



      //se já houver nações no estado da tabela...

      if (tableStateNotifier.value['status'] != TableStatus.loading) nationsJson = [...tableStateNotifier.value['dataObjects'], ...nationsJson];



      tableStateNotifier.value = {

        'itemType': ItemType.nation,

        'status': TableStatus.ready,

        'dataObjects': nationsJson,

        'propertyNames': ["nationality","capital","language","national_sport"],

        'columnNames': ["Nome", "Capital", "Idioma","Esporte"]

      };

    });

  }



  void carregarCervejas(){

    //ignorar solicitação se uma requisição já estiver em curso

    if (tableStateNotifier.value['status'] == TableStatus.loading) return;

    //emitir estado loading se items em exibição não forem cervejas

    if (tableStateNotifier.value['itemType'] != ItemType.beer){

      tableStateNotifier.value = {

        'status': TableStatus.loading,

        'dataObjects': [],

        'itemType': ItemType.beer

      };

    } 

    



    var beersUri = Uri(

      scheme: 'https',

      host: 'random-data-api.com',

      path: 'api/beer/random_beer',

      queryParameters: {'size': '10'});



    http.read(beersUri).then( (jsonString){

      var beersJson = jsonDecode(jsonString);

      

      //se já houver cervejas no estado da tabela...

      if (tableStateNotifier.value['status'] != TableStatus.loading) beersJson = [...tableStateNotifier.value['dataObjects'], ...beersJson];



      tableStateNotifier.value = {

        'itemType': ItemType.beer,

        'status': TableStatus.ready,

        'dataObjects': beersJson,

        'propertyNames': ["name","style","ibu"],

        'columnNames': ["Nome", "Estilo", "IBU"]

      };

    });

    

  }

}



final dataService = DataService();





void main() {

  MyApp app = MyApp();

  runApp(app);

}



class MyApp extends StatelessWidget {



  @override

  Widget build(BuildContext context) {

    return MaterialApp(

      theme: ThemeData(primarySwatch: Colors.deepPurple),

      debugShowCheckedModeBanner:false,

      home: Scaffold(

        appBar: AppBar( 

          title: const Text("Dicas"),

          ),

        body: ValueListenableBuilder(

          valueListenable: dataService.tableStateNotifier,

          builder:(_, value, __){

            switch (value['status']){

              case TableStatus.idle: 

                return Center(child: Text("Toque em algum botão"));

              case TableStatus.loading:

                return Center(child: CircularProgressIndicator());

              case TableStatus.ready: 

                return SingleChildScrollView(child: DataTableWidget(

                  jsonObjects: value['dataObjects'], 

                  propertyNames: value['propertyNames'], 

                  columnNames: value['columnNames']

                )) ;

              case TableStatus.error: 

                return Text("Lascou");

            }

            return Text("...");

            

          }

        ),

        bottomNavigationBar: NewNavBar(itemSelectedCallback: dataService.carregar),

      ));

  }



}





class NewNavBar extends HookWidget {

  final _itemSelectedCallback;

  NewNavBar({itemSelectedCallback}):

    _itemSelectedCallback = itemSelectedCallback ?? (int){}

    



  @override

  Widget build(BuildContext context) {

    var state = useState(1);

    

    return BottomNavigationBar(

      onTap: (index){

        state.value = index;

        _itemSelectedCallback(index);                

      }, 

      currentIndex: state.value,

      items: const [

        BottomNavigationBarItem(

          label: "Cafés",

          icon: Icon(Icons.coffee_outlined),

        ),



        BottomNavigationBarItem(

            label: "Cervejas", icon: Icon(Icons.local_drink_outlined)),



        BottomNavigationBarItem(

          label: "Nações", icon: Icon(Icons.flag_outlined))

      ]);



  }



}







class DataTableWidget extends StatelessWidget {



  final List jsonObjects;

  final List<String> columnNames;

  final List<String> propertyNames;



  DataTableWidget( {this.jsonObjects = const [], this.columnNames = const [], this.propertyNames= const []});



  @override

  Widget build(BuildContext context) {

    return DataTable(

      columns: columnNames.map( 

                (name) => DataColumn(

                  label: Expanded(

                    child: Text(name, style: TextStyle(fontStyle: FontStyle.italic))

                  )

                )

              ).toList()       

      ,

      rows: jsonObjects.map( 

        (obj) => DataRow(

            cells: propertyNames.map(

              (propName) => DataCell(Text(obj[propName]))

            ).toList()

          )

        ).toList());

  }



}