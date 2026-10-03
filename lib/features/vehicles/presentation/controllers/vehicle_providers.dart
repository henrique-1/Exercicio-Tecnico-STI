import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/database/app_database.dart';
import '../../data/repositories/vehicle_repository_impl.dart';
import '../../domain/models/vehicle.dart';
import '../../domain/models/vehicle_brand.dart';
import '../../domain/models/vehicle_model.dart';
import '../../domain/repositories/i_vehicle_repository.dart';

part 'vehicle_providers.g.dart';

@Riverpod(keepAlive: true)
AppDatabase appDatabase(Ref ref) {
  final db = AppDatabase();
  ref.onDispose(() => db.close());
  return db;
}

@Riverpod(keepAlive: true)
IVehicleRepository vehicleRepository(Ref ref) {
  final db = ref.watch(appDatabaseProvider);
  return VehicleRepositoryImpl(db);
}

@riverpod
class VehicleSearchQuery extends _$VehicleSearchQuery {
  @override
  String build() => '';

  void setSearch(String query) => state = query;
  void clear() => state = '';
}

@riverpod
Stream<List<Vehicle>> vehiclesList(Ref ref) {
  final repository = ref.watch(vehicleRepositoryProvider);
  final searchQuery = ref.watch(vehicleSearchQueryProvider);
  return repository.watchVehicles(searchQuery: searchQuery);
}

@riverpod
Future<List<VehicleBrand>> vehicleBrands(Ref ref) {
  final repository = ref.watch(vehicleRepositoryProvider);
  return repository.getBrands();
}

@riverpod
Future<List<VehicleModel>> vehicleModels(Ref ref, int brandId) {
  final repository = ref.watch(vehicleRepositoryProvider);
  return repository.getModelsByBrand(brandId);
}

@riverpod
class VehicleActionController extends _$VehicleActionController {
  @override
  AsyncValue<void> build() => const AsyncValue.data(null);

  Future<bool> deleteVehicle(int id) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final repo = ref.read(vehicleRepositoryProvider);
      await repo.deleteVehicle(id);
    });
    return !state.hasError;
  }

  Future<bool> saveVehicle(Vehicle vehicle, {required bool isEditing}) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final repo = ref.read(vehicleRepositoryProvider);
      if (isEditing) {
        await repo.updateVehicle(vehicle);
      } else {
        await repo.createVehicle(vehicle);
      }
    });
    return !state.hasError;
  }
}
