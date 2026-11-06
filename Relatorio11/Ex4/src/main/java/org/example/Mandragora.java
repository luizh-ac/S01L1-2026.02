package org.example;

public class Mandragora extends Monstro {
    public Mandragora(String nome) {
        super(nome);
    }

    @Override
    public String receita() {
        return "Arrancar com cuidado, cozinhar no caldo e servir como sopa.";
    }
}
