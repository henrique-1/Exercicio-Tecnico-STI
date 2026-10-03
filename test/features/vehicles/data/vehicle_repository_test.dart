import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:teste_sti/core/database/app_database.dart';
import 'package:teste_sti/core/errors/app_failure.dart';
import 'package:teste_sti/features/vehicles/data/repositories/vehicle_repository_impl.dart';
import 'package:teste_sti/features/vehicles/domain/models/vehicle.dart';

void main() {
  late AppDatabase db;
  late VehicleRepositoryImpl repository;

  setUp(() async {
    db = AppDatabase(NativeDatabase.memory());
    repository = VehicleRepositoryImpl(db);
    // Dispara a criação das tabelas e o seed inicial
    await db.customSelect('SELECT 1').get();
  });

  tearDown(() async {
    await db.close();
  });

  group('VehicleRepositoryImpl - CRUD e Integridade Relacional', () {
    test('deve inicializar com o seed de marcas e modelos', () async {
      final brands = await repository.getBrands();
      expect(brands, isNotEmpty);
      expect(brands.any((b) => b.nome == 'Toyota'), isTrue);

      final toyota = brands.firstWhere((b) => b.nome == 'Toyota');
      final models = await repository.getModelsByBrand(toyota.id);
      expect(models.any((m) => m.nome == 'Corolla'), isTrue);
    });

    test('deve listar veículos iniciais do seed', () async {
      final vehicles = await repository.getVehicles();
      expect(vehicles.length, greaterThanOrEqualTo(3));
    });

    test('deve buscar veículos por placa ou modelo', () async {
      final porPlaca = await repository.getVehicles(searchQuery: 'BRA2E19');
      expect(porPlaca.length, 1);
      expect(porPlaca.first.placa, 'BRA2E19');

      final porModelo = await repository.getVehicles(searchQuery: 'Corolla');
      expect(porModelo.length, 1);
      expect(porModelo.first.modeloNome, 'Corolla');
    });

    test('deve cadastrar um novo veículo com sucesso', () async {
      final newVehicle = const Vehicle(
        id: 0,
        placa: 'XYZ9876',
        cor: 'Preto',
        ano: 2024,
        porte: 'Médio',
        tipoCarga: 'Passageiro',
        chassis: '9BRBL42E0P9999999',
        modeloId: 1, // Onix
        modeloNome: 'Onix',
        marcaId: 1, // Chevrolet
        marcaNome: 'Chevrolet',
      );

      final newId = await repository.createVehicle(newVehicle);
      expect(newId, greaterThan(0));

      final fetched = await repository.getVehicleById(newId);
      expect(fetched, isNotNull);
      expect(fetched!.placa, 'XYZ9876');
      expect(fetched.modeloNome, 'Onix');
      expect(fetched.marcaNome, 'Chevrolet');
    });

    test('não deve permitir cadastrar veículo com placa duplicada', () async {
      final duplicatePlateVehicle = const Vehicle(
        id: 0,
        placa: 'BRA2E19', // Placa já existente no seed
        cor: 'Vermelho',
        ano: 2021,
        porte: 'Pequeno',
        tipoCarga: 'Passageiro',
        chassis: '9BRBL42E0P8888888',
        modeloId: 4, // Gol
        modeloNome: 'Gol',
        marcaId: 2,
        marcaNome: 'Volkswagen',
      );

      expect(
        () => repository.createVehicle(duplicatePlateVehicle),
        throwsA(isA<DuplicatedPlateFailure>()),
      );
    });

    test('não deve permitir cadastrar veículo com chassis duplicado', () async {
      final duplicateChassisVehicle = const Vehicle(
        id: 0,
        placa: 'KMT5555',
        cor: 'Cinza',
        ano: 2022,
        porte: 'Pequeno',
        tipoCarga: 'Passageiro',
        chassis: '9BRBL42E0P0123456', // Chassis já existente no seed
        modeloId: 4,
        modeloNome: 'Gol',
        marcaId: 2,
        marcaNome: 'Volkswagen',
      );

      expect(
        () => repository.createVehicle(duplicateChassisVehicle),
        throwsA(isA<DuplicatedChassisFailure>()),
      );
    });

    test('deve atualizar os dados de um veículo existente', () async {
      final existing = (await repository.getVehicles()).first;
      final updatedVehicle = existing.copyWith(
        cor: 'Amarelo Ouro',
        ano: 2025,
      );

      await repository.updateVehicle(updatedVehicle);

      final reloaded = await repository.getVehicleById(existing.id);
      expect(reloaded!.cor, 'Amarelo Ouro');
      expect(reloaded.ano, 2025);
    });

    test('deve excluir um veículo existente', () async {
      final existing = (await repository.getVehicles()).first;
      await repository.deleteVehicle(existing.id);

      final reloaded = await repository.getVehicleById(existing.id);
      expect(reloaded, isNull);
    });
  });
}
