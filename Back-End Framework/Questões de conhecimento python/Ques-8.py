"""
Faça um programa que peça para N pessoas a sua idade, ao final o programa deverá verificar se a média de idade da 
turma varia entre 0 e 25,26 e 60 e maior que 60; e então, dizer se a turma é jovem, adulta ou idosa respectivamente, 
conforme a média calculada.
"""
somaIdades = 0
cont = 0

while True:
    idade = int(input("\nDigite a idade: "))

    somaIdades += idade
    cont += 1

    opcao = input("Deseja colocar outra idade [S/N]? ").upper().strip()
    if opcao == "N":
        break

mediaIdades = somaIdades / cont

print(f"\nFoi digitado um total de {cont} idades!\n")

if (mediaIdades >= 0) or (mediaIdades <= 25):
    print(
        f"A média da turma é de {mediaIdades:.0f} anos e ela é uma turma de JOVEM!")

elif (mediaIdades >= 26) or (mediaIdades <= 60):
    print(
        f"A média da turma é de {mediaIdades:.0f} anos e ela é uma turma de ADULTOS!")

elif mediaIdades > 60:
    print(
        f"A média da turma é de {mediaIdades:.0f} anos e ela é uma turma de IDOSOS!")
