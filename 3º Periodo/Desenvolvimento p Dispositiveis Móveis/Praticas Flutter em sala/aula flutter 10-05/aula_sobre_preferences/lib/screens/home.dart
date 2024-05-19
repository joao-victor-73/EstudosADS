import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController textoNome = TextEditingController();
  TextEditingController textoFone = TextEditingController();  

  String nome = "";
  String fone = "";

  // GRAVAÇÃO EM PREFERENCES  
  Future<void> gravarPreference() async {
    SharedPreferences dadosPref = await SharedPreferences.getInstance();

    dadosPref.setString("nome", textoNome.text);
    dadosPref.setString("fone", textoFone.text);

    textoNome.clear();
    textoFone.clear();
  }

  // LEITURA EM PREFERENCES
  Future<void> lerPreference() async {
    SharedPreferences dadosPref = await SharedPreferences.getInstance();

    setState(() {
      nome = dadosPref.getString("nome") as String;
      fone = dadosPref.getString("fone") as String;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "App Salvar Dados",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context, 
                  builder: (context) => AlertDialog(
                    title: Text("Dados do Preference"),
                    content: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextField(
                          controller: textoNome,
                          decoration: InputDecoration(label: Text("Nome")),
                        ),
                        TextField(
                          controller: textoFone,
                          decoration: InputDecoration(label: Text("Telefone")),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            gravarPreference();
                            Navigator.pop(context);
                          },
                          child: Text("Salvar"),
                        )
                      ],
                    )
                  ),
                );
              },
              child: Text("Forms Prefences"),
            ),
            ElevatedButton(
              onPressed: () {
                lerPreference();
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text(
                      "Dados do Preference",
                      style: TextStyle(fontSize: 20, color: Colors.blue),
                    ),
                    content: Text(
                      "Nome" + nome + "\n Fone: " + fone,
                      style: TextStyle(fontSize: 25),
                    ),
                  )
                );
              },
              child: Text("Ler Dados dos Preferences"),
            ),
          ],
        )
      ),
    );
  }
}