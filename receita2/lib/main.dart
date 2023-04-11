import 'package:flutter/material.dart';

class MyNavBar extends BottomNavigationBar {
  MyNavBar({
    required List<IconData> icons,
    required List<String> labels,
    required Function(int) onTap,
  }) : super(
          onTap: onTap,
          items: List.generate(
            icons.length,
            (index) => BottomNavigationBarItem(
              icon: Icon(icons[index]),
              label: labels[index],
            ),
          ),
        );
}

class MyColumn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Text("La Fin Du Monde - Bock - 65 ibu"),
        ),
        Expanded(
          child: Text("Sapporo Premiume - Sour Ale - 54 ibu"),
        ),
        Expanded(
          child: Text("Duvel - Pilsner - 82 ibu"),
        ),
      ],
    );
  }
}

class MyAppBar extends AppBar {
  MyAppBar() : super(title: Text("Minhas Dicas"));
}

class MyApp extends StatelessWidget {
  void botaoFoiTocado(int index) {
    print("Tocaram no botão $index");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: Scaffold(
        appBar: MyAppBar(),
        body: MyColumn(),
        bottomNavigationBar: MyNavBar(
          icons: [
            Icons.coffee_outlined,
            Icons.local_drink_outlined,
            Icons.flag_outlined,
          ],
          labels: ["Cafés", "Cervejas", "Nações"],
          onTap: botaoFoiTocado,
        ),
      ),
    );
  }
}

void main() {
  MyApp app = MyApp();
  runApp(app);
}
