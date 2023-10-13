class Pessoa {
  String nome = "";
  double peso = 0;
  double altura = 0;

  void setNome(String _nome) {
    nome = _nome;
  }

  String getNome() => nome;

  void setPeso(double _peso) {
    peso = _peso;
  }

  double getPeso() => peso;

  void setAltura(double _altura) {
    altura = _altura;
  }

  double getAltura() => altura;

  double calcularIMC() {
    double imc = peso / (altura * altura);
    if (imc <= 0) {
      throw ArgumentError("O IMC não pode ser menor que zero");
    }
    if (peso <= 0) {
      throw ArgumentError("O peso não pode ser zero");
    }

    if (altura <= 0) {
      throw ArgumentError("O altura não pode ser zero");
    }

    return imc.roundToDouble();
  }

  String classificacao(double imc) {
    String classificacao = "";

    if (imc < 16) {
      classificacao = "Magreza grave";
    } else if (imc >= 16 && imc < 17) {
      classificacao = "Magreza moderada";
    } else if (imc >= 17 && imc < 18.5) {
      classificacao = "Magreza leve";
    } else if (imc >= 18.5 && imc < 25) {
      classificacao = "Saudável";
    } else if (imc >= 25 && imc < 30) {
      classificacao = "Sobrepeso";
    } else if (imc >= 30 && imc < 35) {
      classificacao = "Obesidade Grau I";
    } else if (imc >= 35 && imc < 40) {
      classificacao = "Obesidade Grau II (severa)";
    } else {
      classificacao = "Obesidade Grau III (móbida)";
    }

    return classificacao;
  }
}
