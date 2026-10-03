import 'package:drift/drift.dart';
import 'modelos_table.dart';

@DataClassName('CarroEntity')
class CarrosTable extends Table {
  @override
  String get tableName => 'CARROS';

  IntColumn get id => integer().autoIncrement().named('CAR_ID')();
  TextColumn get placa => text().withLength(min: 7, max: 10).unique().named('CAR_PLACA')();
  TextColumn get cor => text().withLength(min: 1, max: 30).named('CAR_COR')();
  IntColumn get ano => integer().named('CAR_ANO')();
  TextColumn get porte => text().withLength(min: 1, max: 20).named('CAR_PORTE')();
  TextColumn get tipoCarga => text().withLength(min: 1, max: 30).named('CAR_TIPO_CARGA')();
  TextColumn get chassis => text().withLength(min: 17, max: 17).unique().named('CAR_CHASSIS')();
  IntColumn get modeloId => integer()
      .named('FK_MODELOS_MOD_ID')
      .references(ModelosTable, #id, onDelete: KeyAction.cascade)();
}
