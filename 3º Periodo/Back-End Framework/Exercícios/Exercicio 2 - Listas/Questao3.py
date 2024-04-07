# Questão 3 -> Entrada de dados

# Declaração de variáveis
cont = 0
lista_notas = []

print("=" * 30)
print("     REGISTRADOR DE NOTAS")
print("=" * 30)
print("Para parar, basta digitar um número negativo.")

while True:
    notas = int(input("Digite uma nota: "))

    # Verificação se o valor é positivo ou negativo
    if notas > 0:
        cont += 1
        lista_notas.append(notas)
        continue
    else:
        break

print(f"\nForam lidas um total de {cont} notas.")
print(f"\nAs notas digitadas foram: {lista_notas}")

# Invertendo a lista de notas
lista_notas.reverse()
print(f"As notas digitadas de modo inverso foram: {lista_notas}")

# Calculo das somas das notas
soma_notas = 0
for n in lista_notas:
    soma_notas += n

print(f"\nA soma de todas as notas digitadas é de: {soma_notas}")

# Media das somas das notas
media_notas = soma_notas / cont
print(f"A média das notas digitadas é: {media_notas:.2f}")

# Nota acima da média
acima_media = []
for m in lista_notas:
    if m > media_notas:
        acima_media.append(m)

print(f"As notas acima da média são: {acima_media}")
