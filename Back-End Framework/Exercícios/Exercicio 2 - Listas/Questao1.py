# Questão 1 -> Subida de patente

"""
a. Subir de patente: Ganhar no mínimo 60 pontos nas últimas 10 partidas. 
b. Permanecer na patente: Ganhar entre 21 e 59 pontos nas últimas 10 partidas
c. Cair de patente: Ganhar menos de 21 pontos nas últimas 10 partidas.

Assim, as pontuações seguem a seguinte tabela:
        •Vitórias têm o valor de 10 pontos
        •Empates 5 pontos 
        •Derrotas -2 pontos. 
"""


# Declarações de Variáveis
lista_de_resultados = []  # Lista vazia que conterá os resultados das partidas
pontuacao = contVitoria = contEmpate = contDerrota = 0
cont = 10

# Mensagem de boas vindas
print("=" * 50)
print("     Abaixo digite seus resultados de partida")
print("             V -> Vitoria")
print("             E -> Empate")
print("             D -> Derrota")
print("=" * 50)


# Lendo o resultado de 10 partidas:
while cont > 0:
    resposta = input("Qual o resultado? ").upper()

    # Validação para verificar se digitará uma das opções corretas (V, E ou D)
    if (resposta == 'V') or (resposta == 'E') or (resposta == 'D'):
        lista_de_resultados.append(resposta)
        cont -= 1

    else:
        print('Não foi adicionado esse resultado')
        if cont < 9:
            cont += 1

    # Calculo das pontuações
    if resposta == 'V':  # Vitorias valem 10 pontos
        pontuacao += 10
    elif resposta == 'E':  # Empates valem 5 pontos
        pontuacao += 5
    elif resposta == 'D':  # Derrotas valem -2 pontos
        pontuacao -= 2


for contagem in lista_de_resultados:
    if contagem == 'V':
        contVitoria += 1
    elif contagem == 'E':
        contEmpate += 1
    elif contagem == 'D':
        contDerrota += 1

print("=" * 40)
print("     Nas suas partidas, você teve:")
print(f"             Vitoria -> {contVitoria}")
print(f"             Empate -> {contEmpate}")
print(f"             Derrota -> {contDerrota}")
print(f"         A sua pontuação foi: {pontuacao}")
print("=" * 40)

# Verificação se ele subirá de patente ou não
if pontuacao > 60:
    print("         Você >SUBIU< de patente!")
elif pontuacao > 21 and pontuacao < 59:
    print("     Você >PERMANECEU< na mesma patente!")
elif pontuacao < 21:
    print("         Você >CAIU< de patente!")
