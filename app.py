from flask import Flask, request, render_template, url_for, current_app, jsonify, redirect
import dbOperacoes as bd
import json

app = Flask("WebService")

@app.route("/")
def inicio():
    return render_template("index.html")

@app.route("/maquinas/cadastro", methods=["POST"])
@app.route("/maquinas/cadastro")
def cadastroMaquina():
    if request.method == "POST":
        dados = request.form.to_dict()
        print(dados)
        bd.inserirMaquina(dados['descricao'], 
                          dados['capacidadeNominal'], 
                          dados['escalaCapacidade'], 
                          dados['unidade'], 
                          dados['setor'], 
                          dados['timeoutProducao'])
        return listarMaquina()
    return render_template("cadastroMaquina.html")


@app.route("/maquinas/listar")
def listarMaquina():
    dados = bd.selectAllMaquina()
    return render_template("listarMaquina.php", dados=dados)

@app.route("/maquinas/listar/<int:request_id>")
def excluir(request_id=None):
    bd.deleteMaquina(request_id)
    return listarMaquina()

@app.route("/maquinas/editar/<int:request_id>")
@app.route("/maquinas/editar/<int:request_id>", methods=['POST'])
def editarMaquina(request_id=None):
    if request.method == "POST":
        dados = request.form.to_dict()
        print(dados)
        bd.updateMaquina( dados['id'],
                          dados['descricao'], 
                          dados['capacidadeNominal'], 
                          dados['escalaCapacidade'], 
                          dados['unidade'], 
                          dados['setor'], 
                          dados['timeoutProducao'])
        return listarMaquina()
    dados = bd.selectMaquina(id=request_id)
    return render_template("editarMaquina.php", dados=dados)

@app.route("/turnos/listar/excluir/<int:id>")
def excluirTurno(id = None):
    bd.deleteTurno(id)
    return listarTurno()

@app.route("/turnos/listar/editar/<int:id>")
@app.route("/turnos/listar/editar/<int:id>", methods=['POST'])
def editarTurno(id=None):
    if request.method == "POST":
        dados = request.form.to_dict()
        print(dados)
        bd.updateTurno(dados['inicioData'],
                       dados['inicioHora'],
                       dados['fimData'],
                       dados['fimHora'],
                       id)
        return redirect("/turnos/listar", code=302)
    dadosTurno = bd.selectTurnoEdit(id)
    return render_template("editarTurnos.php", dadosTurno = dadosTurno)

@app.route("/turnos/listar/<int:bday>")
@app.route("/turnos/listar/")
def listarTurno():
    if request.method == "GET":
        dados = request.args.to_dict()
        print(dados)
        try:
            if dados['btimeIni']:
                print("Adicionando turno")
                bd.inserirTurno(dados['bdayIni'], dados['btimeIni'], dados['bdayFim'], dados['btimeFim'], dados['maquina'])
                return redirect("/turnos/listar", code=302)
        except:  
            try:
                print("Pesquisando")
                dadosMaquina = bd.selectAllMaquina()
                dadosTurnos = bd.selectTurno(dados['bday'], dados['maquina'])
                return render_template("listarTurnos.php", dadosMaquina = dadosMaquina, dadosTurnos = dadosTurnos)
            except:
                pass
    dadosMaquina = bd.selectAllMaquina()
    dadosTurnos = bd.selectAllTurnos()
    return render_template("listarTurnos.php", dadosMaquina = dadosMaquina, dadosTurnos = dadosTurnos)

app.run(debug=True, use_reloader=True, port=8080)