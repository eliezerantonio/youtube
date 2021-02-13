import 'package:flutter/material.dart';

class BibliotecaScreen extends StatefulWidget {
  BibliotecaScreen({Key key}) : super(key: key);

  @override
  _BibliotecaScreenState createState() => _BibliotecaScreenState();
}

class _BibliotecaScreenState extends State<BibliotecaScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("Biblioteca"),
      ),
    );
  }
}
