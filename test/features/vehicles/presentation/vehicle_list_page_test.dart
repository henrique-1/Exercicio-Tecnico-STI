import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sizer/sizer.dart';
import 'package:teste_sti/core/database/app_database.dart';
import 'package:teste_sti/core/router/app_router.dart';
import 'package:teste_sti/core/theme/app_theme.dart';
import 'package:teste_sti/features/vehicles/presentation/controllers/vehicle_providers.dart';

void main() {
  late AppDatabase db;

  setUp(() async {
    db = AppDatabase(NativeDatabase.memory());
    await db.customSelect('SELECT 1').get();
  });

  tearDown(() async {
    await db.close();
  });

  testWidgets('VehicleListPage renderiza lista de veículos e permite filtrar',
      (tester) async {
    // Configura tela em tamanho desktop/tablet para evitar overflow
    tester.view.physicalSize = const Size(1280, 800);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          appDatabaseProvider.overrideWithValue(db),
        ],
        child: Sizer(
          builder: (context, orientation, deviceType) {
            return MaterialApp.router(
              theme: AppTheme.lightTheme,
              routerConfig: appRouter,
            );
          },
        ),
      ),
    );

    // Aguarda o stream do Drift emitir os dados do seed inicial
    await tester.pumpAndSettle();

    // Verifica se os veículos iniciais do seed são renderizados
    expect(find.text('Cadastro de Veículos'), findsOneWidget);
    expect(find.text('Toyota Corolla'), findsOneWidget);
    expect(find.text('Fiat Strada'), findsOneWidget);
    expect(find.text('Volvo FH 540'), findsOneWidget);

    // Verifica a presença do botão de cadastrar novo veículo
    expect(find.text('Novo Veículo'), findsOneWidget);

    // Realiza uma pesquisa por "Corolla"
    final searchField = find.byType(TextField);
    expect(searchField, findsOneWidget);

    await tester.enterText(searchField, 'Corolla');
    await tester.pumpAndSettle();

    // Deve exibir apenas o Corolla
    expect(find.text('Toyota Corolla'), findsOneWidget);
    expect(find.text('Fiat Strada'), findsNothing);
    expect(find.text('Volvo FH 540'), findsNothing);

    // Limpa a pesquisa
    await tester.enterText(searchField, '');
    await tester.pumpAndSettle();

    // Todos devem reaparecer
    expect(find.text('Toyota Corolla'), findsOneWidget);
    expect(find.text('Fiat Strada'), findsOneWidget);
    expect(find.text('Volvo FH 540'), findsOneWidget);

    // Remove o foco e desmonta o widget para drenar o timer de fechamento de streams do Drift
    FocusManager.instance.primaryFocus?.unfocus();
    await tester.pumpWidget(const SizedBox.shrink());
    await tester.pump(Duration.zero);
  });
}
