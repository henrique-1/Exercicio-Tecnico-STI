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
  const DuplicatedPlateFailure([super.message = 'Já existe um veículo cadastrado com esta placa.']);
}

class DuplicatedChassisFailure extends AppFailure {
  const DuplicatedChassisFailure([super.message = 'Já existe um veículo cadastrado com este chassis.']);
}

class DatabaseFailure extends AppFailure {
  const DatabaseFailure(super.message);
}

class NotFoundFailure extends AppFailure {
  const NotFoundFailure([super.message = 'Registro não encontrado.']);
}
