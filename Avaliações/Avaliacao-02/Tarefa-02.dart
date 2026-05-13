class Pilha {
  List<int> _elementos = [];

  void topo() {
    if (_elementos.isEmpty) {
      print("A pilha está vazia.");
    } else {
      print("Topo da pilha: ${_elementos.last}");
    }
  }

  void empilhar(int valor) {
    _elementos.add(valor);
    print("Elemento $valor empilhado.");
  }

  void desempilhar() {
    if (_elementos.isEmpty) {
      print("A pilha está vazia.");
    } else {
      int removido = _elementos.removeLast();
      print("Elemento $removido desempilhado.");
    }
  }

  void mostrar() {
    if (_elementos.isEmpty) {
      print("A pilha está vazia.");
    } else {
      print("Pilha: $_elementos");
    }
  }
}

void main() {
  Pilha pilha = Pilha();

  print("=== Testando Pilha ===");

  pilha.empilhar(5);
  pilha.empilhar(10);
  pilha.empilhar(15);

  pilha.mostrar();

  pilha.topo();

  pilha.desempilhar();

  pilha.mostrar();

  pilha.topo();
}