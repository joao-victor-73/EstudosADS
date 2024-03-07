// Questão 2 -> Subiu de patente ou não?
import 'dart:io';

String verificarPontuacao(List resultados) {
  int pontuacao = 0;
  // Percorrer lista
  for (int i = 0; i < resultados.length; i++) {
    if (resultados[i] == 'V') {
      pontuacao += 10;
    } else if (resultados[i] == 'E') {
      pontuacao += 5;
    } else if (resultados[i] == 'D') {
      pontuacao -= 2;
    } else {
      return 'Informação desconhecida';
    }
  }
  return pontuacao.toString();
}



main() {
  List<String> listaResultados = [];

  for (int i = 10; i >= 1; i--) {
    stdout.write("Digite o resultado da $iº partida: ");
    String resultado = stdin.readLineSync().toString().toUpperCase();

    listaResultados.add(resultado);
  }

  print(verificarPontuacao(listaResultados));
}
