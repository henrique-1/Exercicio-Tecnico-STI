import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/services.dart';

/// Formatter que garante que todo texto digitado seja convertido para maiúsculas em tempo real.
class UpperCaseTextFormatter extends TextInputFormatter {
  const UpperCaseTextFormatter();

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    return TextEditingValue(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
}

/// Utilitário para formatar placa veicular com a máscara padrão do `brasil_fields`.
class PlateFormatter {
  PlateFormatter._();

  static final _formatter = PlacaVeiculoInputFormatter();

  /// Formata a placa veicular (ex: `BRA2E19` -> `BRA-2E19`, `ABC1234` -> `ABC-1234`)
  /// com base na implementação do `PlacaVeiculoInputFormatter` do pacote `brasil_fields`.
  static String format(String plate) {
    if (plate.trim().isEmpty) return plate;
    return _formatter.formatEditUpdate(
      TextEditingValue.empty,
      TextEditingValue(text: plate.trim().toUpperCase()),
    ).text;
  }
}
