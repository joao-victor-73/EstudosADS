from flask import Flask, render_template, request, redirect, url_for
from flask_mysqldb import MySQL

app = Flask(__name__)
app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = 'darc147'
app.config['MYSQL_DB'] = 'portal_crisma'

mysql = MySQL(app)

@app.route('/')
def index():
    return render_template('login.html')

@app.route('/login', methods=['POST'])
def login():
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']
        cur = mysql.connection.cursor()
        cur.execute("SELECT * FROM usuarios WHERE username = %s AND password = %s", (username, password))
        user = cur.fetchone()
        if user:
            tela = user[3]  # Obtém o nome da tela específica
            return redirect(url_for(tela))
        else:
            return "Credenciais inválidas. Por favor, tente novamente."

@app.route('/tela1')
def tela1():
    return "Esta é a tela 1."

@app.route('/tela2')
def tela2():
    return "Esta é a tela 2."


@app.route('/registro', methods=['POST'])
def registro():
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']
        tela = request.form['tela']
        cur = mysql.connection.cursor()
        cur.execute("INSERT INTO usuarios (username, password, tela) VALUES (%s, %s, %s)", (username, password, tela))
        mysql.connection.commit()
        cur.close()
        return "Usuário registrado com sucesso!"


if __name__ == '__main__':
    app.run(debug=True)
