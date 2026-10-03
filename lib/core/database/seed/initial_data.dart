import 'package:drift/drift.dart';

Future<void> populateInitialData(GeneratedDatabase db) async {
  final countResult = await db.customSelect('SELECT COUNT(*) as count FROM MARCAS').getSingle();
  if (countResult.read<int>('count') > 0) return;

  await db.transaction(() async {
    // 1. Inserção de Marcas
    await db.customStatement("INSERT INTO MARCAS (MAR_ID, MAR_NOME) VALUES (1, 'Chevrolet');");
    await db.customStatement("INSERT INTO MARCAS (MAR_ID, MAR_NOME) VALUES (2, 'Volkswagen');");
    await db.customStatement("INSERT INTO MARCAS (MAR_ID, MAR_NOME) VALUES (3, 'Fiat');");
    await db.customStatement("INSERT INTO MARCAS (MAR_ID, MAR_NOME) VALUES (4, 'Toyota');");
    await db.customStatement("INSERT INTO MARCAS (MAR_ID, MAR_NOME) VALUES (5, 'Ford');");
    await db.customStatement("INSERT INTO MARCAS (MAR_ID, MAR_NOME) VALUES (6, 'Hyundai');");
    await db.customStatement("INSERT INTO MARCAS (MAR_ID, MAR_NOME) VALUES (7, 'Volvo');");

    // 2. Inserção de Modelos
    await db.customStatement("INSERT INTO MODELOS (MOD_ID, MOD_NOME, FK_MARCAS_MAR_ID) VALUES (1, 'Onix', 1);");
    await db.customStatement("INSERT INTO MODELOS (MOD_ID, MOD_NOME, FK_MARCAS_MAR_ID) VALUES (2, 'Tracker', 1);");
    await db.customStatement("INSERT INTO MODELOS (MOD_ID, MOD_NOME, FK_MARCAS_MAR_ID) VALUES (3, 'S10', 1);");

    await db.customStatement("INSERT INTO MODELOS (MOD_ID, MOD_NOME, FK_MARCAS_MAR_ID) VALUES (4, 'Gol', 2);");
    await db.customStatement("INSERT INTO MODELOS (MOD_ID, MOD_NOME, FK_MARCAS_MAR_ID) VALUES (5, 'Polo', 2);");
    await db.customStatement("INSERT INTO MODELOS (MOD_ID, MOD_NOME, FK_MARCAS_MAR_ID) VALUES (6, 'T-Cross', 2);");

    await db.customStatement("INSERT INTO MODELOS (MOD_ID, MOD_NOME, FK_MARCAS_MAR_ID) VALUES (7, 'Strada', 3);");
    await db.customStatement("INSERT INTO MODELOS (MOD_ID, MOD_NOME, FK_MARCAS_MAR_ID) VALUES (8, 'Toro', 3);");
    await db.customStatement("INSERT INTO MODELOS (MOD_ID, MOD_NOME, FK_MARCAS_MAR_ID) VALUES (9, 'Argo', 3);");

    await db.customStatement("INSERT INTO MODELOS (MOD_ID, MOD_NOME, FK_MARCAS_MAR_ID) VALUES (10, 'Corolla', 4);");
    await db.customStatement("INSERT INTO MODELOS (MOD_ID, MOD_NOME, FK_MARCAS_MAR_ID) VALUES (11, 'Hilux', 4);");

    await db.customStatement("INSERT INTO MODELOS (MOD_ID, MOD_NOME, FK_MARCAS_MAR_ID) VALUES (12, 'Ranger', 5);");
    await db.customStatement("INSERT INTO MODELOS (MOD_ID, MOD_NOME, FK_MARCAS_MAR_ID) VALUES (13, 'HB20', 6);");
    await db.customStatement("INSERT INTO MODELOS (MOD_ID, MOD_NOME, FK_MARCAS_MAR_ID) VALUES (14, 'FH 540', 7);");

    // 3. Inserção de Veículos de Exemplo
    await db.customStatement("INSERT INTO CARROS (CAR_ID, CAR_PLACA, CAR_COR, CAR_ANO, CAR_PORTE, CAR_TIPO_CARGA, CAR_CHASSIS, FK_MODELOS_MOD_ID) VALUES (1, 'BRA2E19', 'Prata', 2023, 'Médio', 'Passageiro', '9BRBL42E0P0123456', 10);");
    await db.customStatement("INSERT INTO CARROS (CAR_ID, CAR_PLACA, CAR_COR, CAR_ANO, CAR_PORTE, CAR_TIPO_CARGA, CAR_CHASSIS, FK_MODELOS_MOD_ID) VALUES (2, 'RBD3A45', 'Branco', 2024, 'Pequeno', 'Carga Geral', '9BD2782A0P0654321', 7);");
    await db.customStatement("INSERT INTO CARROS (CAR_ID, CAR_PLACA, CAR_COR, CAR_ANO, CAR_PORTE, CAR_TIPO_CARGA, CAR_CHASSIS, FK_MODELOS_MOD_ID) VALUES (3, 'ABC1234', 'Azul', 2022, 'Grande', 'Carga Geral', '9BV1234A0P0987654', 14);");
  });
}
