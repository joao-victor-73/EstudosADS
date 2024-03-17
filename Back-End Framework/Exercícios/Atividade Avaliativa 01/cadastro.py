def escolha_tipo_produto():

    print("=" * 60)
    print(f" <=========== {'SOFTWARE DE CADASTRO DE PRODUTOS'} ===========>")
    print("     1 - Alimentos")
    print("     2 - Bebidas")
    print("     3 - Produtos de Limpeza")
    print("     4 - Higiene")
    print("     5 - Outros")
    print("=" * 60)

    op_produtos = input("Qual a opção para cadastro? ")
    return op_produtos


def cadastrando(tipo):


    if tipo == 1:  # ALimento
        prod = input("Qual o nome do produto a ser armazenado:  ")
        marca = input("Qual o nome da marca do produto?  ")

        return produtos_alimentos[prod] = marca

    elif tipo == 2:  # Bebidas
        prod = input("Qual o nome do produto a ser armazenado:  ")
        marca = input("Qual o nome da marca do produto?  ")

        return produtos_bebidas[prod] = marca

    elif tipo == 3:  # Produto de Limpeza
        prod = input("Qual o nome do produto a ser armazenado:  ")
        marca = input("Qual o nome da marca do produto?  ")

        return produtos_limpeza[prod] = marca

    elif tipo == 4:  # Higiene
        prod = input("Qual o nome do produto a ser armazenado:  ")
        marca = input("Qual o nome da marca do produto?  ")

        return produtos_higiene[prod] = marca

    elif tipo == 5:  # Outros
        prod = input("Qual o nome do produto a ser armazenado:  ")
        marca = input("Qual o nome da marca do produto?  ")

        return produtos_outros[prod] = marca
