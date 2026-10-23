class FichaDeCriatura {
    constructor(criatura, nivelDePerigo) {
        this.criatura = criatura;
        this.nivelDePerigo = nivelDePerigo;
    }

    descrever() {
        return `Criatura: ${this.criatura} | Nível de Perigo: ${this.nivelDePerigo}`;
    }
}

class DiarioMisterioso {
    #fichas = [];

    constructor(numero) {
        this.numero = numero;
    }

    anotar(criatura, nivelDePerigo) {
        const ficha = new FichaDeCriatura(criatura, nivelDePerigo);
        this.#fichas.push(ficha);
    }

    exibirFichas() {
        console.log(`--- Diário nº ${this.numero} ---`);
        this.#fichas.forEach(f => console.log(f.descrever()));
    }
}

class Funcionario {
    constructor(nome, cargo) {
        this.nome = nome;
        this.cargo = cargo;
    }
}

class CabanaDoMisterio {
    #funcionarios = [];

    constructor(dono) {
        this.dono = dono;
    }

    contratar(funcionario) {
        this.#funcionarios.push(funcionario);
    }

    abrirAsPortas() {
        console.log(`\n--- ${this.dono} abre as portas da Cabana do Mistério! ---`);
        this.#funcionarios.forEach(f => console.log(`- ${f.nome} (${f.cargo})`));
    }
}

// Composição: cada FichaDeCriatura é criada dentro do método anotar() do DiarioMisterioso e só existe nele.
// Agregação: os Funcionarios são criados fora da CabanaDoMisterio e apenas adicionados ao #funcionarios,
// então já existiam antes de serem contratados e continuam existindo fora dela.

const diario = new DiarioMisterioso(3);
diario.anotar('Gnomos', 'Baixo');
diario.anotar('Gobblewonker', 'Médio');
diario.anotar('Bill Cipher', 'Extremo');
diario.exibirFichas();

const soos = new Funcionario('Soos Ramirez', 'Faz-tudo');
const wendy = new Funcionario('Wendy Corduroy', 'Caixa');

const cabana = new CabanaDoMisterio('Tio Stan');
cabana.contratar(soos);
cabana.contratar(wendy);
cabana.abrirAsPortas();
