from flask import Flask, request

app = Flask(__name__)

@app.route('/test', methods=['POST'])
def teste_post():
    if request.method == 'POST':
        return "Requisição POST"
    else:
        return "Requisição GET"

if __name__ == '__main__':
    app.run()
