from flask import Flask, render_template, request, redirect
import pymysql

app = Flask(__name__)

@app.route('/', methods=['POST', 'GET'])
def index():
    banco = pymysql.connect(host='localhost', user='root', passwd='12345678', database='banco_funcionarios')
    
    cursor = banco.cursor()
    
    sql = 'SELECT * FROM funcionario;'
    
    cursor.execute(sql)
    
    resultado = cursor.fetchall()
    
    return render_template('index.html', resultadoConsulta = resultado)


@app.route('/cadastraFuncionario', methods=['POST', 'GET'])
def cadastrando():
    nomeF = request.form['NomeFuncionario']
    
    banco = pymysql.connect(host='localhost', user='root', passwd='12345678', database='banco_funcionarios')
    
    cursor = banco.cursor()
    
    sql = f"INSERT INTO funcionario (nome) VALUES('{nomeF}');"
    
    cursor.execute(sql)
    banco.commit()
    cursor.close()
    
    return redirect('/')

if __name__ == '__main__':
    app.run(debug=True)