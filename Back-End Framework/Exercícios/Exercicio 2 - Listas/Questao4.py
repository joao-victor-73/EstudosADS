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
