import cadastro as c


def escolha_tipo_produto():

    print("=" * 60)
    print(f"        <=========== {'SOFTWARE DE PRODUTOS'} ===========>")
    print("     1 - Alimentos")
    print("     2 - Bebidas")
    print("     3 - Produtos de Limpeza")
    print("     4 - Higiene")
    print("     5 - Outros")
    print("=" * 60)

    op_produtos = int(input("Qual a opção desejada? "))

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


def atualizacao(tipo):
    if tipo == 1:  # ALimento
        for p in produtos_alimentos:
            print("Os produtos encontrados na Aba de alimentos foi: ")
            print(f"{p} -", end=" ")


def validacao():
    print("=" * 60)
    print(">> Caso queira adicionar mais produtos, digite S")
    print(">> Caso queira sair do cadastramento de produtos, digite N.")
    sair = input(">> [S] ou [N] ").upper().split()[0]
    print("=" * 60)

    return sair



# Declarações de variáveis
produtos_alimentos = []
produtos_bebidas = []
produtos_limpeza = []
produtos_higiene = []
produtos_outros = []

def mensagem_inical():
    print("=" * 60)
    print(f" <=========== {'SOFTWARE DE CADASTRO DE PRODUTOS'} ===========>")
    print("     1 - Cadastro de produto")
    print("     2 - Alterar produto")
    print("     3 - Listar e contar produto")
    print("     4 - Deletar produto")
    print("     5 - Sair do programa")
    print("=" * 60)

    op = int(input("Informe a opção desejada: "))

    return op

opcao = int(mensagem_inical())

# Opçao de CADASTRAMENTO
if opcao == 1:
    while True:
        cadastrando(escolha_tipo_produto())

        # If para parar o Laço infinito.
        if validacao() == 'N':
            break
        else:
            continue
    mensagem_inical()

# OPção para ALTERAR PRODUTO:
elif opcao == 2:
    while True:
        atualizacao(escolha_tipo_produto())

        # If para parar o Laço infinito.
        if validacao() == 'N':
            break
        else:
            continue
    mensagem_inical()
