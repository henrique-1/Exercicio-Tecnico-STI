import 'package:flutter_test/flutter_test.dart';
import 'package:teste_sti/core/utils/validators.dart';

void main() {
  group('AppValidators - Validação de Placa', () {
    test('deve aceitar placa padrão tradicional com ou sem hífen', () {
      expect(AppValidators.validatePlate('ABC1234'), isNull);
      expect(AppValidators.validatePlate('ABC-1234'), isNull);
      expect(AppValidators.validatePlate('abc-1234'), isNull);
    });

    test('deve aceitar placa padrão Mercosul com ou sem hífen', () {
      expect(AppValidators.validatePlate('ABC1D23'), isNull);
      expect(AppValidators.validatePlate('bra2e19'), isNull);
      expect(AppValidators.validatePlate('BRA-2E19'), isNull);
    });

    test('deve rejeitar placas inválidas ou com formato incorreto', () {
      expect(AppValidators.validatePlate(''), isNotNull);
      expect(AppValidators.validatePlate('   '), isNotNull);
      expect(AppValidators.validatePlate(null), isNotNull);
      expect(AppValidators.validatePlate('1234ABC'), isNotNull);
      expect(AppValidators.validatePlate('ABCD123'), isNotNull);
      expect(AppValidators.validatePlate('ABC12345'), isNotNull);
      expect(AppValidators.validatePlate('AB1234'), isNotNull);
    });
  });

  group('AppValidators - Validação de Chassis', () {
    test('deve aceitar chassis de 17 caracteres válidos', () {
      expect(AppValidators.validateChassis('9BRBL42E0P0123456'), isNull);
      expect(AppValidators.validateChassis('9bd2782a0p0654321'), isNull);
    });

    test('deve rejeitar chassis com tamanho diferente de 17', () {
      expect(AppValidators.validateChassis('1234567890123456'), isNotNull); // 16
      expect(AppValidators.validateChassis('123456789012345678'), isNotNull); // 18
    });

    test('deve rejeitar chassis com letras proibidas (I, O, Q)', () {
      expect(AppValidators.validateChassis('9BRBL42E0PI123456'), isNotNull); // com I
      expect(AppValidators.validateChassis('9BRBL42E0PO123456'), isNotNull); // com O
      expect(AppValidators.validateChassis('9BRBL42E0PQ123456'), isNotNull); // com Q
    });

    test('deve rejeitar chassis vazio ou nulo', () {
      expect(AppValidators.validateChassis(''), isNotNull);
      expect(AppValidators.validateChassis(null), isNotNull);
    });
  });

  group('AppValidators - Validação de Ano', () {
    test('deve aceitar ano numérico razoável', () {
      expect(AppValidators.validateYear('2020'), isNull);
      expect(AppValidators.validateYear('2024'), isNull);
      expect(AppValidators.validateYear('1995'), isNull);
    });

    test('deve rejeitar anos fora da faixa aceitável ou não numéricos', () {
      expect(AppValidators.validateYear('1899'), isNotNull);
      expect(AppValidators.validateYear('2099'), isNotNull);
      expect(AppValidators.validateYear('abc'), isNotNull);
      expect(AppValidators.validateYear(''), isNotNull);
      expect(AppValidators.validateYear(null), isNotNull);
    });
  });

  group('AppValidators - Sanitização', () {
    test('sanitizePlate deve remover hífens e converter para maiúsculas', () {
      expect(AppValidators.sanitizePlate('abc-1234'), 'ABC1234');
      expect(AppValidators.sanitizePlate(' bra-2e19 '), 'BRA2E19');
    });

    test('sanitizeChassis deve remover espaços e converter para maiúsculas', () {
      expect(AppValidators.sanitizeChassis(' 9brbl42e0p0123456 '), '9BRBL42E0P0123456');
    });
  });
}
