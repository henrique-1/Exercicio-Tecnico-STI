// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vehicle.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Vehicle {

 int get id; String get placa; String get cor; int get ano; String get porte; String get tipoCarga; String get chassis; int get modeloId; String get modeloNome; int get marcaId; String get marcaNome;
/// Create a copy of Vehicle
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VehicleCopyWith<Vehicle> get copyWith => _$VehicleCopyWithImpl<Vehicle>(this as Vehicle, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Vehicle&&(identical(other.id, id) || other.id == id)&&(identical(other.placa, placa) || other.placa == placa)&&(identical(other.cor, cor) || other.cor == cor)&&(identical(other.ano, ano) || other.ano == ano)&&(identical(other.porte, porte) || other.porte == porte)&&(identical(other.tipoCarga, tipoCarga) || other.tipoCarga == tipoCarga)&&(identical(other.chassis, chassis) || other.chassis == chassis)&&(identical(other.modeloId, modeloId) || other.modeloId == modeloId)&&(identical(other.modeloNome, modeloNome) || other.modeloNome == modeloNome)&&(identical(other.marcaId, marcaId) || other.marcaId == marcaId)&&(identical(other.marcaNome, marcaNome) || other.marcaNome == marcaNome));
}


@override
int get hashCode => Object.hash(runtimeType,id,placa,cor,ano,porte,tipoCarga,chassis,modeloId,modeloNome,marcaId,marcaNome);

@override
String toString() {
  return 'Vehicle(id: $id, placa: $placa, cor: $cor, ano: $ano, porte: $porte, tipoCarga: $tipoCarga, chassis: $chassis, modeloId: $modeloId, modeloNome: $modeloNome, marcaId: $marcaId, marcaNome: $marcaNome)';
}


}

/// @nodoc
abstract mixin class $VehicleCopyWith<$Res>  {
  factory $VehicleCopyWith(Vehicle value, $Res Function(Vehicle) _then) = _$VehicleCopyWithImpl;
@useResult
$Res call({
 int id, String placa, String cor, int ano, String porte, String tipoCarga, String chassis, int modeloId, String modeloNome, int marcaId, String marcaNome
});




}
/// @nodoc
class _$VehicleCopyWithImpl<$Res>
    implements $VehicleCopyWith<$Res> {
  _$VehicleCopyWithImpl(this._self, this._then);

  final Vehicle _self;
  final $Res Function(Vehicle) _then;

/// Create a copy of Vehicle
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? placa = null,Object? cor = null,Object? ano = null,Object? porte = null,Object? tipoCarga = null,Object? chassis = null,Object? modeloId = null,Object? modeloNome = null,Object? marcaId = null,Object? marcaNome = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,placa: null == placa ? _self.placa : placa // ignore: cast_nullable_to_non_nullable
as String,cor: null == cor ? _self.cor : cor // ignore: cast_nullable_to_non_nullable
as String,ano: null == ano ? _self.ano : ano // ignore: cast_nullable_to_non_nullable
as int,porte: null == porte ? _self.porte : porte // ignore: cast_nullable_to_non_nullable
as String,tipoCarga: null == tipoCarga ? _self.tipoCarga : tipoCarga // ignore: cast_nullable_to_non_nullable
as String,chassis: null == chassis ? _self.chassis : chassis // ignore: cast_nullable_to_non_nullable
as String,modeloId: null == modeloId ? _self.modeloId : modeloId // ignore: cast_nullable_to_non_nullable
as int,modeloNome: null == modeloNome ? _self.modeloNome : modeloNome // ignore: cast_nullable_to_non_nullable
as String,marcaId: null == marcaId ? _self.marcaId : marcaId // ignore: cast_nullable_to_non_nullable
as int,marcaNome: null == marcaNome ? _self.marcaNome : marcaNome // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Vehicle].
extension VehiclePatterns on Vehicle {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Vehicle value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Vehicle() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Vehicle value)  $default,){
final _that = this;
switch (_that) {
case _Vehicle():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Vehicle value)?  $default,){
final _that = this;
switch (_that) {
case _Vehicle() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String placa,  String cor,  int ano,  String porte,  String tipoCarga,  String chassis,  int modeloId,  String modeloNome,  int marcaId,  String marcaNome)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Vehicle() when $default != null:
return $default(_that.id,_that.placa,_that.cor,_that.ano,_that.porte,_that.tipoCarga,_that.chassis,_that.modeloId,_that.modeloNome,_that.marcaId,_that.marcaNome);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String placa,  String cor,  int ano,  String porte,  String tipoCarga,  String chassis,  int modeloId,  String modeloNome,  int marcaId,  String marcaNome)  $default,) {final _that = this;
switch (_that) {
case _Vehicle():
return $default(_that.id,_that.placa,_that.cor,_that.ano,_that.porte,_that.tipoCarga,_that.chassis,_that.modeloId,_that.modeloNome,_that.marcaId,_that.marcaNome);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String placa,  String cor,  int ano,  String porte,  String tipoCarga,  String chassis,  int modeloId,  String modeloNome,  int marcaId,  String marcaNome)?  $default,) {final _that = this;
switch (_that) {
case _Vehicle() when $default != null:
return $default(_that.id,_that.placa,_that.cor,_that.ano,_that.porte,_that.tipoCarga,_that.chassis,_that.modeloId,_that.modeloNome,_that.marcaId,_that.marcaNome);case _:
  return null;

}
}

}

