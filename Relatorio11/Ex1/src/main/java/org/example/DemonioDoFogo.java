package org.example;

public class DemonioDoFogo extends Morador {
    public DemonioDoFogo(String nome) {
        super(nome);
    }

    @Override
    public void apresentar() {
        System.out.println("<" + getNome() + "> Sou o demônio do fogo que faz o castelo andar!");
    }
}
