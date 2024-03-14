# Questão 4 -> Armazenando temperaturas

# Declaração de Variáveis
# dict -> {keys: values}
meses = {1: 'Janeiro', 2: 'Fevereiro', 3: 'Março', 4: 'Abril', 5: 'Maio', 6: 'Junho',
         7: 'Julho', 8: 'Agosto', 9: 'Setembro', 10: 'Outubro', 11: 'Novembro', 12: 'Dezembro'}
# Criei um dicionário, mas não seria realmente necessário. Eu só queria treinar meu conhecimento em dicionário

apresentacao_temperaturas = [] # Guarda a frase que mostra o indice, o mes por extenso e a temperatura
temp_acima = [] # Armazena uma frase apenas quando a temperatura for maior que a média
list_temperaturas = [] # Armazena as temperaturas

soma = 0 # Variável que armazenará as somas

# FOR que servirá para perguntar a temperatura
for i, mes in meses.items():
    temp = float(input(f"Qual a temperatura do mês de {mes} ? "))
    list_temperaturas.append(temp)

    # Somando todos os valores digitados
    soma += temp

    apresentacao_temperaturas.append(
        f"{i} -- {mes} tem uma temperatura de {temp} ºC")


media = soma / len(meses) # Variável para armazenar a média

# Apresentação de todas as temperaturas junto com os meses(por extenso e curto)
print("\nAs temperaturas digitadas foram: ")
for m in apresentacao_temperaturas:
    print(m)

print(f"\nA média das temperaturas de todos os meses é de {media}ºC")

# Fazendo a operação para saber se os valores são maiores que a média
for i, temp in enumerate(list_temperaturas, 1):
    if temp > media:
        temp_acima.append(f"{i} -- {meses[i]}: {temp} ºC")

print("\nAs temperaturas acima da média foram: ")
for media_acima in temp_acima:
    print(media_acima)
