import 'package:flutter/material.dart';

class CustomSearchDelegate extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, "");
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    //print("resultado: pesquisa realizada");
    close(context, query);
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    //print("resultado: digitado " + query );

    List<String> _lista = List();

    if (query.isNotEmpty) {
      _lista = ["Sucesso", "Sonhos", "Habito"].where((element) {
        return element.toLowerCase().startsWith(query.toLowerCase());
      }).toList();

      return ListView.builder(
        itemCount: _lista.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              close(context, index.toString());
            },
            title: Text(_lista[index]),
          );
        },
      );
    } else {
      return Center(child: Text("Nenhum resultado para pesquisa"));
    }
  }
}
