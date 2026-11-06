package org.example;

// Composição: a Panela é criada dentro do construtor do Cozinheiro e só existe junto com ele.
// Agregação: os Monstros são criados fora do Cozinheiro e apenas adicionados à lista de ingredientes,
// então já existiam antes e continuam existindo sem ele.

public class Main {
    public static void main(String[] args) {
        Slime slime = new Slime("Slime Gigante");
        Mandragora mandragora = new Mandragora("Mandrágora");

        Cozinheiro senshi = new Cozinheiro("Senshi", "Casco de Adamantita");
        senshi.adicionarIngrediente(slime);
        senshi.adicionarIngrediente(mandragora);

        senshi.servirBanquete();
    }
}
