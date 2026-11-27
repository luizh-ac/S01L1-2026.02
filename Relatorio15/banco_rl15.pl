% ==========================================
% RELATÓRIO 15 - BANCO DE DADOS: ROTAS COMERCIAIS DE VALDORIA
% ==========================================

% Fatos: Reino de cada cidade (cidade, reino)
reino(solaris, aurelia).
reino(vila_rio, aurelia).
reino(porto_azul, aurelia).
reino(pinhal, norvia).
reino(forte_cinza, norvia).
reino(gelo_alto, norvia).
reino(coral, sulmar).
reino(areia_dourada, sulmar).
reino(brasa, kragh).
reino(rocha_negra, kragh).

% Fatos: Alianças entre reinos (reinoA, reinoB) - valem nos DOIS sentidos
alianca(aurelia, norvia).
alianca(sulmar, aurelia).

% Fatos: Rotas de mão única (origem, destino, meio) - meio: estrada, rio ou mar
rota(solaris, vila_rio, estrada).
rota(solaris, pinhal, estrada).
rota(vila_rio, porto_azul, rio).
rota(vila_rio, pinhal, rio).
rota(pinhal, forte_cinza, estrada).
rota(pinhal, rocha_negra, estrada).
rota(forte_cinza, gelo_alto, estrada).
rota(porto_azul, coral, mar).
rota(porto_azul, areia_dourada, mar).
rota(coral, areia_dourada, mar).
rota(areia_dourada, brasa, estrada).
rota(brasa, rocha_negra, estrada).
rota(gelo_alto, rocha_negra, rio).

% Fatos: Cidades sitiadas (cidade) - ninguém entra nem passa por elas
sitiada(pinhal).
sitiada(coral).

% Fatos: Produção de cada cidade (cidade, produto)
produz(solaris, tecido).
produz(solaris, vinho).
produz(vila_rio, trigo).
produz(vila_rio, peixe).
produz(porto_azul, peixe).
produz(porto_azul, sal).
produz(pinhal, madeira).
produz(pinhal, ferro).
produz(forte_cinza, ferro).
produz(gelo_alto, pele).
produz(coral, perola).
produz(coral, peixe).
produz(areia_dourada, especiaria).
produz(areia_dourada, sal).
produz(brasa, carvao).
produz(rocha_negra, ferro).
produz(rocha_negra, carvao).

% Fatos: Cidade-base de cada mercador (mercador, cidade)
base(lia, solaris).
base(oren, forte_cinza).
base(tavi, coral).
base(bruk, rocha_negra).
base(mira, porto_azul).
base(sael, areia_dourada).
base(ivo, gelo_alto).
base(dara, brasa).

% Fatos: Licenças de comércio (mercador, reino)
licenca(lia, aurelia).
licenca(oren, aurelia).
licenca(oren, norvia).
licenca(tavi, aurelia).
licenca(bruk, aurelia).
licenca(mira, sulmar).
licenca(sael, aurelia).
licenca(ivo, norvia).
licenca(dara, aurelia).

% Fatos: Mercadores banidos (mercador)
banido(sael).

% Regra 1:
aliado(R1, R2) :-
    alianca(R1, R2) ; alianca(R2, R1).

mercador_apto(Mercador, Reino) :-
    licenca(Mercador, Reino),
    base(Mercador, Cidade),
    reino(Cidade, ReinoBase),
    (ReinoBase = Reino ; aliado(ReinoBase, Reino)),
    \+ banido(Mercador).

%Query 1:
% ?- mercador_apto(X, aurelia).   -> X = lia ; X = oren ; X = tavi


%Regra 2:
troca(C1, C2) :-
    (rota(C1, C2, _) ; rota(C2, C1, _)),
    reino(C1, R1),
    reino(C2, R2),
    R1 \= R2,
    produz(C1, Produto),
    \+ produz(C2, Produto).

%Query 2:
% ?- troca(rocha_negra, X).   -> X = pinhal ; X = gelo_alto ; X = gelo_alto


%Regra 3:
por_meio(Origem, Destino, Meio) :-
    rota(Origem, Destino, Meio).

por_meio(Origem, Destino, Meio) :-
    rota(Origem, Z, Meio),
    por_meio(Z, Destino, Meio).

%Query 3:
% ?- por_meio(solaris, X, estrada).   -> X = vila_rio ; X = pinhal ; X = forte_cinza ; X = rocha_negra ; X = gelo_alto


%Regra 4:
rota_segura(Origem, Destino) :-
    rota(Origem, Destino, _),
    \+ sitiada(Destino).

rota_segura(Origem, Destino) :-
    rota(Origem, Z, _),
    \+ sitiada(Z),
    rota_segura(Z, Destino).

%Query 4:
% ?- rota_segura(solaris, X).   -> X = vila_rio ; X = porto_azul ; X = areia_dourada ; X = brasa ; X = rocha_negra
% ?- rota_segura(solaris, forte_cinza).   -> false
