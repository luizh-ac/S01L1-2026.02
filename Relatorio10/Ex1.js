class Pokemon {
    #vida;

    constructor(apelido, tipo, vidaInicial) {
        this.apelido = apelido;
        this.tipo = tipo;
        this.#vida = vidaInicial;
    }

    get vida() {
        return this.#vida;
    }

    sofrerDano(pontos) {
        this.#vida -= pontos;
        if (this.#vida < 0) {
            this.#vida = 0;
        }
        console.log(`<${this.apelido}> sofreu ${pontos} de dano. Vida restante: ${this.#vida}`);
    }

    atacar(alvo) {
        console.log(`<${this.apelido}> ataca ${alvo.apelido}!`);
        alvo.sofrerDano(10);
    }
}

class Squirtle extends Pokemon {
    constructor(apelido, vidaInicial) {
        super(apelido, 'Água', vidaInicial);
    }

    atacar(alvo) {
        console.log(`<${this.apelido}> usa JATO D'ÁGUA em ${alvo.apelido}!`);
        alvo.sofrerDano(20);
    }
}

class Bulbasaur extends Pokemon {
    constructor(apelido, vidaInicial) {
        super(apelido, 'Planta', vidaInicial);
    }

    atacar(alvo) {
        console.log(`<${this.apelido}> usa FOLHA NAVALHA em ${alvo.apelido}!`);
        alvo.sofrerDano(15);
    }
}

const squirtle = new Squirtle('Torpedo', 50);
const bulbasaur = new Bulbasaur('Broto', 30);

console.log('--- Batalha no Ginásio ---');
bulbasaur.atacar(squirtle);
squirtle.atacar(bulbasaur);
squirtle.atacar(bulbasaur);

console.log('\n--- Resultado ---');
console.log(`${squirtle.apelido} (${squirtle.tipo}) | Vida: ${squirtle.vida}`);
console.log(`${bulbasaur.apelido} (${bulbasaur.tipo}) | Vida: ${bulbasaur.vida}`);

// console.log(squirtle.#vida);  // SyntaxError: Private field '#vida' must be declared in an enclosing class
