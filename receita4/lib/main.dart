import 'package:flutter/material.dart';

var dataObjects = [
  {"name": "La Fin Du Monde", "style": "Bock", "ibu": "65"},
  {"name": "Sapporo Premiume", "style": "Sour Ale", "ibu": "54"},
  {"name": "Duvel", "style": "Pilsner", "ibu": "82"},
  {"name": "Guinness Draught", "style": "Stout", "ibu": "45"},
  {"name": "Chimay Bleue", "style": "Dubbel", "ibu": "30"},
  {"name": "Leffe Blonde", "style": "Blond Ale", "ibu": "20"}
];

void main() {
  MyApp app = MyApp();
  runApp(app);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Dicas"),
        ),
        body: MytileWidget(dataObjects: dataObjects),
        bottomNavigationBar: NewNavBar(),
      ),
    );
  }
}

class NewNavBar extends StatelessWidget {
  NewNavBar();

  void botaoFoiTocado(int index) {
    print("Tocaram no botão $index");
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: botaoFoiTocado,
      items: const [
        BottomNavigationBarItem(
          label: "Cafés",
          icon: Icon(Icons.coffee_outlined),
        ),
        BottomNavigationBarItem(
            label: "Cervejas", icon: Icon(Icons.local_drink_outlined)),
        BottomNavigationBarItem(
            label: "Nações", icon: Icon(Icons.flag_outlined))
      ],
    );
  }
}

class MytileWidget extends StatelessWidget {
  final List dataObjects;

  MytileWidget({required this.dataObjects});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: dataObjects.length,
      itemBuilder: (BuildContext context, int index) {
        final obj = dataObjects[index];
        return ListTile(
          title: Text(obj["name"]),
          subtitle: Text(obj["style"]),
          trailing: Text(obj["ibu"]),
        );
      },
    );
  }
}
