sealed class AppFailure {
  final String message;
  const AppFailure(this.message);

  @override
  String toString() => message;
}

class ValidationFailure extends AppFailure {
  const ValidationFailure(super.message);
}

class DuplicatedPlateFailure extends AppFailure {
  const DuplicatedPlateFailure([String message = 'Já existe um veículo cadastrado com esta placa.'])
      : super(message);
}

class DuplicatedChassisFailure extends AppFailure {
  const DuplicatedChassisFailure([String message = 'Já existe um veículo cadastrado com este chassis.'])
      : super(message);
}

class DatabaseFailure extends AppFailure {
  const DatabaseFailure(super.message);
}

class NotFoundFailure extends AppFailure {
  const NotFoundFailure([String message = 'Registro não encontrado.'])
      : super(message);
}
