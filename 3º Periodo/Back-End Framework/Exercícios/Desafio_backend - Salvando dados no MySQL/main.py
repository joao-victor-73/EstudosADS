from flask import Flask, render_template, request
import pymysql

app = Flask(__name__)


"""                                            OBS:
Tem alguns prints identificando cada parte do códgio por que, eu estou tendo dificuldades 
passar os valores fornecidos para dentro do banco de dados.
Já tentei diversas coisas e não consegui. Eu estou recriando toda a estrutura do códido novamente.
Mas como a entrega é para o dia 02, não tenho como enviar a tempo.
"""

@app.route('/', methods=['GET', 'POST'])
def principal():

    print("Recebendo dados do formulário...")

    # Receber os dados do formulário
    # utilizei o form.get porque so o form[] não estava rodando a pagina em HTML
    nome_produto = request.form.get('insiraProduto')
    preco_produto = request.form.get('insiraPreco')
    quant_produto = request.form.get('insiraQuant')
    data_produto = request.form.get('dataCompra')
    hora_produto = request.form.get('horaCompra')

    print("Todos os campos do formulário estão preenchidos.")

    print(nome_produto)
    print(preco_produto)
    print(quant_produto)
    print(data_produto)
    print(hora_produto)

    # Verificação para ver se os valores não são nulos. Porque tem algum erro acontecendo
    # porque os dados já são preenchidos antes de digitar, e ai eles vão como NONE, dando erro na aplicação.
    if nome_produto is not None and preco_produto is not None and quant_produto is not None and data_produto is not None and hora_produto is not None:
        # Construir e executar a consulta SQL

        # Conectar ao banco de dados
        print("Conectando ao banco de dados...")

        conexao = conectDB()
        cursor = conexao.cursor()

        print("Conexão com o banco de dados estabelecida!")

        # Executar a consulta SQL para inserir os dados no banco de dados
        print("Executando consulta SQL para inserir dados...")

        consulta = f'INSERT INTO pedidos (nomeProduto, preco, quant, data, hora) VALUES ("{
            nome_produto}", {preco_produto}, {quant_produto}, "{data_produto}", "{hora_produto}")'
        print("Consulta SQL:", consulta)

        cursor.execute(consulta)

        print("Consulta SQL executada com sucesso!")

        # Commit para salvar as alterações no banco de dados
        conexao.commit()

        # Após o commit no banco de dados
        print("Dados inseridos com sucesso!")

        # Fechar a conexão com o banco de dados
        print("Fechando conexão com o banco de dados...")

        cursor.close()
        conexao.close()

        print("Conexão com o banco de dados fechada!")

    else:
        print("Algum dos valores do formulário está faltando ou é None.")

    return render_template('index.html')


def conectDB():
    # Instanciando a conexão da lib PyMySQL
    db = pymysql.connect(
        host='localhost',
        user='root',
        # Senha mudará por causa que estou usando a senha aqui do MySQL do PC do laboratio
        passwd='darc147',
        database='lanchonete_pateta'
    )
    print("TESTE de CONEXAO")
    print(db.host_info)

    return db


if __name__ == '__main__':
    conectDB()
    app.run('localhost', debug=True)
