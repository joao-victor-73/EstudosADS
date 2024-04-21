// Questão 4 -> Inserção indeterminado de notas;
import 'dart:io';

main() {
  List<int> listaNotas = [];
  int cont = 0;
  int somaNotas = 0;

  while (true) {
    stdout.write("Digite uma nota: ");
    String resposta = stdin.readLineSync().toString();
    int nota = int.parse(resposta); // Converte de String para INT

    if (nota < 0) {
      break;
    }

    cont += 1;
    somaNotas += nota;

    listaNotas.add(nota);
  }

  // Quantidade de notas digitadas
  print("A quantidade de notas digitadas foram de: $cont.");

  // A lista com todas as notas digitadas
  print("As notas digitadas foram: $listaNotas");

  // Invertendo a lista para apresentar o modo inverso dela
  Iterable<int> listaNotasInverso = listaNotas.reversed;
  print("A lista de notas invertidas é: $listaNotasInverso");

  // Soma de todas as notas
  print("A soma de todas as notas digitadas foi de $somaNotas");

  // Media de todas as notas
  double mediaNotas = somaNotas / cont;
  print("A média de todas as notas foram ${mediaNotas.toStringAsFixed(2)}");

  // Apresentação de todas as notas acima da média;
  List<int> listaAcimaMedia = [];
  for (int i = 0; i < listaNotas.length; i++) {
    if (listaNotas[i] > mediaNotas) {
      listaAcimaMedia.add(listaNotas[i]);
    }
  }
  print("As notas que estão acima da média é: $listaAcimaMedia");
}
