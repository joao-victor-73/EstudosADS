import 'dart:io';

main() {
  // Área da circunferência = PI * raio * raio

  const PI = 3.1415;

  stdout.write("Informe o raio: ");
  final entradaDoUsuario = stdin
      .readLineSync()!; // Permite ler a entrada do usuário (precisa importar a biblioteca)
  final double raio = double.parse(entradaDoUsuario);

  // entradaDoUsuario = "";

  final area = PI * raio * raio;
  print("O valor da área é: " + area.toString());
}
