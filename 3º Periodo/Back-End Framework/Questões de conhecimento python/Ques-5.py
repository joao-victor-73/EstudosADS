"""
Faça um programa que peça ao usuário 10 números inteiros, 
calcule e mostre a quantidade de números pares e a quantidade de números ímpares.
"""
numeros = []
cont = 10
impares = 0
pares = 0

while True:
    num = int(input("Digite um número inteiro: "))

    numeros.append(num)

    cont -= 1

    if cont == 0:
        break

# Verificando quantidade de pares e impares
for i in numeros:  # Percorrendo a lista
    if i % 2 == 0:
        pares += 1
    else:
        impares += 1


print(f"\nA quantidade de números pares digitados é {pares} e de números ímpares é {impares}!")
