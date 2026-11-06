package org.example;

public class Main {
    public static void main(String[] args) {
        Morador howl = new Mago("Howl", "Transformação em pássaro");
        Morador calcifer = new DemonioDoFogo("Calcifer");

        System.out.println("--- Moradores do Castelo Animado ---");
        howl.apresentar();
        calcifer.apresentar();

        // Morador morador = new Morador("Sophie");  // error: Morador is abstract; cannot be instantiated
    }
}
