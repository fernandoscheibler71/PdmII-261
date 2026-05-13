import 'dart:convert';

class Dependente {
  final String nome;

  Dependente(this.nome);

  Map<String, dynamic> toJson() => {
        'nome': nome,
      };
}

class Funcionario {
  final String nome;
  final List<Dependente> dependentes;

  Funcionario(this.nome, List<Dependente> dependentes)
      : dependentes = List.from(dependentes);

  void adicionarDependente(Dependente dependente) {
    dependentes.add(dependente);
  }

  Map<String, dynamic> toJson() => {
        'nome': nome,
        'dependentes': dependentes.map((d) => d.toJson()).toList(),
      };
}

class EquipeProjeto {
  final String nomeProjeto;
  final List<Funcionario> funcionarios;

  EquipeProjeto(this.nomeProjeto, List<Funcionario> funcionarios)
      : funcionarios = List.from(funcionarios);

  void adicionarFuncionario(Funcionario funcionario) {
    funcionarios.add(funcionario);
  }

  Map<String, dynamic> toJson() => {
        'nomeProjeto': nomeProjeto,
        'funcionarios': funcionarios.map((f) => f.toJson()).toList(),
      };
}

void main() {
  final dep1 = Dependente("Davi");
  final dep2 = Dependente("Fernando");
  final dep3 = Dependente("Renan");
  final dep4 = Dependente("Alex");

  final func1 = Funcionario("Davi", [dep1, dep2]);
  final func2 = Funcionario("Renan", [dep3]);

  func2.adicionarDependente(dep4);

  final equipe =
      EquipeProjeto("Equipe só do povo cabeça", [func1, func2]);

  final encoder = JsonEncoder.withIndent('  ');
  final jsonFormatado = encoder.convert(equipe.toJson());

  print(jsonFormatado);
}