"""
Escreva um programa que leia a altura e o peso de uma pessoa e calcule o seu Índice de Massa Corporal (IMC).
Verifique em qual categoria a pessoa se enquadra: abaixo do peso (IMC menor que 18,5), peso normal 
(IMC entre 18,5 e 24,9), sobrepeso (IMC entre 25 e 29,9) ou obesidade (IMC maior que 30). 
Exiba a categoria correspondente ao IMC calculado.
"""

nome = input("Qual seu nome? ").capitalize()
alt = float(input(f"Ok {nome}. Agora digite a altura (m): ").replace(",", "."))
peso = float(
    input(f"Certo {nome}, informação guardada. Digite seu peso (KG): "))

print("\nCalculando seu IMC...\n")

imc = peso / (alt**2)
print(f"Seu IMC é de {imc:.1f}. E ",  end="")

if imc < 18.5:
    print(f"{nome}, você está ABAIXO DO PESO!")
elif (imc > 18.5) or (imc < 24.9):
    print(f"{nome}, você está com PESO NORMAL!")
elif (imc > 25) or (imc < 29.9):
    print(f"{nome}, você está com SOBREPESO!")
elif imc > 30:
    print(f"{nome}, você está com OBESIDADE!")
