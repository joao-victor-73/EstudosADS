"""
Faça um programa que leia três números inteiros e verifique se eles formam um triângulo. Caso formem, 
verifique se é um triângulo equilátero, isósceles ou escaleno. Exiba a mensagem correspondente ao tipo de 
triângulo ou a mensagem "Não é possível formar um triângulo".
"""

l1 = float(input("Digite um dos lados: ").replace(",", "."))
l2 = float(input("Digite outro lado: ").replace(",", "."))
l3 = float(input("Digite o terceiro lado: ").replace(",", "."))

# VERIFICANDO SE OS TRÊS LADOS FORMAM UM TRIÂNGULO
if l1 < (l2 + l3) and l2 < (l1 + l3) and l3 < (l1 + l2):
    print("\nOs três lados digitados formaram um triângulo. E ele é: ", end="")

    # EQUILÁTERO
    if (l1 == l2) and (l2 == l3) and (l1 == l3):
        print("EQUILÁTERO!")

    # ISÓSCELES
    elif ((l1 == l2) or (l2 == l3) or (l1 == l3)) and ((l1 == l2) or (l2 == l3) or (l1 == l3)):
        print("ISÓSCELES!")

    # ESCALENO
    elif (l1 != l2) and (l2 != l3) and (l1 != l3):
        print("ESCALENO!")


else:
    print("Os lados NÃO formam um triângulo")
