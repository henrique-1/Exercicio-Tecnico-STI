import '../models/vehicle.dart';
import '../models/vehicle_brand.dart';
import '../models/vehicle_model.dart';

abstract interface class IVehicleRepository {
  /// Stream reativo para observar os veículos cadastrados (com filtro opcional por placa ou modelo)
  Stream<List<Vehicle>> watchVehicles({String? searchQuery});

  /// Busca pontual de veículos (com filtro opcional por placa ou modelo)
  Future<List<Vehicle>> getVehicles({String? searchQuery});

  /// Busca um veículo por ID
  Future<Vehicle?> getVehicleById(int id);

  /// Cadastra um novo veículo
  Future<int> createVehicle(Vehicle vehicle);

  /// Atualiza os dados de um veículo existente
  Future<void> updateVehicle(Vehicle vehicle);

  /// Remove um veículo por ID
  Future<void> deleteVehicle(int id);

  /// Lista todas as marcas disponíveis
  Future<List<VehicleBrand>> getBrands();

  /// Lista todos os modelos de uma determinada marca
  Future<List<VehicleModel>> getModelsByBrand(int brandId);

  /// Verifica se uma placa já está em uso por outro veículo
  Future<bool> isPlateInUse(String plate, {int? excludeVehicleId});

  /// Verifica se um chassis já está em uso por outro veículo
  Future<bool> isChassisInUse(String chassis, {int? excludeVehicleId});
}
