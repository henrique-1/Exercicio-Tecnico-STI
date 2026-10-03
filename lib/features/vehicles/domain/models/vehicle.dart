import 'package:freezed_annotation/freezed_annotation.dart';

part 'vehicle.freezed.dart';

@freezed
abstract class Vehicle with _$Vehicle {
  const factory Vehicle({
    required int id,
    required String placa,
    required String cor,
    required int ano,
    required String porte,
    required String tipoCarga,
    required String chassis,
    required int modeloId,
    required String modeloNome,
    required int marcaId,
    required String marcaNome,
  }) = _Vehicle;
}
