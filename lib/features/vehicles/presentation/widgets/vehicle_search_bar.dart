import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/theme/app_theme.dart';
import '../controllers/vehicle_providers.dart';

class VehicleSearchBar extends HookConsumerWidget {
  const VehicleSearchBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textController = useTextEditingController();
    final searchQuery = ref.watch(vehicleSearchQueryProvider);

    useEffect(() {
      if (textController.text != searchQuery) {
        textController.text = searchQuery;
      }
      return null;
    }, [searchQuery]);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: TextField(
        controller: textController,
        style: const TextStyle(color: AppTheme.textPrimary),
        onChanged: (value) {
          ref.read(vehicleSearchQueryProvider.notifier).setSearch(value);
        },
        decoration: InputDecoration(
          hintText: 'Pesquisar por Placa ou Modelo...',
          hintStyle: const TextStyle(color: AppTheme.textSecondary),
          prefixIcon: const Icon(Icons.search, color: AppTheme.primary),
          suffixIcon: textController.text.isNotEmpty
              ? IconButton(
                  icon: const Icon(Icons.clear, size: 20, color: AppTheme.textSecondary),
                  onPressed: () {
                    textController.clear();
                    ref.read(vehicleSearchQueryProvider.notifier).clear();
                  },
                )
              : null,
          filled: true,
          fillColor: AppTheme.surface,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(color: AppTheme.border),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(color: AppTheme.border),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(color: AppTheme.primary, width: 2),
          ),
        ),
      ),
    );
  }
}
