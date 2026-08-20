dim distance as integer
dim tempo as integer
dim pace as integer

input "Digite a distancia percorrida no treino em quilometros", distance
input "Digite o tempo total gasto para completar a corrida em minutos", tempo

pace = tempo / distance
print "Pace medio:"; pace

sleep