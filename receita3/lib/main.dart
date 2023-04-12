import 'package:flutter/material.dart';

void main() {
  MyApp app = MyApp();

  runApp(app);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          iconTheme: IconThemeData(color: Colors.green),
        ),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          drawer: NavDrawer(),
          appBar: AppBar(
            title: const Text("Dicas"),
          ),
          body: DataBodyWidget(objects: const [
            "La Fin Du Monde - Bock - 65 ibu",
            "Sapporo Premiume - Sour Ale - 54 ibu",
            "Duvel - Pilsner - 82 ibu"
          ]),
          bottomNavigationBar: NewNavBar(
            Newicons: const [
              Icon(Icons.home),
              Icon(Icons.search),
              Icon(Icons.favorite),
              Icon(Icons.person),
            ],
          ),
        ));
  }
}

class NewNavBar extends StatelessWidget {
  List<Icon> Newicons;
  NewNavBar({this.Newicons = const []});

  void botaoFoiTocado(int index) {
    print("Tocaram no botão $index");
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        onTap: botaoFoiTocado,
        // fixedColor: Colors.green,
        items: Newicons.map(
            (icn) => BottomNavigationBarItem(label: " ", icon: icn)).toList());
  }
}

class DataBodyWidget extends StatelessWidget {
  List<String> objects;

  DataBodyWidget({this.objects = const []});

  Expanded processarUmElemento(String obj) {
    return Expanded(
      child: Center(child: Text(obj)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        children: objects
            .map((obj) => Expanded(
                  child: Center(child: Text(obj)),
                ))
            .toList());
  }
}

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.deepPurple,
            ),
            // child: Text(
            //   'Colors Menu',
            //   style: TextStyle(color: Colors.white, fontSize: 25),
            // ),
            child: Container(
              height: 100,
              child: const Center(
                child: Text(
                  'Colors Menu',
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Container(
            color: Colors.green,
            child: ListTile(
              leading: Icon(Icons.format_paint),
              title: Text('Green'),
              onTap: () => {},
            ),
          ),
          Container(
            color: Colors.red,
            child: ListTile(
              leading: Icon(Icons.format_paint),
              title: Text('Red'),
              onTap: () => {},
            ),
          ),
          Container(
            color: Colors.blue,
            child: ListTile(
              leading: Icon(Icons.format_paint),
              title: Text('Blue'),
              onTap: () => {},
            ),
          ),
        ],
      ),
    );
  }
}
