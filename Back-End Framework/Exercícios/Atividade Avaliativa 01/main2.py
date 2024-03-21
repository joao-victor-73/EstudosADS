

def escolha_tipo_produto():
    """
    Função que tem por objetivo passar uma tabela com os tipos de itens possíveis
    para cadastramento dentro do nosso sistema. Sendo a escolha feita digitando
    um número inteiro (1, 2, 3, 4 ou 5).

    <Falta implementar um caso de exceção>
    """

    print("=" * 60)
    print(f"        <=========== {'SOFTWARE DE PRODUTOS'} ===========>")
    print("     1 - Alimentos")
    print("     2 - Bebidas")
    print("     3 - Produtos de Limpeza")
    print("     4 - Higiene")
    print("     5 - Outros")
    print("     6 - Voltar")
    print("=" * 60)

    op_produtos = int(input("Qual o tipo de produto desejado? "))

    return op_produtos


def cadastrando(tipo):

    if tipo == 1:  # ALimento
        prod = input("Qual o nome do produto a ser armazenado:  ").capitalize()

        produtos_alimentos.append(prod)

    elif tipo == 2:  # Bebidas
        prod = input("Qual o nome do produto a ser armazenado:  ").capitalize()

        produtos_bebidas.append(prod)

    elif tipo == 3:  # Produto de Limpeza
        prod = input("Qual o nome do produto a ser armazenado:  ").capitalize()

        produtos_limpeza.append(prod)

    elif tipo == 4:  # Higiene
        prod = input("Qual o nome do produto a ser armazenado:  ").capitalize()

        produtos_higiene.append(prod)

    elif tipo == 5:  # Outros
        prod = input("Qual o nome do produto a ser armazenado:  ").capitalize()

        produtos_outros.append(prod)


def atualizar(tipo):

    if tipo == 1:
        print("=" * 25)
        for p in produtos_alimentos:
            print(p)
        print("=" * 25)

        att = input("\nQual produto deseja att? ")

        if att in produtos_alimentos:
            indice = produtos_alimentos.index(att)

            produtos_alimentos[indice] = input(
                "Digite o novo produto: ").capitalize()

            print("=" * 25)
            print("A nova lista de alimentos ficou assim:")
            for p in produtos_alimentos:
                print(p)
            print("=" * 25)

        else:
            print("Produto não está na lista de produtos. Tente novamente")
            atualizar(tipo)

    if tipo == 2:
        print("=" * 25)
        for p in produtos_bebidas:
            print(p)
        print("=" * 25)

        att = input("\nQual produto deseja att? ")

        if att in produtos_bebidas:
            indice = produtos_bebidas.index(att)

            produtos_bebidas[indice] = input(
                "Digite o novo produto: ").capitalize()

            print("=" * 25)
            print("A nova lista de alimentos ficou assim:")
            for p in produtos_bebidas:
                print(p)
            print("=" * 25)

        else:
            print("Produto não está na lista de produtos. Tente novamente")
            atualizar(tipo)

    if tipo == 3:
        print("=" * 25)
        for p in produtos_limpeza:
            print(p)
        print("=" * 25)

        att = input("\nQual produto deseja att? ")

        if att in produtos_limpeza:
            indice = produtos_limpeza.index(att)

            produtos_limpeza[indice] = input(
                "Digite o novo produto: ").capitalize()

            print("=" * 25)
            print("A nova lista de alimentos ficou assim:")
            for p in produtos_limpeza:
                print(p)
            print("=" * 25)

        else:
            print("Produto não está na lista de produtos. Tente novamente")
            atualizar(tipo)

    if tipo == 4:
        print("=" * 25)
        for p in produtos_higiene:
            print(p)
        print("=" * 25)

        att = input("\nQual produto deseja att? ")

        if att in produtos_higiene:
            indice = produtos_higiene.index(att)

            produtos_higiene[indice] = input(
                "Digite o novo produto: ").capitalize()

            print("=" * 25)
            print("A nova lista de alimentos ficou assim:")
            for p in produtos_higiene:
                print(p)
            print("=" * 25)

        else:
            print("Produto não está na lista de produtos. Tente novamente")
            atualizar(tipo)

    if tipo == 5:
        print("=" * 25)
        for p in produtos_outros:
            print(p)
        print("=" * 25)

        att = input("\nQual produto deseja att? ")

        if att in produtos_outros:
            indice = produtos_outros.index(att)

            produtos_outros[indice] = input(
                "Digite o novo produto: ").capitalize()

            print("=" * 25)
            print("A nova lista de alimentos ficou assim:")
            for p in produtos_outros:
                print(p)
            print("=" * 25)

        else:
            print("Produto não está na lista de produtos. Tente novamente")
            atualizar(tipo)


