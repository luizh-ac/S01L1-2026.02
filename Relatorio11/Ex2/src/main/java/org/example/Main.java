package org.example;

public class Main {
    public static void main(String[] args) {
        ItemDoCardapio cafe = new ItemDoCardapio("Café Coado", 8.00);
        ItemDoCardapio curry = new ItemDoCardapio("Curry da Casa", 25.00);
        ComboLeblanc combo = new ComboLeblanc("Combo Curry + Café", 30.00);

        CafeLeblanc leblanc = new CafeLeblanc();
        leblanc.adicionar(cafe);
        leblanc.adicionar(curry);
        leblanc.adicionar(combo);

        leblanc.mostrarCardapio();
    }
}
