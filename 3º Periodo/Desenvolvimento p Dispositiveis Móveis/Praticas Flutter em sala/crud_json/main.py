from flask import Flask, jsonify
import pymysql

app = Flask(__name__)

@app.route('/')
def index():
    banco = pymysql.connect(
                            host='localhost', 
                            user='root',
                            password='',
                            database='banco_funcionarios'
                            )
    
    cursor = banco.cursor()
    sql = "SELECT * FROM funcionario;"
    cursor.execute(sql)
    resultado = cursor.fetchall()
    banco.commit()
    banco.close()
    
    listaFuncionarios = []

    for funcionario in resultado:
        listaFuncionarios.append({
            "nomeFuncionario" : funcionario[1]
        })

    return jsonify(listaFuncionarios)

if '__main__' == __name__:
    
    app.run(debug=True)






