# ATIVIDADE PRÁTICA 01 - 21/03/2024

from flask import Flask, render_template, request

app = Flask(__name__)

clientes = []


class Cliente:
    def __init__(self, id, nome, email, tel, data):
        self.id = id
        self.nome = nome
        self.email = email
        self.tel = tel
        self.data = data
        
        
# OUTRO MÉTODO PARA CRIAR AS INFORMAÇÕES, utilizando classe.
@app.route('/', methods=['GET', 'POST'])
def principal():
    if request.method == "POST":
        # Variáveis para requisição
        nome_r = request.form.get("nome")
        email_r = request.form.get("email")
        tel_r = request.form.get("tel")
        data_r = request.form.get("data")
        id_r = len(clientes) + 1

        
        if nome_r and email_r and tel_r and data_r:
            novo_cliente = Cliente(id_r, nome_r, email_r, tel_r, data_r)
            clientes.append(novo_cliente)
            
    return render_template("index.html", clientes=clientes)


if __name__ == '__main__':
    app.run(host='0.0.0.0', debug=True)