# -*- coding: utf-8 -*-
from flask import Flask, jsonify, request
from dao import TemaDAO, ModuloDAO
from entidades import Tema, Modulo

app = Flask(__name__)

dao_tema = TemaDAO()
dao_modulo = ModuloDAO()

@app.route('/tema')
def get_temas():
    temas = [];
    for t in dao_tema.obterTodos():
        temas.append({"tema_id": t.tema_id, 
                      "tema_nome": t.tema_nome})
    return jsonify(temas)

@app.route('/tema/<tema_id>')
def get_tema(tema_id):
    t = dao_tema.obter(tema_id);
    return jsonify({"tema_id": t.tema_id, 
                    "tema_nome": t.tema_nome})

@app.route('/tema', methods=['POST'])
def add_tema():
    tema_json = request.get_json()
    tema = Tema(tema_id=tema_json['tema_id'], 
                tema_nome=tema_json['tema_nome'])
    dao_tema.incluir(tema)
    return '', 204

@app.route('/tema/<tema_id>', methods=['DELETE'])
def del_tema(tema_id):
    dao_tema.excluir(tema_id)
    return '', 204

@app.route('/modulo/<tema_id>')
def get_modulos(tema_id):
    modulos = [];
    for m in dao_modulo.obterTodosTema(tema_id):
        modulos.append({"modulo_id": m.modulo_id, 
                        "modulo_nome": m.modulo_nome,
                        "tema_id": m.tema_id})
    return jsonify(modulos)

@app.route('/modulo/<tema_id>', methods=['POST'])
def add_modulo(tema_id):
    modulo_json = request.get_json()
    print(modulo_json)
    modulo = Modulo(modulo_id=modulo_json['modulo_id'], 
                    modulo_nome=modulo_json['modulo_nome'],
                    tema_id=modulo_json['tema_id'])
    if modulo.tema_id != tema_id:
        raise Exception("URL inconsistente com novo modulo")
    dao_modulo.incluir(modulo)
    return '', 204

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=5000)