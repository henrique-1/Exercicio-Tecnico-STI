// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(appDatabase)
final appDatabaseProvider = AppDatabaseProvider._();

final class AppDatabaseProvider
    extends $FunctionalProvider<AppDatabase, AppDatabase, AppDatabase>
    with $Provider<AppDatabase> {
  AppDatabaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appDatabaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appDatabaseHash();

  @$internal
  @override
  $ProviderElement<AppDatabase> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AppDatabase create(Ref ref) {
    return appDatabase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AppDatabase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AppDatabase>(value),
    );
  }
}

String _$appDatabaseHash() => r'448adad5717e7b1c0b3ca3ca7e03d0b2116237af';

@ProviderFor(vehicleRepository)
final vehicleRepositoryProvider = VehicleRepositoryProvider._();

final class VehicleRepositoryProvider
    extends
        $FunctionalProvider<
          IVehicleRepository,
          IVehicleRepository,
          IVehicleRepository
        >
    with $Provider<IVehicleRepository> {
  VehicleRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'vehicleRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$vehicleRepositoryHash();

  @$internal
  @override
  $ProviderElement<IVehicleRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  IVehicleRepository create(Ref ref) {
    return vehicleRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(IVehicleRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<IVehicleRepository>(value),
    );
  }
}

String _$vehicleRepositoryHash() => r'008d408f5e1618907e1ba1b6665ae59636037847';

@ProviderFor(VehicleSearchQuery)
final vehicleSearchQueryProvider = VehicleSearchQueryProvider._();

final class VehicleSearchQueryProvider
    extends $NotifierProvider<VehicleSearchQuery, String> {
  VehicleSearchQueryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'vehicleSearchQueryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$vehicleSearchQueryHash();

  @$internal
  @override
  VehicleSearchQuery create() => VehicleSearchQuery();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$vehicleSearchQueryHash() =>
    r'004e61eb67aae9c388ffb903f273b69cb983bc5b';

abstract class _$VehicleSearchQuery extends $Notifier<String> {
  String build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<String, String>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<String, String>,
              String,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

@ProviderFor(vehiclesList)
final vehiclesListProvider = VehiclesListProvider._();

final class VehiclesListProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Vehicle>>,
          List<Vehicle>,
          Stream<List<Vehicle>>
        >
    with $FutureModifier<List<Vehicle>>, $StreamProvider<List<Vehicle>> {
  VehiclesListProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'vehiclesListProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$vehiclesListHash();

  @$internal
  @override
  $StreamProviderElement<List<Vehicle>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<Vehicle>> create(Ref ref) {
    return vehiclesList(ref);
  }
}

String _$vehiclesListHash() => r'b3e31f98b1ac1f84d722ccc3afd177441a78f8d6';

@ProviderFor(vehicleBrands)
final vehicleBrandsProvider = VehicleBrandsProvider._();

final class VehicleBrandsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<VehicleBrand>>,
          List<VehicleBrand>,
          FutureOr<List<VehicleBrand>>
        >
    with
        $FutureModifier<List<VehicleBrand>>,
        $FutureProvider<List<VehicleBrand>> {
  VehicleBrandsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'vehicleBrandsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$vehicleBrandsHash();

  @$internal
  @override
  $FutureProviderElement<List<VehicleBrand>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<VehicleBrand>> create(Ref ref) {
    return vehicleBrands(ref);
  }
}

String _$vehicleBrandsHash() => r'4aa8af0cd51299f1761ed18566b7b735c2c0b3be';

@ProviderFor(vehicleModels)
final vehicleModelsProvider = VehicleModelsFamily._();

final class VehicleModelsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<VehicleModel>>,
          List<VehicleModel>,
          FutureOr<List<VehicleModel>>
        >
    with
        $FutureModifier<List<VehicleModel>>,
        $FutureProvider<List<VehicleModel>> {
  VehicleModelsProvider._({
    required VehicleModelsFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'vehicleModelsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$vehicleModelsHash();

  @override
  String toString() {
    return r'vehicleModelsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<VehicleModel>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<VehicleModel>> create(Ref ref) {
    final argument = this.argument as int;
    return vehicleModels(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is VehicleModelsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$vehicleModelsHash() => r'fbff9d5f4d7f2d33b7f2bf3f40a3156630817203';

final class VehicleModelsFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<VehicleModel>>, int> {
  VehicleModelsFamily._()
    : super(
        retry: null,
        name: r'vehicleModelsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  VehicleModelsProvider call(int brandId) =>
      VehicleModelsProvider._(argument: brandId, from: this);

  @override
  String toString() => r'vehicleModelsProvider';
}

@ProviderFor(VehicleActionController)
final vehicleActionControllerProvider = VehicleActionControllerProvider._();

final class VehicleActionControllerProvider
    extends $NotifierProvider<VehicleActionController, AsyncValue<void>> {
  VehicleActionControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'vehicleActionControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$vehicleActionControllerHash();

  @$internal
  @override
  VehicleActionController create() => VehicleActionController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<void> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<void>>(value),
    );
  }
}

String _$vehicleActionControllerHash() =>
    r'a017c66a4a221f0793c2ded474479c46d13815ed';

abstract class _$VehicleActionController extends $Notifier<AsyncValue<void>> {
  AsyncValue<void> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<void>, AsyncValue<void>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<void>, AsyncValue<void>>,
              AsyncValue<void>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
