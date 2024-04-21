import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meu App',
      theme: ThemeData(
        // Defina o tema do seu aplicativo aqui
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15),
        color: Colors.blue,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Cadastro do Usuário",
                style: TextStyle(fontSize: 30, color: Colors.amber)),
            const TextField(
                decoration: InputDecoration(
                    labelText: "Nome", filled: true, fillColor: Colors.white)),
            const TextField(
                obscureText: true,
                decoration: InputDecoration(
                    labelText: "Senha", filled: true, fillColor: Colors.white)),
            const TextField(
                decoration: InputDecoration(
                    labelText: "Email", filled: true, fillColor: Colors.white)),
            const TextField(
              decoration: InputDecoration(
                  labelText: "Telefone", filled: true, fillColor: Colors.white),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white)),
                  onPressed: () {
                    print("Botão Pressionado!");
                  },
                  child: const Text(
                    "Limpar Tela",
                    style: TextStyle(color: Colors.blue, fontSize: 25),
                  ),
                ),
                TextButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white)),
                  onPressed: () {
                    print("Botão Pressionado!");
                  },
                  child: const Text(
                    "Salvar",
                    style: TextStyle(color: Colors.blue, fontSize: 25),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
