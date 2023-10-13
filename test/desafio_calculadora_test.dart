import 'package:desafio_calculadora/classes/Pessoa.dart';
import 'package:test/test.dart';

void main() {
  group(
    "Calcular IMC",
    () {
      var valuesToTest = {
        {'nome': "Ana 1", 'peso': 67, 'altura': 1.67}: 24.0,
        {'nome': "Ana 2", 'peso': 80, 'altura': 1.77}: 26.0,
      };
      valuesToTest.forEach((values, expected) {
        Pessoa pessoa = Pessoa();
        pessoa.setNome(values["nome"].toString());
        pessoa.setPeso(double.parse(values["peso"].toString()));
        pessoa.setAltura(double.parse(values["altura"].toString()));
        test('$values: $expected', () {
          expect(pessoa.calcularIMC(), equals(expected));
        });
      });
    },
  );

  group(
    "Calcular IMC, com valor zerado ou com erro",
    () {
      var valuesToTest = {
        {'nome': "Ana 1", 'peso': 0, 'altura': 1.67},
        {'nome': "Ana 2", 'peso': 80, 'altura': 0},
        {'nome': "Ana 2", 'peso': 0, 'altura': 0},
      };
      for (var values in valuesToTest) {
        Pessoa pessoa = Pessoa();
        pessoa.setNome(values["nome"].toString());
        pessoa.setPeso(double.parse(values["peso"].toString()));
        pessoa.setAltura(double.parse(values["altura"].toString()));
        test('Entrada: $values', () {
          expect(() => pessoa.calcularIMC(),
              throwsA(TypeMatcher<ArgumentError>()));
        });
      }
    },
  );
}
