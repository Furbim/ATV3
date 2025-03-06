import 'dart:io';

void main(List<String> arguments) {
  int option = 0;
  late int id;
  late double salario;


  print("Digite o Id da Empresa:");
  String? input = stdin.readLineSync();

  if (input != null && int.tryParse(input) != null) {
    id = int.parse(input); 
  } else {
    print('Entrada inválida. Por favor, digite um número inteiro.');
  }

  print("Digite o nome da empresa:");
  String? nome = stdin.readLineSync();

  Empresa empresa = Empresa(id, nome);

  while(option != 4){

    print("Escolha o que você quer fazer: \n 1: Adicionar Funcionário \n 2:Aumento de salário \n 3:Listar Funcionários \n 4:Sair");

    String? escolha = stdin.readLineSync();
    if (escolha != null && int.tryParse(escolha) != null) {
      option = int.parse(escolha); 
    } else {
      print('Entrada inválida. Por favor, digite um número inteiro.');
    }

    switch(option){
      case 1: 
        print("Digite o Id do funcionário:");
        String? input = stdin.readLineSync();

        if (input != null && int.tryParse(input) != null) {
          id = int.parse(input); 
        } else {
          print('Entrada inválida. Por favor, digite um número inteiro.');
        }

        print("Digite o nome do funcionário:");
        String? nome = stdin.readLineSync();

        print("Digite o cargo do funcionário:");
        String? cargo = stdin.readLineSync();

        print("Digite o salário do funcionário:");
        input = stdin.readLineSync();

        if (input != null && double.tryParse(input) != null) {
          salario = double.parse(input); 
        } else {
          print('Entrada inválida. Por favor, digite um número racional.');
        }

        Funcionario fun = Funcionario(id, nome, cargo, salario);
        empresa.adicionarFuncionario(fun);
      break;
      case 2:
         print("Digite o Id do funcionário para aumentar o salário:");
        String? input = stdin.readLineSync();
        if (input != null && int.tryParse(input) != null) {
          id = int.parse(input);
        } else {
          print('Entrada inválida. Por favor, digite um número inteiro.');
          continue;
        }

        print("Digite o percentual de aumento (ex: 10 para 10%):");
        input = stdin.readLineSync();
        late double percentual;
        if (input != null && double.tryParse(input) != null) {
          percentual = double.parse(input);
        } else {
          print('Entrada inválida. Por favor, digite um número racional.');
          continue;
        }

        empresa.aumentoFuncionario(id, percentual);
      break;
      case 3:
        empresa.exibirFuncionarios();
      break;
      case 4:
        print('Saindo...');
      break;
      default:
        print('Opção inválida!');
      break;
    }


  }

  

 
  empresa.exibirFuncionarios();
}

class Funcionario {
  int? _id;
  String? _nome;
  String? _cargo;
  double _salario = 0;

  Funcionario(this._id, this._nome, this._cargo, this._salario);

  // ID
  void setId(int id) {
    if (_id == null) {
      _id = id;
    }
  }

  int? getId() => _id;

  // Salário
  void setSalario(double salario) {
    _salario = salario;
  }

  double getSalario() => _salario;

  // Nome
  void setNome(String nome) {
    _nome = nome;
  }

  String? getNome() => _nome;

  // Cargo
  void setCargo(String cargo) {
    _cargo = cargo;
  }

  String? getCargo() => _cargo;

  String exibirInformacoes() {
    return "ID: ${_id} \nNome: ${_nome} \nCargo: ${_cargo} \nSalário: ${_salario}";
  }

  void aumento(double percentual) {
    _salario += _salario * percentual / 100;
  }
}

class Empresa {
  int? id;
  String? nome;
  List<Funcionario> funcionarios = [];

  Empresa(this.id, this.nome);

  void adicionarFuncionario(Funcionario funcionario) {
    funcionarios.add(funcionario);
  }

  void aumentoFuncionario(id,double percentual){
  for (var fun in funcionarios) {
      if (fun.getId() == id) {
        fun.aumento(percentual);
        print("Aumento de $percentual% aplicado ao funcionário ${fun.getId()}.");
        return;
      }
    }
    print("Funcionário com ID $id não encontrado.");
  }

  void exibirFuncionarios() {
    for (var f in funcionarios) {
      print(f.exibirInformacoes());
    }
  }
}
