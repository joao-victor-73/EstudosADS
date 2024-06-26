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
    "Apple",
    "Dell",
    "HP",
    "Lenovo",
    "Asus",
    "Acer",
    "Motorola",
    "Multilaser",
    "Samsung",
    "Huawei",
    "Xiaomi",
    "Sony",
    "LG",
    "Kingston",
    "Seagate",
    "Corsair",
    "Nvidia"
]

# Criando uma lista de NOMES DE PRODUTOS para ser gerado aleatoriamente
produto_tecnologia = [
    "Notebook",
    "Tablet",
    "Monitor",
    "Teclado",
    "Mouse",
    "Webcam",
    "Impressora",
    "Scanner",
    "HD",
    "SSD",
    "Headphone",
    "HeadSet",
    "Fones de Ouvido",
    "Capas para celular",
    "Capas para tablet",
    "Capas para Notebook",
    "Suportes para Carro",
    "Suportes para Moto",
    "Cabos e Adaptadores",
    "Projetores",
    "Console PS4",
    "Console PS5",
    "Console Xbox One",
    "Console Xbox X/S",
    "Controle/Joystick",
    "Caixas de Som Bluetooth",
    "Microfones",
    "Tripés"
]

# Criando uma lista de NOMES DE EMPRESA para ser gerado aleatoriamente
nome_fornecedores = [
    "Amazon",
    "Newegg",
    "Walmart",
    "Kabum",
    "Micro Center"
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
    preco_faker = round(fake.pyfloat(
        min_value=10, max_value=100, right_digits=2), 2)
    # gerador de valores de preco entre 10 a 100

    # gerador de produtos em estoque entre 0 a 20
    em_estoque_faker = fake.random_int(min=1, max=20)

    nomeProduto = fake.random_element(produto_tecnologia)
    marca = fake.random_element(marcas_tecnologia)
    preco = preco_faker
    em_estoque = em_estoque_faker

    SQL = "INSERT INTO produtos (nomeProduto, marca, preco, em_estoque) VALUES (%s, %s, %s, %s)"
    val = (nomeProduto, marca, preco, em_estoque)
    cursor.execute(SQL, val)


# Gerar e inserir dados fictícios para a tabela 'fornecedor'
for _ in range(10):
    nomeFornecedor = fake.random_element(nome_fornecedores)
    rua = fake.street_address()
    bairro = fake.neighborhood()
    cidade = fake.city()
    email = fake.email()
    telefone = fake.phone_number()
    CEP = fake.postcode()

    SQL = "INSERT INTO fornecedor (nomeFornecedor, rua, bairro, cidade, email, telefone, CEP) VALUES (%s, %s, %s, %s, %s, %s, %s)"
    val = (nomeFornecedor, rua, bairro, cidade, email, telefone, CEP)
    cursor.execute(SQL, val)


mydb.commit()
print(cursor.rowcount, "registros inseridos.")

cursor.close()
mydb.close()
