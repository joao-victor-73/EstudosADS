// Questão 1 -> Menor ou igual
import 'dart:io';

String? menorIgual(double a, double b) {
  if (a < b) {
    return "O Número ${a.toString()} é menor que ${b.toString()}";
  } else if (b < a) {
    return "O Número ${b.toString()} é menor que ${a.toString()}";
  } else if (a == b) {
    return "Os números digitados são IGUAIS";
  } else {
    return "Algo não está certo! Tente Novamente!";
  }
}

main() {
  stdout.write("Informe um número: ");
  String num1 = stdin.readLineSync().toString().replaceAll(',', '.');

  stdout.write("Informe um outro número: ");
  String num2 = stdin.readLineSync().toString().replaceAll(',', '.');

  // Transformando de String para double
  double numConvertido1 = double.parse(num1);
  double numConvertido2 = double.parse(num2);

  print(menorIgual(numConvertido1, numConvertido2));
}
