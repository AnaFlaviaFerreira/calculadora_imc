import 'dart:convert';
import 'dart:io';

import 'package:desafio_calculadora/classes/Pessoa.dart';

void main(List<String> arguments) {
  print("Calculadora de IMC\n ============== \n");
  print("Digite seu nome: ");
  var nome = stdin.readLineSync(encoding: utf8);
  double altura;
  double peso;

  try {
    print("\nDigite seu peso(kg): ");
    peso = double.parse(stdin.readLineSync()!);
  } catch (e) {
    print("O peso deve ser número com casa decimal");
    exit(0);
  }

  try {
    print("\nDigite seu altura(m): ");
    altura = double.parse(stdin.readLineSync()!);
  } catch (e) {
    print("O altura deve ser número com casa decimal.");
    exit(0);
  }

  Pessoa pessoa = Pessoa();
  pessoa.setNome(nome.toString());
  pessoa.setPeso(peso);
  pessoa.setAltura(altura);

  print("\n==================\n");
  double imc = pessoa.calcularIMC();
  print("IMC: $imc");
  String classificacao = pessoa.classificacao(imc);
  print("Classificação: $classificacao");
}
