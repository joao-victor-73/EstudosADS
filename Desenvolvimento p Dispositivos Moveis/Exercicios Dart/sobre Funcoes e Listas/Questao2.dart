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

String subindoRank(var pont) {
  // pont == pontuacao
  if (pont > 60) {
    return "Parabéns, você SUBIU DE PATENTE!";
  } else if (pont >= 21 && pont <= 59) {
    return "Você PERMANECE na mesma PATENTE!";
  } else if (pont < 21) {
    return "Você CAIU de PATENTE!";
  }else {
    return "Algo está errado!";
  }
}

main() {
  List<String> listaResultados = [];

  print("LEMBRANDO: V - VITORIA / E - EMPATE / D - DERROTA");

  for (int i = 10; i >= 1; i--) {
    stdout.write("Digite o resultado da $iº partida: ");
    String resultado = stdin.readLineSync().toString().toUpperCase();

    listaResultados.add(resultado);
  }

  String pontuacoesFinais = verificarPontuacao(listaResultados);
  int pontuacoesFinaisConvertido = int.parse(pontuacoesFinais);

  print("Jogador! Você tem uma pontuação de ${verificarPontuacao(listaResultados)} pontos.");
  print("E com base nesses pontos, você... ${subindoRank(pontuacoesFinaisConvertido)}");
}
