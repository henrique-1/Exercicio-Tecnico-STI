import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/theme/app_theme.dart';
import '../../domain/models/vehicle.dart';
import '../controllers/vehicle_providers.dart';
import '../widgets/vehicle_card.dart';
import '../widgets/vehicle_delete_dialog.dart';
import '../widgets/vehicle_search_bar.dart';
import '../widgets/vehicle_skeleton_list.dart';

class VehicleListPage extends ConsumerWidget {
  const VehicleListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vehiclesAsync = ref.watch(vehiclesListProvider);
    final searchQuery = ref.watch(vehicleSearchQueryProvider);
    final actionState = ref.watch(vehicleActionControllerProvider);

    void confirmDelete(Vehicle vehicle) {
      showDialog(
        context: context,
        barrierDismissible: !actionState.isLoading,
        builder: (dialogContext) {
          return Consumer(
            builder: (context, ref, _) {
              final isDeleting = ref.watch(vehicleActionControllerProvider).isLoading;
              return VehicleDeleteDialog(
                vehicle: vehicle,
                isLoading: isDeleting,
                onConfirm: () async {
                  final success = await ref
                      .read(vehicleActionControllerProvider.notifier)
                      .deleteVehicle(vehicle.id);

                  if (!context.mounted) return;
                  Navigator.of(dialogContext).pop();

                  if (success) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Row(
                          children: [
                            const Icon(Icons.check_circle, color: AppTheme.textOnAction),
                            const SizedBox(width: 8),
                            Text('Veículo ${vehicle.placa} excluído com sucesso!'),
                          ],
                        ),
                        backgroundColor: AppTheme.success,
                      ),
                    );
                  } else {
                    final error = ref.read(vehicleActionControllerProvider).error;
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(error?.toString() ?? 'Erro ao excluir veículo.'),
                        backgroundColor: AppTheme.destructive,
                      ),
                    );
                  }
                },
              );
            },
          );
        },
      );
    }

    return Scaffold(
      backgroundColor: AppTheme.background,
      appBar: AppBar(
        title: const Text('Cadastro de Veículos'),
        actions: [
          vehiclesAsync.when(
            data: (vehicles) => Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: AppTheme.textOnPrimary.withAlpha(40),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    '${vehicles.length} ${vehicles.length == 1 ? 'veículo' : 'veículos'}',
                    style: const TextStyle(
                      color: AppTheme.textOnPrimary,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ),
            loading: () => const SizedBox.shrink(),
            error: (_, __) => const SizedBox.shrink(),
          ),
        ],
      ),
      body: Column(
        children: [
          const VehicleSearchBar(),
          Expanded(
            child: vehiclesAsync.when(
              loading: () => const VehicleSkeletonList(),
              error: (err, stack) => Center(
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.error_outline, size: 48, color: AppTheme.destructive),
                      const SizedBox(height: 12),
                      Text(
                        'Erro ao carregar veículos: $err',
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: AppTheme.textSecondary),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton.icon(
                        onPressed: () => ref.invalidate(vehiclesListProvider),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppTheme.primary,
                          foregroundColor: AppTheme.textOnPrimary,
                        ),
                        icon: const Icon(Icons.refresh),
                        label: const Text('Tentar novamente'),
                      ),
                    ],
                  ),
                ),
              ),
              data: (vehicles) {
                if (vehicles.isEmpty) {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.all(32.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            searchQuery.isEmpty
                                ? Icons.directions_car_outlined
                                : Icons.search_off_rounded,
                            size: 64,
                            color: AppTheme.placeholder,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            searchQuery.isEmpty
                                ? 'Nenhum veículo cadastrado ainda'
                                : 'Nenhum veículo encontrado para "$searchQuery"',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: AppTheme.textPrimary,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            searchQuery.isEmpty
                                ? 'Clique no botão abaixo para adicionar o primeiro veículo ao sistema.'
                                : 'Verifique se a placa ou modelo foi digitado corretamente.',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 14,
                              color: AppTheme.textSecondary,
                            ),
                          ),
                          if (searchQuery.isNotEmpty) ...[
                            const SizedBox(height: 16),
                            OutlinedButton.icon(
                              onPressed: () {
                                ref.read(vehicleSearchQueryProvider.notifier).clear();
                              },
                              style: OutlinedButton.styleFrom(
                                foregroundColor: AppTheme.primary,
                                side: const BorderSide(color: AppTheme.border),
                              ),
                              icon: const Icon(Icons.clear),
                              label: const Text('Limpar busca'),
                            ),
                          ],
                        ],
                      ),
                    ),
                  );
                }

                return ListView.builder(
                  itemCount: vehicles.length,
                  padding: const EdgeInsets.only(bottom: 88, top: 4),
                  itemBuilder: (context, index) {
                    final vehicle = vehicles[index];
                    return VehicleCard(
                      vehicle: vehicle,
                      onEdit: () {
                        context.push('/editar', extra: vehicle);
                      },
                      onDelete: () => confirmDelete(vehicle),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          context.push('/novo');
        },
        backgroundColor: AppTheme.primary,
        foregroundColor: AppTheme.textOnPrimary,
        icon: const Icon(Icons.add),
        label: const Text(
          'Novo Veículo',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
