import 'package:drift/drift.dart';

@DataClassName('MarcaEntity')
class MarcasTable extends Table {
  @override
  String get tableName => 'MARCAS';

  IntColumn get id => integer().autoIncrement().named('MAR_ID')();
  TextColumn get nome => text().withLength(min: 1, max: 50).named('MAR_NOME')();
}
