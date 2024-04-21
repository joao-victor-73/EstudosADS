/* < ESTRUTURA PADRÃO DE UMA APLICAÇÃO FLUTTER >
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Text('Extrutura Padrão!'),
    );
  }
}
*/

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
        primarySwatch: Colors.blueGrey,
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("NASSAU PAY",
                style: TextStyle(fontSize: 40, color: Colors.black)),
            const Text("Gerencie suas contas!",
                style: TextStyle(fontSize: 25, color: Color(0xff08bc52))),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
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
                  const Text("Esqueceu a sua senha? Clique aqui!",
                      style: TextStyle(fontSize: 20, color: Color(0xff200de9))),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: TextButton(
                          onPressed: () {
                            // Lógica a ser executada quando o botão for pressionado
                            print('Botão pressionado!');
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                Colors.green.shade700),
                          ),
                          child: Text(
                            'Pressione aqui',
                            style: TextStyle(
                              fontSize: 16,
                              color: Color(0xff000a12),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
