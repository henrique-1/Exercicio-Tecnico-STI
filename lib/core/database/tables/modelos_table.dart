import 'package:drift/drift.dart';
import 'marcas_table.dart';

@DataClassName('ModeloEntity')
class ModelosTable extends Table {
  @override
  String get tableName => 'MODELOS';

  IntColumn get id => integer().autoIncrement().named('MOD_ID')();
  TextColumn get nome => text().withLength(min: 1, max: 50).named('MOD_NOME')();
  IntColumn get marcaId => integer()
      .named('FK_MARCAS_MAR_ID')
      .references(MarcasTable, #id, onDelete: KeyAction.cascade)();
}
