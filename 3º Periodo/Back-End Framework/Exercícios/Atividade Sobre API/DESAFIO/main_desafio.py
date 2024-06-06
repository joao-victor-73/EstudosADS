from flask import Flask, jsonify, request
import pymysql

app = Flask(__name__)


def connect():
    conexao_bd = pymysql.connect(
        host='localhost',
        user='root',
        passwd='darc147',
        database='lanchonete_pateta'
    )

    return conexao_bd


@app.route('/')
def index():

    bd = connect()

    cursor = bd.cursor()

    sql = 'SELECT * FROM pedidos;'
    cursor.execute(sql)

    result = cursor.fetchall()

    bd.commit()
    bd.close()

    lista_de_pedidos = []

    for pedido in result:
        lista_de_pedidos.append(
            {"Nome do Pedido": pedido[1],
             "Preco": pedido[2],
             "Quantidade": pedido[3],
             "Data e Hora do pedido": pedido[4]
             })

    return jsonify(lista_de_pedidos)


@app.route("/cadastrarPedido", methods=['POST'])
def cadastrarPedido():
    dadosRecebidos = request.get_json()

    nomeProduto = str(dadosRecebidos['nomeProduto'])
    preco = float(dadosRecebidos['preco'])
    quant = int(dadosRecebidos['quant'])
    data_hora = str(dadosRecebidos['data_hora'])

    bd = connect()

    cursor = bd.cursor()

    sql = f"INSERT INTO pedidos (nomeProduto, preco, quant, data_hora) VALUES ('{
        nomeProduto}', {preco}, {quant}, '{data_hora}')"

    cursor.execute(sql)
    bd.commit()
    bd.close()

    response = {'mensagem': 'Cadastro realizado', 'Codigo': 200}

    return jsonify(response)


if '__main__' == __name__:
    app.run(debug=True)