/// @nodoc


class _Vehicle implements Vehicle {
  const _Vehicle({required this.id, required this.placa, required this.cor, required this.ano, required this.porte, required this.tipoCarga, required this.chassis, required this.modeloId, required this.modeloNome, required this.marcaId, required this.marcaNome});
  

@override final  int id;
@override final  String placa;
@override final  String cor;
@override final  int ano;
@override final  String porte;
@override final  String tipoCarga;
@override final  String chassis;
@override final  int modeloId;
@override final  String modeloNome;
@override final  int marcaId;
@override final  String marcaNome;

/// Create a copy of Vehicle
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VehicleCopyWith<_Vehicle> get copyWith => __$VehicleCopyWithImpl<_Vehicle>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Vehicle&&(identical(other.id, id) || other.id == id)&&(identical(other.placa, placa) || other.placa == placa)&&(identical(other.cor, cor) || other.cor == cor)&&(identical(other.ano, ano) || other.ano == ano)&&(identical(other.porte, porte) || other.porte == porte)&&(identical(other.tipoCarga, tipoCarga) || other.tipoCarga == tipoCarga)&&(identical(other.chassis, chassis) || other.chassis == chassis)&&(identical(other.modeloId, modeloId) || other.modeloId == modeloId)&&(identical(other.modeloNome, modeloNome) || other.modeloNome == modeloNome)&&(identical(other.marcaId, marcaId) || other.marcaId == marcaId)&&(identical(other.marcaNome, marcaNome) || other.marcaNome == marcaNome));
}


@override
int get hashCode => Object.hash(runtimeType,id,placa,cor,ano,porte,tipoCarga,chassis,modeloId,modeloNome,marcaId,marcaNome);

@override
String toString() {
  return 'Vehicle(id: $id, placa: $placa, cor: $cor, ano: $ano, porte: $porte, tipoCarga: $tipoCarga, chassis: $chassis, modeloId: $modeloId, modeloNome: $modeloNome, marcaId: $marcaId, marcaNome: $marcaNome)';
}


}

/// @nodoc
abstract mixin class _$VehicleCopyWith<$Res> implements $VehicleCopyWith<$Res> {
  factory _$VehicleCopyWith(_Vehicle value, $Res Function(_Vehicle) _then) = __$VehicleCopyWithImpl;
@override @useResult
$Res call({
 int id, String placa, String cor, int ano, String porte, String tipoCarga, String chassis, int modeloId, String modeloNome, int marcaId, String marcaNome
});




}
/// @nodoc
class __$VehicleCopyWithImpl<$Res>
    implements _$VehicleCopyWith<$Res> {
  __$VehicleCopyWithImpl(this._self, this._then);

  final _Vehicle _self;
  final $Res Function(_Vehicle) _then;

/// Create a copy of Vehicle
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? placa = null,Object? cor = null,Object? ano = null,Object? porte = null,Object? tipoCarga = null,Object? chassis = null,Object? modeloId = null,Object? modeloNome = null,Object? marcaId = null,Object? marcaNome = null,}) {
  return _then(_Vehicle(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,placa: null == placa ? _self.placa : placa // ignore: cast_nullable_to_non_nullable
as String,cor: null == cor ? _self.cor : cor // ignore: cast_nullable_to_non_nullable
as String,ano: null == ano ? _self.ano : ano // ignore: cast_nullable_to_non_nullable
as int,porte: null == porte ? _self.porte : porte // ignore: cast_nullable_to_non_nullable
as String,tipoCarga: null == tipoCarga ? _self.tipoCarga : tipoCarga // ignore: cast_nullable_to_non_nullable
as String,chassis: null == chassis ? _self.chassis : chassis // ignore: cast_nullable_to_non_nullable
as String,modeloId: null == modeloId ? _self.modeloId : modeloId // ignore: cast_nullable_to_non_nullable
as int,modeloNome: null == modeloNome ? _self.modeloNome : modeloNome // ignore: cast_nullable_to_non_nullable
as String,marcaId: null == marcaId ? _self.marcaId : marcaId // ignore: cast_nullable_to_non_nullable
as int,marcaNome: null == marcaNome ? _self.marcaNome : marcaNome // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
