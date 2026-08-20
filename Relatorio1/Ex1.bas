dim peso as integer
dim ml as integer
dim meta as integer

input "Digite seu peso em kg", peso
input "digite a quantidade de agua ingerida em ml", ml

meta = peso * 35
if meta >= ml then
    print "Meta nao atingida."
else
    print "Meta atingida!"
end if

sleep