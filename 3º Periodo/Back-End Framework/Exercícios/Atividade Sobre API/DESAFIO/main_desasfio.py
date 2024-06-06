from flask import Flask, jsonify
import pymysql

app = Flask(__name__)


@app.route('/')
def index():
    bd = pymysql.connect(
        host='localhost',
        user='root',
        passwd='darc147',
        database='lanchonete_pateta'
    )

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


if '__main__' == __name__:
    app.run(debug=True)
