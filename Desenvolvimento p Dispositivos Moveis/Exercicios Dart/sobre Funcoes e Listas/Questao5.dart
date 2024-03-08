// Questão 5 -> Temperatura do mês

import 'dart:io';

main() {
  List<String> mesesDoAno = [
    "Janeiro",
    "Fevereiro",
    "Março",
    "Abril",
    "Maio",
    "Junho",
    "Julho",
    "Agosto",
    "Setembro",
    "Outubro",
    "Novembro",
    "Dezembro"
  ];

  Map<String, int> listaDeTemperaturas = {};

  double somaTemperaturas = 0;

  for (int i = 0; i < mesesDoAno.length; i++) {
    stdout.write("Qual a temperatura média do mês de ${mesesDoAno[i]}?: ");
    String tempEmString = stdin.readLineSync().toString();

    int temperatura = int.parse(tempEmString);

    listaDeTemperaturas[mesesDoAno[i]] = temperatura;

    somaTemperaturas += temperatura;
  }
  print("");
  print(
      "A média da temperatura anual é de ${(somaTemperaturas / 12).toStringAsFixed(2)}ºC");

  // Percorrendo um Map e mostrando na tela o mês, com a temperatura do lado;
  int m = 0;
  for (MapEntry<String, int> mesTemperatura in listaDeTemperaturas.entries) {
    m += 1;
    print("$m - ${mesTemperatura.key}: ${mesTemperatura.value}ºC");
  } 
}
