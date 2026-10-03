import 'package:freezed_annotation/freezed_annotation.dart';

part 'vehicle_brand.freezed.dart';

@freezed
abstract class VehicleBrand with _$VehicleBrand {
  const factory VehicleBrand({
    required int id,
    required String nome,
  }) = _VehicleBrand;
}
