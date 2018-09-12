import mysql.connector
import json
import datetime

def inserirMaquina(descricao, capacidadeNominal, escalaCapacidade, unidade, setor, timeoutProducao):
  mycursor = mydb.cursor()

  sql = "INSERT INTO maquinas (descricao, capacidadeNominal, escalaCapacidade, unidade, setor, timeoutProducao) VALUES (%s, %s, %s, %s, %s, %s)"
  val = (descricao, capacidadeNominal, escalaCapacidade, unidade, setor, timeoutProducao)
  mycursor.execute(sql, val)

  mydb.commit()

  print("Valor inserido")

def selectAllMaquina():
  mycursor = mydb.cursor()

  sql = ("SELECT * FROM maquinas")
  mycursor.execute(sql)

  row_headers=[x[0] for x in mycursor.description]

  myresult = mycursor.fetchall()

  json_data = []

  for result in myresult:
    json_data.append(dict(zip(row_headers,result)))

  return json.dumps(json_data)

def selectMaquina(id):
  mycursor = mydb.cursor()

  sql = "SELECT * FROM maquinas WHERE id = {}".format(id)
 
  mycursor.execute(sql)

  row_headers=[x[0] for x in mycursor.description]

  myresult = mycursor.fetchall()

  json_data = []

  for result in myresult:
    json_data.append(dict(zip(row_headers,result)))

  return json.dumps(json_data)

def deleteMaquina(id):
  mycursor = mydb.cursor()

  sql = "DELETE FROM maquinas WHERE id = {}".format(id)

  mycursor.execute(sql)

  mydb.commit()

  print("Maquina excluida com sucesso")

def updateMaquina(id, descricao, capacidadeNominal, escalaCapacidade, unidade, setor, timeoutProducao):
  mycursor = mydb.cursor()

  sql = "UPDATE maquinas SET descricao = %s, capacidadeNominal = %s, escalaCapacidade = %s, unidade = %s, setor = %s, timeoutProducao = %s WHERE id = %s"
  val = (descricao, capacidadeNominal, escalaCapacidade, unidade, setor, timeoutProducao, id)

  mycursor.execute(sql, val)

  mydb.commit()

  print("Maquina atualizada com sucesso")

def selectAllTurnos():
  mycursor = mydb.cursor()

  sql = ("SELECT * FROM turnos")
  mycursor.execute(sql)

  row_headers=[x[0] for x in mycursor.description]

  myresult = mycursor.fetchall()

  json_data = []
  array = []
  data= []
  count = 0

  for result in myresult:
    array.append(myresult[count][0])
    array.append(myresult[count][1])
    array.append(myresult[count][2].strftime("%d/%m/%Y-%H:%M"))
    array.append(myresult[count][3].strftime("%d/%m/%Y-%H:%M"))
    data.insert(count, array)
    array = []
    count = count + 1

  for result in data:
    json_data.append(dict(zip(row_headers,result)))

  return json.dumps(json_data)

def inserirTurno(dayIni, timeIni, dayFim, timeFim, id):
  tempoInicio = dayIni + " " + timeIni
  tempoFim = dayFim + " " + timeFim

  mycursor = mydb.cursor()

  if id == "Todas":
    sql = "SELECT DISTINCT maquina FROM turnos"
    mycursor.execute(sql)
    myresult = mycursor.fetchall()
    tamanho = len(myresult)
    interador = 0
    while interador < tamanho:
      sql = "INSERT INTO turnos (maquina, inicio, fim) VALUES ('{}', '{}', '{}')".format(myresult[interador][0], tempoInicio, tempoFim)
      mycursor.execute(sql)
      mydb.commit()
      interador = interador + 1
    
  else:  
    sql = "INSERT INTO turnos (maquina, inicio, fim) VALUES (%s, %s, %s)"
    val = (id, tempoInicio, tempoFim)
    mycursor.execute(sql, val)

    mydb.commit()

  print("Dados inseridos com sucesso")

def selectTurno(dia, maquina):
  mycursor = mydb.cursor()

  if maquina == "0":
    sql = "SELECT * FROM `turnos` WHERE `inicio` BETWEEN '{} 00:00:00.000000' AND '{} 23:59:00.000000'".format(dia,dia)
  else:
    sql = "SELECT * FROM `turnos` WHERE `maquina` = {} AND `inicio` BETWEEN '{} 00:00:00.000000' AND '{} 23:59:00.000000'".format(maquina,dia,dia)

  mycursor.execute(sql)

  row_headers=[x[0] for x in mycursor.description]

  myresult = mycursor.fetchall()

  json_data = []
  array = []
  data= []
  count = 0

  for result in myresult:
    array.append(myresult[count][0])
    array.append(myresult[count][1])
    array.append(myresult[count][2].strftime("%d/%m/%Y-%H:%M"))
    array.append(myresult[count][3].strftime("%d/%m/%Y-%H:%M"))
    data.insert(count, array)
    array = []
    count = count + 1

  for result in data:
    json_data.append(dict(zip(row_headers,result)))

  return json.dumps(json_data)

def deleteTurno(id):
  mycursor = mydb.cursor()

  sql = "DELETE FROM turnos WHERE id = {}".format(id)

  mycursor.execute(sql)

  mydb.commit()

  print("Turno excluido com sucesso")

def selectTurnoEdit(id):
  mycursor = mydb.cursor()

  sql = "SELECT * FROM `turnos` WHERE `id` = {}".format(id)
  
  mycursor.execute(sql)

  row_headers=["id", "maquina", "inicioHora", "inicioData", "fimHora", "fimData", "descricao"]

  myresult = mycursor.fetchall()

  json_data = []
  array = []
  data= []
  count = 0

  for result in myresult:
    array.append(myresult[count][0])
    array.append(myresult[count][1])
    array.append(myresult[count][2].strftime("%H:%M"))
    array.append(myresult[count][2].strftime("%Y-%m-%d"))
    array.append(myresult[count][3].strftime("%H:%M"))
    array.append(myresult[count][3].strftime("%Y-%m-%d"))
    data.insert(count, array)
    array = []
    count = count + 1

  mycursor = mydb.cursor()

  sql = "SELECT descricao FROM `maquinas` WHERE `id` = {}".format(data[0][1])
  
  mycursor.execute(sql)

  myresult = mycursor.fetchall()

  data.append(myresult)

  for result in data:
    json_data.append(dict(zip(row_headers,result)))

  return json.dumps(json_data)

def updateTurno(dayIni, timeIni, dayFim, timeFim, id):
  tempoInicio = dayIni + " " + timeIni
  tempoFim = dayFim + " " + timeFim

  mycursor = mydb.cursor()

  sql = "UPDATE `turnos` SET `inicio`='{}',`fim`='{}' WHERE `id`='{}'".format(tempoInicio, tempoFim, id)
  mycursor.execute(sql)

  mydb.commit()

mydb = mysql.connector.connect(
  host="localhost",
  user="root",
  passwd="",
  database="dbserpiloee"
)