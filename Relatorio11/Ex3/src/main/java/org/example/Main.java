package org.example;

public class Main {
    public static void main(String[] args) {
        Alienigena serpo = new Alienigena("Serpoian");
        EspiritoYoukai turbovo = new EspiritoYoukai("Turbo Vovó");

        MapaDeAvistamentos mapa = new MapaDeAvistamentos();
        mapa.registrar("Hospital Abandonado", serpo);
        mapa.registrar("Túnel de Kamikoshi", turbovo);

        System.out.println("--- Investigação ---");
        mapa.investigar("Hospital Abandonado");
        mapa.investigar("Túnel de Kamikoshi");
        mapa.investigar("Escola");
    }
}
