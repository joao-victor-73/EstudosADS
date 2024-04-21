// Questão 3 -> Perguntas sobre um crime
import 'dart:io';

/* “Telefonou para a vítima?”
“Esteve no local do crime?”
“Mora perto da vítima?”
"Tinha dívidas com a vítima?”
“Já trabalhou com a vítima?” */

main() {
  List<String> perguntas = [
    "Telefonou para a vitima?",
    "Esteve no local do crime?",
    "Mora perto da vítima?",
    "Tinha dívidas com a vítima?",
    "Já trabalhou com a vítima?",
  ];

  print("=" * 55);
  print("   Eu irei fazer algumas perguntas sobre a vítima.");
  print("           Responda com SIM ou NÃO");
  print("=" * 55);

  // List<String> respostas = [];

  int contRespostas = 0;

  for (int i = 0; i < perguntas.length; i++) {
    print(perguntas[i]);
    stdout.write("SIM[S] ou NAO[N]? ");
    String respondeu = stdin.readLineSync().toString().toUpperCase();
    print("");

    // Conta quantas vezes foi respondido positivamente uma das frases;
    if (respondeu == 'S') {
      contRespostas += 1;
    }

    //respostas.add(respondeu);
  }

  // Condicionais para ver se a pessoa é um dos casos;
  if (contRespostas == 2) {
    print("A pessoa é considerada como SUSPEITA!");
  } else if (contRespostas >= 3 && contRespostas <= 4) {
    print("A pessoa é considerada como CÚMPLICE!");
  } else if (contRespostas >= 5) {
    print("A pessoa é considerada como ASSASINO!");
  } else if (contRespostas < 2) {
    print("A pessoa é considerada como INOCENTE!");
  } else {
    print("Algo deu errado!  Tente novamente!");
  }

}