def listar_contar(tipo):

    if tipo == 1:
        print("=" * 50)
        print("< Os produtos cadastrados na \ncategoria de alimentos são:  >")
        for p in produtos_alimentos:
            print(f"| {p} |")

        print(f"E temos um total de {len(produtos_alimentos)} itens na lista")
        print("=" * 50)

    elif tipo == 2:
        print("=" * 50)
        print("< Os produtos cadastrados na \ncategoria de alimentos são:  >")
        for p in produtos_bebidas:
            print(f"| {p} |")
        print(f"E temos um total de {len(produtos_bebidas)} itens na lista")
        print("=" * 50)

    elif tipo == 3:
        print("=" * 50)
        print("< Os produtos cadastrados na \ncategoria de alimentos são:  >")
        for p in produtos_limpeza:
            print(f"| {p} |")
        print(f"E temos um total de {len(produtos_limpeza)} itens na lista")
        print("=" * 50)

    elif tipo == 4:
        print("=" * 50)
        print("< Os produtos cadastrados na \ncategoria de alimentos são:  >")
        for p in produtos_higiene:
            print(f"| {p} |")
        print(f"E temos um total de {len(produtos_higiene)} itens na lista")
        print("=" * 50)

    elif tipo == 5:
        print("=" * 50)
        print("< Os produtos cadastrados na \ncategoria de alimentos são:  >")
        for p in produtos_outros:
            print(f"| {p} |")
        print(f"E temos um total de {len(produtos_outros)} itens na lista")
        print("=" * 50)
    
    nada = input("Pressione ENTER para voltar a tela de seleção de tipos!")


def deletar(tipo):
    
    if tipo == 1:
        print("=" * 50)
        print("Os produtos na lista de Alimentos são:")
        for p in produtos_alimentos:
            print(p)
        print("=" * 50)

        apagar = input("\nDigite o nome do produto que deseja deletar: ")

        

    elif tipo == 2:

    elif tipo == 3:

    elif tipo == 4:

    elif tipo == 5:


# Declaração de variáveis:
produtos_alimentos = []
produtos_bebidas = []
produtos_limpeza = []
produtos_higiene = []
produtos_outros = []

while True:
    print("=" * 60)
    print(f" <=========== {'SOFTWARE DE CADASTRO DE PRODUTOS'} ===========>")
    print("     1 - Cadastro de produto")
    print("     2 - Alterar produto")
    print("     3 - Listar e contar produto")
    print("     4 - Deletar produto")
    print("     5 - Sair do programa")
    print("=" * 60)

    op = int(input("Informe a opção desejada: "))

    if op == 1:
        while True:
            tipo_produto = escolha_tipo_produto()

            if tipo_produto == 6:
                break

            cadastrando(tipo_produto)

    elif op == 2:
        while True:
            tipo_produto = escolha_tipo_produto()

            if tipo_produto == 6:
                break

            atualizar(tipo_produto)

    elif op == 3:
        while True:
            tipo_produto = escolha_tipo_produto()

            if tipo_produto == 6:
                break

            listar_contar(tipo_produto)

    elif op == 4:
        while True:
            tipo_produto = escolha_tipo_produto()

            if tipo_produto == 6:
                break

            deletar(tipo_produto)

    elif op == 5:
        break

print(produtos_alimentos)
