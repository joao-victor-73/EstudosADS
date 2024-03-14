# Questão 2 -> Será que é inocente?

cont = 0
print("=" * 40)
print("       QUESTIONADOR DE PERGUNTAS")
print("=" * 40)

print("\nIrei fazer apenas 5 perguntas, basta responder com S para Sim ou N para Não. \nVamos lá\n")
# Lista de perguntas
perguntas = ["Telefonou para a vítima?",
             "Esteve no local do crime?",
             "Mora perto da vítima?",
             "Tinha dívidas com a vítima?",
             "Já trabalhou com a vítima?"]

# Lista para armazenar as respostas
lista_resposta = []

# for para percorrer as perguntas
for perguntar in perguntas:
    print(perguntar)
    lista_resposta.append(input("SIM [S] / NÃO [N]: ").upper().split()[0])
    print("")

# for para verificar respostas
for r in lista_resposta:
    if r == 'S':
        cont += 1

if cont == 2:
    print("Essa pessoa é >SUSPEITA<")
elif cont >= 3 and cont <= 4:
    print("Essa pessoa é >CÚMPLICE<")
elif cont >= 5:
    print("Essa pessoa é a >ASSASSINA<")
else:
    print("\nEssa pessoa é >INOCENTE<")
