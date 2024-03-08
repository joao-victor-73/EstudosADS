# Criando o básico de flask na primeira aula sobre o assunto
# Aula 03 - 07 / 03 / 2024

from flask import Flask

app = Flask(__name__)


@app.route('/')
def index():
    return "<h1>Olá, essa é minha página inicial!</h1>"


if __name__ == '__main__':
    app.run(host='0.0.0.0', debug=True)
