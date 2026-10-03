class AppValidators {
  AppValidators._();

  /// Validação genérica de campo obrigatório
  static String? validateRequired(String? value, [String fieldName = 'Este campo']) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName é obrigatório.';
    }
    return null;
  }

  /// Validação de placa (padrão antigo ABC-1234 e padrão Mercosul ABC1D23)
  static String? validatePlate(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'A placa é obrigatória.';
    }

    final sanitized = value.trim().toUpperCase().replaceAll('-', '');
    
    // Formato Antigo: 3 letras e 4 números (ex: ABC1234)
    // Formato Mercosul: 3 letras, 1 número, 1 letra e 2 números (ex: ABC1D23)
    final plateRegex = RegExp(r'^[A-Z]{3}[0-9][A-Z0-9][0-9]{2}$');

    if (!plateRegex.hasMatch(sanitized)) {
      return 'Informe uma placa válida (ex: ABC1D23 ou ABC-1234).';
    }

    return null;
  }

  /// Validação do número de Chassis (VIN - 17 caracteres alfanuméricos)
  static String? validateChassis(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'O chassis é obrigatório.';
    }

    final sanitized = value.trim().toUpperCase();

    if (sanitized.length != 17) {
      return 'O chassis deve conter exatamente 17 caracteres.';
    }

    final vinRegex = RegExp(r'^[A-HJ-NPR-Z0-9]{17}$');
    if (!vinRegex.hasMatch(sanitized)) {
      return 'Chassis inválido. Não pode conter as letras I, O ou Q.';
    }

    return null;
  }

  /// Validação de ano de fabricação
  static String? validateYear(String? value, {int? maxYearAllowed}) {
    if (value == null || value.trim().isEmpty) {
      return 'O ano é obrigatório.';
    }

    final parsed = int.tryParse(value.trim());
    if (parsed == null) {
      return 'Informe um ano numérico válido.';
    }

    final currentYear = DateTime.now().year;
    final maxYear = maxYearAllowed ?? (currentYear + 1);

    if (parsed < 1900 || parsed > maxYear) {
      return 'O ano deve estar entre 1900 e $maxYear.';
    }

    return null;
  }

  static String sanitizePlate(String plate) {
    return plate.trim().toUpperCase().replaceAll('-', '').replaceAll(' ', '');
  }

  static String sanitizeChassis(String chassis) {
    return chassis.trim().toUpperCase().replaceAll(' ', '');
  }
}
