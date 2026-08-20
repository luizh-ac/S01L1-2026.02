dim senha as integer
dim pin as integer
senha = 1357

input "Digite o pin de acesso", pin
while pin <> senha
    print "Pin invalido. Tente novamente."
    input pin
wend
print "Transacao autorizada"

sleep