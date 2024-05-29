"""
A biblioteca Faker é uma biblioteca Python popular usada para gerar dados fictícios realistas 
para uso em testes de software, desenvolvimento e demonstrações. 

Ela pode criar nomes, endereços, números de telefone, datas, textos e muito mais, 
em diversos idiomas e formatos.
"""


from faker import Faker
import mysql.connector

fake = Faker('pt_BR')

# Conectar ao banco de dados MySQL
mydb = mysql.connector.connect(
    host="localhost",
    user="root",
    password="darc147",
    database="bd_techstore"
)


# Criando uma lista de MARCAS DE PRODUTOS para ser gerado aleatoriamente
marcas_tecnologia = [

]

# Criando uma lista de NOMES DE EMPRESA para ser gerado aleatoriamente
nome_tecnologia = [

]


cursor = mydb.cursor()

# Gerar e inserir dados fictícios para a tabela 'cliente'
for _ in range(10):  # Gere 10 registros fictícios
    nomeCliente = fake.name()
    rua = fake.street_address()
    bairro = fake.neighborhood()
    cidade = fake.city()
    email = fake.email()
    telefone = fake.phone_number()
    CEP = fake.postcode()

    SQL = "INSERT INTO cliente (nomeCliente, rua, bairro, cidade, email, telefone, CEP) VALUES (%s, %s, %s, %s, %s, %s, %s)"
    val = (nomeCliente, rua, bairro, cidade, email, telefone, CEP)
    cursor.execute(SQL, val)


# Gerar e inserir dados fictícios para a tabela 'produtos'
for _ in range(10):
    nomeProduto = fake.random_element(nome_tecnologia)
    marca = fake.random_element(marcas_tecnologia)


mydb.commit()
print(cursor.rowcount, "registros inseridos.")

cursor.close()
mydb.close()
