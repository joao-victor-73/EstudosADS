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
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text("NASSAU PAY",
                style: TextStyle(fontSize: 45, color: Colors.black)),
            const Text("Gerencie suas contas!",
                style: TextStyle(fontSize: 30, color: Colors.green)),
            const TextField(
                decoration: InputDecoration(
                    labelText: "Digite seu Email",
                    filled: true,
                    fillColor: Colors.white)),
            const TextField(
                obscureText: true,
                decoration: InputDecoration(
                    labelText: "Digite sua Senha",
                    filled: true,
                    fillColor: Colors.white)),
            const Text(
              "Esqueceu sua senha? Clique Aqui!",
              style: TextStyle(fontSize: 20, color: Color(0xff0303e7)),
            ),
            ElevatedButton(
              style: ButtonStyle(
                  // backgroundColor: MaterialStateProperty.all(Colors.white),
                  ),
              onPressed: () {
                print("Entrou no sistema");
              },
              child: const Text(
                "Entrar",
                style: TextStyle(color: Colors.blue, fontSize: 25),
              ),
            ),
            const Text(
              "Ainda não tem cadastro? Clique Aqui!",
              style: TextStyle(fontSize: 20, color: Colors.green),
            ),
          ],
        ),
      ),
    );
  }
}
