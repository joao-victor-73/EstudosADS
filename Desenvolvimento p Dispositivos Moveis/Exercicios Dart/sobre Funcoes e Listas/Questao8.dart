// Questão 8 -> Formatando uma data

import 'dart:io';

String mesPorExtenso(String mes) {
  if (mes == '01' || mes == '1') {
    return 'Janeiro';
  } else if (mes == '03' || mes == '3') {
    return 'Março';
  } else if (mes == '04' || mes == '4') {
    return 'Abril';
  } else if (mes == '05' || mes == '5') {
    return 'Maio';
  } else if (mes == '06' || mes == '6') {
    return 'Junho';
  } else if (mes == '07' || mes == '7') {
    return 'Julho';
  } else if (mes == '08' || mes == '8') {
    return 'Agosto';
  } else if (mes == '09' || mes == '9') {
    return 'Setembro';
  } else if (mes == '10') {
    return 'Outubro';
  } else if (mes == '11') {
    return 'Novembro';
  } else if (mes == '12') {
    return 'Dezembro';
  } else {
    return 'Algo está errado! Tente novamente!';
  }
}

String dataFormatada(String dia, String mesExtenso, String ano) {
  return "DATA: $dia de $mesExtenso de $ano";
}

main() {
  stdout.write("Digite o dia: ");
  String dia = stdin.readLineSync().toString();

  stdout.write("Digite o mes: ");
  String mes = stdin.readLineSync().toString();

  stdout.write("Digite o ano: ");
  String ano = stdin.readLineSync().toString();

  print(dataFormatada(dia, mesPorExtenso(mes), ano));
}
