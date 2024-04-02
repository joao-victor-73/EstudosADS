import 'dart:io';

void main() {
  var produtosAlimentos = [];
  var produtosBebidas = [];
  var produtosLimpeza = [];
  var produtosHigiene = [];
  var produtosOutros = [];

  while (true) {
    print("=" * 60);
    print(" <=========== SOFTWARE DE CADASTRO DE PRODUTOS ===========>");
    print("     1 - Cadastro de produto");
    print("     2 - Alterar produto");
    print("     3 - Listar e contar produto");
    print("     4 - Deletar produto");
    print("     5 - Sair do programa");
    print("=" * 60);

    var op = int.parse(stdin.readLineSync()!);

    if (op == 1) {
      while (true) {
        var tipoProduto = escolhaTipoProduto();

        if (tipoProduto == 6) {
          break;
        }

        cadastrando(tipoProduto, produtosAlimentos, produtosBebidas,
            produtosLimpeza, produtosHigiene, produtosOutros);
      }
    } else if (op == 2) {
      while (true) {
        var tipoProduto = escolhaTipoProduto();

        if (tipoProduto == 6) {
          break;
        }

        atualizar(tipoProduto, produtosAlimentos, produtosBebidas,
            produtosLimpeza, produtosHigiene, produtosOutros);
      }
    } else if (op == 3) {
      while (true) {
        var tipoProduto = escolhaTipoProduto();

        if (tipoProduto == 6) {
          break;
        }

        listarContar(tipoProduto, produtosAlimentos, produtosBebidas,
            produtosLimpeza, produtosHigiene, produtosOutros);
      }
    } else if (op == 4) {
      while (true) {
        var tipoProduto = escolhaTipoProduto();

        if (tipoProduto == 6) {
          break;
        }

        deletar(tipoProduto, produtosAlimentos, produtosBebidas,
            produtosLimpeza, produtosHigiene, produtosOutros);
      }
    } else if (op == 5) {
      break;
    }
  }
}

int escolhaTipoProduto() {
  print("=" * 60);
  print("        <=========== SOFTWARE DE PRODUTOS ===========>");
  print("     1 - Alimentos");
  print("     2 - Bebidas");
  print("     3 - Produtos de Limpeza");
  print("     4 - Higiene");
  print("     5 - Outros");
  print("     6 - Voltar");
  print("=" * 60);

  print("Qual o tipo de produto desejado? ");
  var opProdutos = int.parse(stdin.readLineSync()!);

  return opProdutos;
}

void cadastrando(int tipo, List produtosAlimentos, List produtosBebidas,
    List produtosLimpeza, List produtosHigiene, List produtosOutros) {
  print("");

  print("Qual o nome do produto a ser armazenado: ");
  var prod = stdin.readLineSync()!.toUpperCase();

  switch (tipo) {
    case 1: // Alimento
      produtosAlimentos.add(prod);
      break;
    case 2: // Bebidas
      produtosBebidas.add(prod);
      break;
    case 3: // Produto de Limpeza
      produtosLimpeza.add(prod);
      break;
    case 4: // Higiene
      produtosHigiene.add(prod);
      break;
    case 5: // Outros
      produtosOutros.add(prod);
      break;
  }
}

void atualizar(int tipo, List produtosAlimentos, List produtosBebidas,
    List produtosLimpeza, List produtosHigiene, List produtosOutros) {
  switch (tipo) {
    case 1:
      print("=" * 25);
      for (var p in produtosAlimentos) {
        print(p);
      }
      print("=" * 25);

      print("\nQual produto deseja att? ");
      var att = stdin.readLineSync()!.toUpperCase();

      if (produtosAlimentos.contains(att)) {
        var indice = produtosAlimentos.indexOf(att);

        print("Digite o novo produto: ");
        produtosAlimentos[indice] = stdin.readLineSync()!.toUpperCase();

        print("=" * 25);
        print("A nova lista de alimentos ficou assim:");
        for (var p in produtosAlimentos) {
          print(p);
        }
        print("=" * 25);
      } else {
        print("Produto não está na lista de produtos. Tente novamente");
        atualizar(tipo, produtosAlimentos, produtosBebidas, produtosLimpeza,
            produtosHigiene, produtosOutros);
      }
      break;
    // Resto do código aqui
  }
}

