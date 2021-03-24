import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List _itens = [];

  void _carregarItens() {
    _itens = [];
    for (int i = 0; i <= 10; i++) {
      Map<String, dynamic> item = Map();
      item["titulo"] = "Título ${i} Loremi ipsu dolor sit amet.";
      item["descricao"] = "Descricao ${i} Loremi ipsu dolor sit amet.";
      _itens.add(item);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //floatingActionButton: Flo,
      appBar: AppBar(
        title: Text("Total itens Lista ${_itens.length}"),
        actions: <Widget>[
          FlatButton.icon(
            onPressed: () {
              setState(() {
                _carregarItens();
              });
            },
            icon: Icon(Icons.check_outlined),
            label: Text("Rodar lista Padrao"),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView.builder(
          itemCount: _itens.length,
          itemBuilder: (context, indice) {
            //Map<String, dynamic> item = _itens[indice];
            //print("item ${item["titulo"]}");
            return ListTile(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text("Remover Título ${indice} ?"),
                      titlePadding: EdgeInsets.all(20),
                      titleTextStyle: TextStyle(
                        fontSize: 20,
                        color: Colors.orange,
                      ),
                      content: Text(_itens[indice]["descricao"]),
                      actions: <Widget>[
                        FlatButton(
                          onPressed: () {
                            setState(() {
                              _itens.removeAt(indice);
                            });
                            print("Contagem: ${_itens.length}");
                            Navigator.pop(context);
                          },
                          child: Text("Sim"),
                        ),
                        FlatButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text("Não"),
                        ),
                      ],
                      //backgroundColor: Colors.red,
                    );
                  },
                );
              },
              //onLongPress: () {},
              title: Text(_itens[indice]["titulo"]),
              subtitle: Text(_itens[indice]["descricao"]),
            );
          },
        ),
      ),
    );
  }
}
