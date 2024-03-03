"""
QUESTÃO 1:
Escreva um programa que leia um número inteiro e verifique se ele é positivo, negativo ou zero. 
Se o número for positivo, exiba a mensagem "O número é positivo". Se for negativo, exiba a mensagem 
"O número é negativo". Caso contrário, exiba a mensagem "O número é zero". 
"""

num = int(input("Digite um número: "))

if num > 0:
    print("O número digitado é POSITIVO!")
elif num < 0:
    print("O número digitado é NEGATIVO!")
elif num == 0:
    print("O número digitado é igual a ZERO!")
