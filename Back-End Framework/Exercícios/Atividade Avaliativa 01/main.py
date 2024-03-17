
def escolha_tipo_produto():

    print("=" * 60)
    print(f" <=========== {'SOFTWARE DE CADASTRO DE PRODUTOS'} ===========>")
    print("     1 - Alimentos")
    print("     2 - Bebidas")
    print("     3 - Produtos de Limpeza")
    print("     4 - Higiene")
    print("     5 - Outros")
    print("     0 - Sair")
    print("=" * 60)

    op_produtos = int(input("Qual a opção para cadastro? "))

    if op_produtos != 0:
        return op_produtos
    else:
        return op_produtos


def cadastrando(tipo):
        if tipo == 1:  # ALimento
            prod = input("Qual o nome do produto a ser armazenado:  ").capitalize()
            marca = input("Qual o nome da marca do produto?  ").capitalize()

            produtos_alimentos[prod] = marca

        elif tipo == 2:  # Bebidas
            prod = input("Qual o nome do produto a ser armazenado:  ").capitalize()
            marca = input("Qual o nome da marca do produto?  ").capitalize()

            produtos_bebidas[prod] = marca

        elif tipo == 3:  # Produto de Limpeza
            prod = input("Qual o nome do produto a ser armazenado:  ").capitalize()
            marca = input("Qual o nome da marca do produto?  ").capitalize()

            produtos_limpeza[prod] = marca

        elif tipo == 4:  # Higiene
            prod = input("Qual o nome do produto a ser armazenado:  ").capitalize()
            marca = input("Qual o nome da marca do produto?  ").capitalize()

            produtos_higiene[prod] = marca

        elif tipo == 5:  # Outros
            prod = input("Qual o nome do produto a ser armazenado:  ").capitalize()
            marca = input("Qual o nome da marca do produto?  ").capitalize()

            produtos_outros[prod] = marca


# Declarações de variáveis
produtos_alimentos = {}
produtos_bebidas = {}
produtos_limpeza = {}
produtos_higiene = {}
produtos_outros = {}

print("=" * 60)
print(f" <=========== {'SOFTWARE DE CADASTRO DE PRODUTOS'} ===========>")
print("     1 - Cadastro de produto")
print("     2 - Alterar produto")
print("     3 - Listar e contar produto")
print("     4 - Deletar produto")
print("     5 - Sair do programa")
print("=" * 60)

opcao = int(input("Informe a opção desejada: "))

if opcao == 1:
    while True:
        cadastrando(escolha_tipo_produto())

        # If para parar o Laço infinito.
        if escolha_tipo_produto() == 0:
            break
        else: 
            continue

print(produtos_alimentos)