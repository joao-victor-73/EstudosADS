// Questão 7 -> Verificando se o email está correto
import 'dart:io';

String verificandoEmail(String email) {
  bool contemEmail = email.contains('@uninassaustore.com.br');

  if(contemEmail){
    return 'O email está correto!'; // Retornará TRUE
  }else{
    return 'O email não está correto!'; // Retornará FALSE
  }
}

main() {
  stdout.write("Digite o email: ");
  String email = stdin.readLineSync().toString();

  print(verificandoEmail(email));
}
