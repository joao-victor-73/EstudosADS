"""
Numa eleição existem três candidatos, Peninha, Clarabela e Zé Carioca. 
O número dos seus partidos são: 88, 39 e 51. Faça um programa que leia o voto de 20 eleitores através do número 
do partido ou da letra do candidato (P, C ou Z). Peça para cada eleitor votar e ao final mostrar o software deve
mostrar o número de votos de cada candidato.
"""

print("=" * 30)
print("      VOTAÇÕES BANCK-END")
print("=" * 30)

votos_P = 0
votos_C = 0
votos_Z = 0
votosNulos = 0

for i in range(1, 21):

    print("\nOS CANDIDATOS SÃO: \n")
    print("|-> (88) PENINHA     |")
    print("|-> (39) CLARABELA   |")
    print("|-> (51) ZÉ CARIOCA  |")
    print("|-> (0) NULO         |\n")

    voto = int(input("Escolha o número de chapa para votar: "))

    if voto == 88:  # Contagem de votos para Peninha
        votos_P += 1

    elif voto == 39:  # Contagem de votos para Clarabela
        votos_C += 1

    elif voto == 51:  # Contagem de votos para Zé Carioca
        votos_Z += 1

    elif voto == 0:  # Contagem de votos Nulos
        votosNulos += 1

print("=" * 40)
print(
    f"Vamos as contagens de votos: \n-> PENINHA teve {votos_P} votos \n-> CLARABELA teve {votos_C} votos \n-> ZÉ CARIOCA teve {votos_Z} votos \n-> NULOS {votosNulos} votos")
