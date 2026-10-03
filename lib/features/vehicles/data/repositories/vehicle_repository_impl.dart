import 'package:drift/drift.dart';

import '../../../../core/database/app_database.dart';
import '../../../../core/errors/app_failure.dart';
import '../../../../core/utils/validators.dart';
import '../../domain/models/vehicle.dart';
import '../../domain/models/vehicle_brand.dart';
import '../../domain/models/vehicle_model.dart';
import '../../domain/repositories/i_vehicle_repository.dart';

class VehicleRepositoryImpl implements IVehicleRepository {
  final AppDatabase _db;

  VehicleRepositoryImpl(this._db);

  @override
  Stream<List<Vehicle>> watchVehicles({String? searchQuery}) {
    final query = _buildVehiclesQuery(searchQuery);

    return query.watch().map((rows) {
      return rows.map(_mapRowToVehicle).toList();
    });
  }

  @override
  Future<List<Vehicle>> getVehicles({String? searchQuery}) async {
    final query = _buildVehiclesQuery(searchQuery);
    final rows = await query.get();
    return rows.map(_mapRowToVehicle).toList();
  }

  @override
  Future<Vehicle?> getVehicleById(int id) async {
    final query = _db.select(_db.carrosTable).join([
      innerJoin(
        _db.modelosTable,
        _db.modelosTable.id.equalsExp(_db.carrosTable.modeloId),
      ),
      innerJoin(
        _db.marcasTable,
        _db.marcasTable.id.equalsExp(_db.modelosTable.marcaId),
      ),
    ])..where(_db.carrosTable.id.equals(id));

    final row = await query.getSingleOrNull();
    if (row == null) return null;
    return _mapRowToVehicle(row);
  }

  @override
  Future<int> createVehicle(Vehicle vehicle) async {
    final sanitizedPlate = AppValidators.sanitizePlate(vehicle.placa);
    final sanitizedChassis = AppValidators.sanitizeChassis(vehicle.chassis);

    // Validações de unicidade antes de persistir
    if (await isPlateInUse(sanitizedPlate)) {
      throw const DuplicatedPlateFailure();
    }
    if (await isChassisInUse(sanitizedChassis)) {
      throw const DuplicatedChassisFailure();
    }

    try {
      final id = await _db
          .into(_db.carrosTable)
          .insert(
            CarrosTableCompanion.insert(
              placa: sanitizedPlate,
              cor: vehicle.cor.trim(),
              ano: vehicle.ano,
              porte: vehicle.porte.trim(),
              tipoCarga: vehicle.tipoCarga.trim(),
              chassis: sanitizedChassis,
              modeloId: vehicle.modeloId,
            ),
          );
      return id;
    } on Exception catch (e) {
      // TODO: Melhorar a interceptação de erros do banco checando o extended_result_code do SQLite ao invés de string matching.
      final msg = e.toString();
      if (msg.contains('UNIQUE') && msg.contains('CAR_PLACA')) {
        throw const DuplicatedPlateFailure();
      }
      if (msg.contains('UNIQUE') && msg.contains('CAR_CHASSIS')) {
        throw const DuplicatedChassisFailure();
      }
      throw DatabaseFailure('Erro ao cadastrar veículo no banco: $msg');
    }
  }

  @override
  Future<void> updateVehicle(Vehicle vehicle) async {
    final sanitizedPlate = AppValidators.sanitizePlate(vehicle.placa);
    final sanitizedChassis = AppValidators.sanitizeChassis(vehicle.chassis);

    // Validação de unicidade com exclusão do ID atual
    if (await isPlateInUse(sanitizedPlate, excludeVehicleId: vehicle.id)) {
      throw const DuplicatedPlateFailure();
    }
    if (await isChassisInUse(sanitizedChassis, excludeVehicleId: vehicle.id)) {
      throw const DuplicatedChassisFailure();
    }

    try {
      final updated =
          await (_db.update(
            _db.carrosTable,
          )..where((t) => t.id.equals(vehicle.id))).write(
            CarrosTableCompanion(
              placa: Value(sanitizedPlate),
              cor: Value(vehicle.cor.trim()),
              ano: Value(vehicle.ano),
              porte: Value(vehicle.porte.trim()),
              tipoCarga: Value(vehicle.tipoCarga.trim()),
              chassis: Value(sanitizedChassis),
              modeloId: Value(vehicle.modeloId),
            ),
          );

      if (updated == 0) {
        throw const NotFoundFailure('Veículo não encontrado para alteração.');
      }
    } on Exception catch (e) {
      final msg = e.toString();
      if (msg.contains('UNIQUE') && msg.contains('CAR_PLACA')) {
        throw const DuplicatedPlateFailure();
      }
      if (msg.contains('UNIQUE') && msg.contains('CAR_CHASSIS')) {
        throw const DuplicatedChassisFailure();
      }
      throw DatabaseFailure('Erro ao atualizar veículo no banco: $msg');
    }
  }

