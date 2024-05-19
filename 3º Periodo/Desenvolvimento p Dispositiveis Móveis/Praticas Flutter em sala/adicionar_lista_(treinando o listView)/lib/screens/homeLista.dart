import 'package:flutter/material.dart';

class HomeLista extends StatefulWidget {
  const HomeLista({Key? key}) : super(key: key);

  @override
  State<HomeLista> createState() => _HomeListaState();
}

class _HomeListaState extends State<HomeLista> {
  List listaCarros = [];

  var controllerTexto = TextEditingController();
  var controllerEdit = TextEditingController();

  // ADICIONAR ITEM NA LISTA
  void addItem(String texto) {
    setState(() {
      listaCarros.add(texto);
      controllerTexto.clear();
    });
  }

  // REMOVER ITEM DA LISTA
  void removerItem(int indexItem) {
    showDialog(
        context: context,
        builder: ((context) => AlertDialog(
              title: Text("Excluindo Item"),
              content: Text("Deseja remover o item" +
                  listaCarros[indexItem].toString() +
                  "?"),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      listaCarros.removeAt(indexItem);
                    });
                    Navigator.of(context).pop();
                  },
                  child: Text("Sim"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("Não"),
                ),
              ],
            )));
  }

  // EDITAR ITEM DA LISTA
  void editarItem(int indiceItem) {
    setState(() {
      controllerEdit.text = listaCarros[indiceItem];
    });
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text("Editar o Item" + listaCarros[indiceItem] + "?"),
              content: TextField(
                controller: controllerEdit,
              ),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    String novoTexto = controllerEdit.text;
                    setState(() {
                      listaCarros[indiceItem] = novoTexto;
                      Navigator.of(context).pop();
                      controllerTexto.clear;
                    });
                  },
                  child: Text("Atualizar"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("Cancelar"),
                ),
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "App lista de CARROS!",
          style: TextStyle(color: Color(0xfff12054)),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                  child: TextField(
                controller: controllerTexto,
              )),
              GestureDetector(
                child: Icon(Icons.add),
                onTap: () {
                  addItem(controllerTexto.text);
                },
              )
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: listaCarros.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(listaCarros[index]),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () {
                          editarItem(index);
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: () {
                          removerItem(index);
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
