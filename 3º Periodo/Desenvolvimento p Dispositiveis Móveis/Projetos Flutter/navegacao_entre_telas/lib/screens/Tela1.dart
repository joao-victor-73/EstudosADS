import 'package:exercicio_navigator/estudante.dart';
import 'package:exercicio_navigator/screens/Tela2.dart';
import 'package:flutter/material.dart';

class Tela1 extends StatefulWidget {
  const Tela1({super.key});

  @override
  State<Tela1> createState() => _Tela1State();
}

class _Tela1State extends State<Tela1> {

  TextEditingController controllerNome = TextEditingController();
  TextEditingController controllerDisciplina = TextEditingController();
  TextEditingController controllerNota1 = TextEditingController();
  TextEditingController controllerNota2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            TextField(
              controller: controllerNome,
              decoration: InputDecoration(
                label: Text("Informe o nome")
              ),
            ),
            TextField(
              controller: controllerDisciplina,
              decoration: InputDecoration(
                label: Text("Informe a Disciplina")
              ),
            ),
            TextField(
              controller: controllerNota1,
              decoration: InputDecoration(
                label: Text("Informe a 1º nota")
              ),
            ),
            TextField(
              controller: controllerNota2,
              decoration: InputDecoration(
                  label: Text("Informe a 2º nota")
              ),
            ),
            TextButton(onPressed: () {
              Estudante estudanteNovo = Estudante();
              estudanteNovo.nome = controllerNome.text;
              estudanteNovo.disciplina = controllerDisciplina.text;

              double nota1 = double.parse(controllerNota1.text);
              double nota2 = double.parse(controllerNota2.text);

              estudanteNovo.media = (nota1 + nota2) / 2;

              if (estudanteNovo.media! >= 7) {
                estudanteNovo.situacao = "Parabéns! Você está aprovado!";
              } else {
                estudanteNovo.situacao = "Infelizmente você não está aprovado!";
              }

              Navigator.push(
                context, 
                MaterialPageRoute(
                  settings: RouteSettings(arguments: estudanteNovo),
                  builder: (contexxt) => Tela2()
                ),
              );

            }, 
            child: Text("Calcular Média")),
          ],
        ),
      ),
    );
  }
}