void listarContar(int tipo, List produtosAlimentos, List produtosBebidas,
    List produtosLimpeza, List produtosHigiene, List produtosOutros) {
  switch (tipo) {
    case 1:
      print("=" * 50);
      print("< Os produtos cadastrados na categoria de alimentos são:  >\n");
      for (var p in produtosAlimentos) {
        print("| $p |");
      }
      print("\nE temos um total de ${produtosAlimentos.length} itens na lista");
      print("=" * 50);
      break;
    // Resto do código aqui
  }
}

void deletar(int tipo, List produtosAlimentos, List produtosBebidas,
    List produtosLimpeza, List produtosHigiene, List produtosOutros) {
  switch (tipo) {
    case 1:
      print("=" * 50);
      print("Os produtos na lista de Alimentos são:");
      for (var p in produtosAlimentos) {
        print(p);
      }
      print("=" * 50);

      print("\nDigite o nome do produto que deseja deletar: ");
      var apagar = stdin.readLineSync()!.toUpperCase();

      if (produtosAlimentos.contains(apagar)) {
        var indice = produtosAlimentos.indexOf(apagar);
        produtosAlimentos.removeAt(indice);

        print(">>> O PRODUTO $apagar FOI DELETADO COM SUCESSO! <<<");
      }
      print("=" * 50);

      print("Os produtos na lista de alimentos são: ");
      for (var p in produtosAlimentos) {
        print(p);
      }

      print("=" * 50);
      break;

    case 2:
      print("=" * 50);
      print("Os produtos na lista de Bebidas são:");
      for (var p in produtosBebidas) {
        print(p);
      }
      print("=" * 50);

      print("\nDigite o nome do produto que deseja deletar: ");
      var apagar = stdin.readLineSync()!.toUpperCase();

      if (produtosBebidas.contains(apagar)) {
        var indice = produtosBebidas.indexOf(apagar);
        produtosBebidas.removeAt(indice);

        print(">>> O PRODUTO $apagar FOI DELETADO COM SUCESSO! <<<");
      }
      print("=" * 50);

      print("Os produtos na lista de Bebidas são: ");
      for (var p in produtosBebidas) {
        print(p);
      }

      print("=" * 50);
      break;

    case 3:
      print("=" * 50);
      print("Os produtos na lista de Produtos de Limpeza são:");
      for (var p in produtosLimpeza) {
        print(p);
      }
      print("=" * 50);

      print("\nDigite o nome do produto que deseja deletar: ");
      var apagar = stdin.readLineSync()!.toUpperCase();

      if (produtosLimpeza.contains(apagar)) {
        var indice = produtosLimpeza.indexOf(apagar);
        produtosLimpeza.removeAt(indice);

        print(">>> O PRODUTO $apagar FOI DELETADO COM SUCESSO! <<<");
      }
      print("=" * 50);

      print("Os produtos na lista de produtos de limpeza são: ");
      for (var p in produtosLimpeza) {
        print(p);
      }

      print("=" * 50);
      break;

    case 4:
      print("=" * 50);
      print("Os produtos na lista de Produtos de Higiene são:");
      for (var p in produtosHigiene) {
        print(p);
      }
      print("=" * 50);

      print("\nDigite o nome do produto que deseja deletar: ");
      var apagar = stdin.readLineSync()!.toUpperCase();

      if (produtosHigiene.contains(apagar)) {
        var indice = produtosHigiene.indexOf(apagar);
        produtosHigiene.removeAt(indice);

        print(">>> O PRODUTO $apagar FOI DELETADO COM SUCESSO! <<<");
      }
      print("=" * 50);

      print("Os produtos na lista de produtos de higiene são: ");
      for (var p in produtosHigiene) {
        print(p);
      }

      print("=" * 50);
      break;

    case 4:
      print("=" * 50);
      print("Os produtos na lista de Outros produtos são:");
      for (var p in produtosOutros) {
        print(p);
      }
      print("=" * 50);

      print("\nDigite o nome do produto que deseja deletar: ");
      var apagar = stdin.readLineSync()!.toUpperCase();

      if (produtosOutros.contains(apagar)) {
        var indice = produtosOutros.indexOf(apagar);
        produtosOutros.removeAt(indice);

        print(">>> O PRODUTO $apagar FOI DELETADO COM SUCESSO! <<<");
      }
      print("=" * 50);

      print("Os produtos na lista de outros produtos são: ");
      for (var p in produtosOutros) {
        print(p);
      }

      print("=" * 50);
      break;
  }
}
