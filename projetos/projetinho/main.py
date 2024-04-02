from flask import Flask, render_template

app = Flask(__name__)


@app.route('/')
def principal():
    return render_template('index.html')


@app.route('/formulario')
def formulario():
    return render_template('formulario.html')


@app.route('/lista')
def lista():
    return render_template('lista.html')


@app.route('/login')
def login():
    return render_template('login.html')


if __name__ == '__main__':
    app.run(host='0.0.0.0', debug=True)
