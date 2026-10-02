#include <iostream>
#include <string>
using namespace std;

class Banda {
public:
    string nome;
    int integrantes;
    float potenciaSom;
    int energia;

    void duelar(Banda &rival) {
        cout << "A banda " << nome << " sobe ao palco e desafia " << rival.nome << "!" << endl;
        rival.energia -= potenciaSom;
    }

    void exibirStatus() {
        cout << "Banda: " << nome << " | Integrantes: " << integrantes
             << " | Potencia: " << potenciaSom << " | Energia: " << energia << endl;
    }
};

int main() {
    Banda b1;
    b1.nome = "Os Trovoes";
    b1.integrantes = 4;
    b1.potenciaSom = 35.5;
    b1.energia = 100;

    Banda b2;
    b2.nome = "Eco Selvagem";
    b2.integrantes = 5;
    b2.potenciaSom = 28.0;
    b2.energia = 100;

    b1.duelar(b2);

    cout << "STATUS APOS O DUELO" << endl;
    b1.exibirStatus();
    b2.exibirStatus();

    return 0;
}
