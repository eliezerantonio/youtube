import 'package:flutter/material.dart';
import 'package:you_tube/screens/biblioteca_screen.dart';
import 'package:you_tube/screens/em_alta_screen.dart';
import 'package:you_tube/screens/inicio_screen.dart';
import 'package:you_tube/screens/inscricao_screen.dart';
import 'package:you_tube/widgets/custom_search_delegate.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _indiceActual = 0;
  String _resultado = "";
  @override
  Widget build(BuildContext context) {
    List<Widget> telas = [
      InicioScreen(
        pesquisa: _resultado,
      ),
      EmAltaScreen(),
      IncricaoScreen(),
      BibliotecaScreen(),
    ];

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.grey, opacity: 1),
        title: Image.asset(
          "images/youtube.png",
          width: 98,
          height: 22,
        ),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () async {
              String res = await showSearch(
                  context: context, delegate: CustomSearchDelegate());
              print("resultado: digitado " + res);

              setState(() {
                _resultado = res;
              });
            },
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: telas[_indiceActual],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.red,
        currentIndex: _indiceActual,
        onTap: (indece) {
          setState(() {
            _indiceActual = indece;
          });
        },
        items: [
          BottomNavigationBarItem(
            title: Text("Inicio"),
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            title: Text("Em alta"),
            icon: Icon(Icons.whatshot),
          ),
          BottomNavigationBarItem(
            title: Text("Inscricoes"),
            icon: Icon(Icons.subscriptions),
          ),
          BottomNavigationBarItem(
            title: Text("Biblioteca"),
            icon: Icon(Icons.folder),
          ),
        ],
      ),
    );
  }
}
