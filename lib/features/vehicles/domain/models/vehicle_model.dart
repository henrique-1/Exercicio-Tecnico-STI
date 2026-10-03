import 'package:freezed_annotation/freezed_annotation.dart';

part 'vehicle_model.freezed.dart';

@freezed
abstract class VehicleModel with _$VehicleModel {
  const factory VehicleModel({
    required int id,
    required String nome,
    required int marcaId,
  }) = _VehicleModel;
}
