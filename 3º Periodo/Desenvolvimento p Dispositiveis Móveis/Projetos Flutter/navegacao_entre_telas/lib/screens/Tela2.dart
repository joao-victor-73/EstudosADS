import 'package:exercicio_navigator/estudante.dart';
import 'package:flutter/material.dart';

class Tela2 extends StatelessWidget {
  const Tela2({super.key});

  @override
  Widget build(BuildContext context) {

    Estudante estudanteRecebido = ModalRoute.of(context)?.settings.arguments as Estudante;

    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,

        child: Column(
          children: [
            Text(estudanteRecebido.nome.toString()),
            Text(estudanteRecebido.disciplina.toString()),
            Text(estudanteRecebido.media.toString()),
            Text(estudanteRecebido.situacao.toString()),
          ],
        )
      ),
    );
  }
}