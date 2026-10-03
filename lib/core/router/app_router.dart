import 'package:go_router/go_router.dart';

import '../../features/vehicles/domain/models/vehicle.dart';
import '../../features/vehicles/presentation/views/vehicle_form_page.dart';
import '../../features/vehicles/presentation/views/vehicle_list_page.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const VehicleListPage(),
      routes: [
        GoRoute(
          path: 'novo',
          builder: (context, state) => const VehicleFormPage(),
        ),
        GoRoute(
          path: 'editar',
          builder: (context, state) {
            final vehicle = state.extra as Vehicle?;
            return VehicleFormPage(vehicle: vehicle);
          },
        ),
      ],
    ),
  ],
);
