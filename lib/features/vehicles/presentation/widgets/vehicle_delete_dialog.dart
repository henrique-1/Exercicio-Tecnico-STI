import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';
import '../../domain/models/vehicle.dart';

class VehicleDeleteDialog extends StatelessWidget {
  final Vehicle vehicle;
  final VoidCallback onConfirm;
  final bool isLoading;

  const VehicleDeleteDialog({
    super.key,
    required this.vehicle,
    required this.onConfirm,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppTheme.surface,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      title: const Row(
        children: [
          Icon(Icons.warning_amber_rounded, color: AppTheme.destructive, size: 28),
          SizedBox(width: 10),
          Text(
            'Excluir Veículo',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 18,
              color: AppTheme.textPrimary,
            ),
          ),
        ],
      ),
      content: RichText(
        text: TextSpan(
          style: const TextStyle(
            color: AppTheme.textSecondary,
            fontSize: 15,
            height: 1.4,
          ),
          children: [
            const TextSpan(text: 'Tem certeza de que deseja excluir o veículo '),
            TextSpan(
              text: '${vehicle.marcaNome} ${vehicle.modeloNome}',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: AppTheme.textPrimary,
              ),
            ),
            const TextSpan(text: ' de placa '),
            TextSpan(
              text: vehicle.placa,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: AppTheme.textPrimary,
              ),
            ),
            const TextSpan(text: '?\n\nEsta operação não poderá ser revertida.'),
          ],
        ),
      ),
      actionsPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      actions: [
        TextButton(
          onPressed: isLoading ? null : () => Navigator.of(context).pop(),
          child: const Text(
            'Cancelar',
            style: TextStyle(color: AppTheme.textSecondary),
          ),
        ),
        FilledButton(
          onPressed: isLoading ? null : onConfirm,
          style: FilledButton.styleFrom(
            backgroundColor: AppTheme.destructive,
            foregroundColor: AppTheme.textOnAction,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
          child: isLoading
              ? const SizedBox(
                  width: 18,
                  height: 18,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: AppTheme.textOnAction,
                  ),
                )
              : const Text(
                  'Excluir',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
        ),
      ],
    );
  }
}
