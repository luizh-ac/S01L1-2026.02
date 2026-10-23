class UsuarioDeNen {
    constructor(nome) {
        this.nome = nome;
    }

    atacar(alvo) {
        console.log(`<${this.nome}> lança um ataque de aura contra ${alvo.nome}!`);
    }
}

class Intensificador extends UsuarioDeNen {
    atacar(alvo) {
        console.log(`<${this.nome}> concentra toda a aura no punho e acerta um JAJANKEN em ${alvo.nome}!`);
    }
}

class Transmutador extends UsuarioDeNen {
    atacar(alvo) {
        console.log(`<${this.nome}> transforma a aura em eletricidade e dispara um RAIO contra ${alvo.nome}!`);
    }
}

class Materializador extends UsuarioDeNen {
    atacar(alvo) {
        console.log(`<${this.nome}> materializa CORRENTES e prende ${alvo.nome}!`);
    }
}

class Aranha {
    constructor(nome, numero) {
        this.nome = nome;
        this.numero = numero;
    }
}

class TrupeFantasma {
    #aranhas;

    constructor(cidade, aranhas = []) {
        this.cidade = cidade;
        this.#aranhas = aranhas;
    }

    revelarAranhas() {
        console.log(`--- Trupe Fantasma avistada em ${this.cidade}! ---`);
        this.#aranhas.forEach(a => console.log(`Aranha nº ${a.numero} - ${a.nome}`));
    }

    buscarAranha(numero) {
        return this.#aranhas.find(a => a.numero === numero);
    }
}

const uvogin = new Aranha('Uvogin', 11);
const feitan = new Aranha('Feitan', 2);

const trupe = new TrupeFantasma('York Shin', [uvogin, feitan]);
trupe.revelarAranhas();

const alvo = trupe.buscarAranha(11);

const hunters = [
    new Intensificador('Gon Freecss'),
    new Transmutador('Killua Zoldyck'),
    new Materializador('Kurapika')
];

console.log(`\n--- Hunters enfrentam a Aranha nº ${alvo.numero} ---`);
hunters.forEach(h => h.atacar(alvo));