  @override
  Future<void> deleteVehicle(int id) async {
    final deleted = await (_db.delete(
      _db.carrosTable,
    )..where((t) => t.id.equals(id))).go();

    if (deleted == 0) {
      throw const NotFoundFailure('Veículo não encontrado para exclusão.');
    }
  }

  @override
  Future<List<VehicleBrand>> getBrands() async {
    final marcas = await (_db.select(
      _db.marcasTable,
    )..orderBy([(t) => OrderingTerm.asc(t.nome)])).get();

    return marcas.map((m) => VehicleBrand(id: m.id, nome: m.nome)).toList();
  }

  @override
  Future<List<VehicleModel>> getModelsByBrand(int brandId) async {
    final modelos =
        await (_db.select(_db.modelosTable)
              ..where((t) => t.marcaId.equals(brandId))
              ..orderBy([(t) => OrderingTerm.asc(t.nome)]))
            .get();

    return modelos
        .map((m) => VehicleModel(id: m.id, nome: m.nome, marcaId: m.marcaId))
        .toList();
  }

  @override
  Future<bool> isPlateInUse(String plate, {int? excludeVehicleId}) async {
    final sanitized = AppValidators.sanitizePlate(plate);
    final query = _db.select(_db.carrosTable)
      ..where((t) => t.placa.equals(sanitized));

    if (excludeVehicleId != null) {
      query.where((t) => t.id.isNotValue(excludeVehicleId));
    }

    final results = await query.get();
    return results.isNotEmpty;
  }

  @override
  Future<bool> isChassisInUse(String chassis, {int? excludeVehicleId}) async {
    final sanitized = AppValidators.sanitizeChassis(chassis);
    final query = _db.select(_db.carrosTable)
      ..where((t) => t.chassis.equals(sanitized));

    if (excludeVehicleId != null) {
      query.where((t) => t.id.isNotValue(excludeVehicleId));
    }

    final results = await query.get();
    return results.isNotEmpty;
  }

  // --- Auxiliares privados ---

  JoinedSelectStatement<HasResultSet, dynamic> _buildVehiclesQuery(
    String? searchQuery,
  ) {
    final query = _db.select(_db.carrosTable).join([
      innerJoin(
        _db.modelosTable,
        _db.modelosTable.id.equalsExp(_db.carrosTable.modeloId),
      ),
      innerJoin(
        _db.marcasTable,
        _db.marcasTable.id.equalsExp(_db.modelosTable.marcaId),
      ),
    ]);

    if (searchQuery != null && searchQuery.trim().isNotEmpty) {
      final term = '%${searchQuery.trim()}%';
      query.where(
        _db.carrosTable.placa.like(term) | _db.modelosTable.nome.like(term),
      );
    }

    query.orderBy([OrderingTerm.desc(_db.carrosTable.id)]);
    return query;
  }

  Vehicle _mapRowToVehicle(TypedResult row) {
    final carro = row.readTable(_db.carrosTable);
    final modelo = row.readTable(_db.modelosTable);
    final marca = row.readTable(_db.marcasTable);

    return Vehicle(
      id: carro.id,
      placa: carro.placa,
      cor: carro.cor,
      ano: carro.ano,
      porte: carro.porte,
      tipoCarga: carro.tipoCarga,
      chassis: carro.chassis,
      modeloId: modelo.id,
      modeloNome: modelo.nome,
      marcaId: marca.id,
      marcaNome: marca.nome,
    );
  }
}
