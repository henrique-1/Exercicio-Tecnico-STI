import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'tables/marcas_table.dart';
import 'tables/modelos_table.dart';
import 'tables/carros_table.dart';
import 'seed/initial_data.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: [MarcasTable, ModelosTable, CarrosTable])
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? executor])
      : super(executor ?? driftDatabase(name: 'vehicles_app_db'));

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (m) async {
          await m.createAll();
          await populateInitialData(this);
        },
        beforeOpen: (details) async {
          await customStatement('PRAGMA foreign_keys = ON;');
        },
      );
}
