import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../core/utils/validators.dart';
import '../../domain/models/vehicle.dart';
import '../../domain/models/vehicle_brand.dart';
import '../../domain/models/vehicle_model.dart';
import '../controllers/vehicle_providers.dart';

class VehicleFormPage extends HookConsumerWidget {
  final Vehicle? vehicle;

  const VehicleFormPage({super.key, this.vehicle});

  bool get isEditing => vehicle != null;

  static const _porteOptions = ['Pequeno', 'Médio', 'Grande'];
  static const _tipoCargaOptions = [
    'Passageiro',
    'Carga Geral',
    'Seca',
    'Frigorificada',
    'Líquida / Granel',
    'Especial / Perigosa',
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useMemoized(() => GlobalKey<FormState>());

    final placaController = useTextEditingController(
      text: vehicle != null ? PlateFormatter.format(vehicle!.placa) : '',
    );
    final corController = useTextEditingController(text: vehicle?.cor ?? '');
    final anoController = useTextEditingController(
      text: vehicle != null ? vehicle!.ano.toString() : '',
    );
    final chassisController = useTextEditingController(
      text: vehicle?.chassis ?? '',
    );

    final selectedBrandId = useState<int?>(vehicle?.marcaId);
    final selectedModelId = useState<int?>(vehicle?.modeloId);
    final selectedPorte = useState<String?>(vehicle?.porte);
    final selectedTipoCarga = useState<String?>(vehicle?.tipoCarga);

    final brandsAsync = ref.watch(vehicleBrandsProvider);
    final modelsAsync = selectedBrandId.value != null
        ? ref.watch(vehicleModelsProvider(selectedBrandId.value!))
        : const AsyncValue<List<VehicleModel>>.data([]);

    final actionState = ref.watch(vehicleActionControllerProvider);
    final isSaving = actionState.isLoading;

    void onSave() async {
      if (!formKey.currentState!.validate()) return;

      if (selectedBrandId.value == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Row(
              children: [
                Icon(Icons.warning_amber_rounded, color: AppTheme.textOnAction),
                SizedBox(width: 8),
                Text('Por favor, selecione uma marca.'),
              ],
            ),
            backgroundColor: AppTheme.warning,
          ),
        );
        return;
      }

      if (selectedModelId.value == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Row(
              children: [
                Icon(Icons.warning_amber_rounded, color: AppTheme.textOnAction),
                SizedBox(width: 8),
                Text('Por favor, selecione um modelo.'),
              ],
            ),
            backgroundColor: AppTheme.warning,
          ),
        );
        return;
      }

      final brands = brandsAsync.value ?? [];
      final models = modelsAsync.value ?? [];

      final brandName = brands
          .firstWhere((b) => b.id == selectedBrandId.value)
          .nome;
      final modelName = models
          .firstWhere((m) => m.id == selectedModelId.value)
          .nome;

      final vehicleToSave = Vehicle(
        id: vehicle?.id ?? 0,
        placa: AppValidators.sanitizePlate(placaController.text),
        cor: corController.text.trim(),
        ano: int.parse(anoController.text.trim()),
        porte: selectedPorte.value ?? 'Médio',
        tipoCarga: selectedTipoCarga.value ?? 'Passageiro',
        chassis: AppValidators.sanitizeChassis(chassisController.text),
        modeloId: selectedModelId.value!,
        modeloNome: modelName,
        marcaId: selectedBrandId.value!,
        marcaNome: brandName,
      );

      final success = await ref
          .read(vehicleActionControllerProvider.notifier)
          .saveVehicle(vehicleToSave, isEditing: isEditing);

      if (!context.mounted) return;

      if (success) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Row(
              children: [
                const Icon(Icons.check_circle, color: AppTheme.textOnAction),
                SizedBox(width: 8),
                Text(
                  isEditing
                      ? 'Veículo alterado com sucesso!'
                      : 'Veículo cadastrado com sucesso!',
                ),
              ],
            ),
            backgroundColor: AppTheme.success,
          ),
        );
        Navigator.of(context).pop();
      } else {
        final error = ref.read(vehicleActionControllerProvider).error;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Row(
              children: [
                const Icon(Icons.error_outline, color: AppTheme.textOnAction),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    error?.toString() ?? 'Ocorreu um erro ao salvar o veículo.',
                  ),
                ),
              ],
            ),
            backgroundColor: AppTheme.destructive,
          ),
        );
      }
    }

    return Scaffold(
      backgroundColor: AppTheme.background,
      appBar: AppBar(
        title: Text(isEditing ? 'Alterar Veículo' : 'Novo Veículo'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 700),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _buildIdentificationCard(
                    placaController: placaController,
                    chassisController: chassisController,
                  ),
                  const SizedBox(height: 16),
                  _buildBrandModelCard(
                    brandsAsync: brandsAsync,
                    modelsAsync: modelsAsync,
                    selectedBrandId: selectedBrandId,
                    selectedModelId: selectedModelId,
                    isSaving: isSaving,
                  ),
                  const SizedBox(height: 16),
                  _buildSpecsCard(
                    corController: corController,
                    anoController: anoController,
                    selectedPorte: selectedPorte,
                    selectedTipoCarga: selectedTipoCarga,
                    isSaving: isSaving,
                  ),
                  const SizedBox(height: 24),
                  _buildSubmitButton(
                    isSaving: isSaving,
                    onSave: onSave,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildIdentificationCard({
    required TextEditingController placaController,
    required TextEditingController chassisController,
  }) {
    return Card(
      color: AppTheme.surface,
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Identificação do Veículo',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppTheme.textPrimary,
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: placaController,
              style: const TextStyle(color: AppTheme.textPrimary),
              textCapitalization: TextCapitalization.characters,
              inputFormatters: [PlacaVeiculoInputFormatter()],
              validator: AppValidators.validatePlate,
              decoration: const InputDecoration(
                labelText: 'Placa *',
                hintText: 'Ex: BRA-2E19 ou ABC-1234',
                prefixIcon: Icon(
                  Icons.featured_play_list_outlined,
                  color: AppTheme.primary,
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: chassisController,
              style: const TextStyle(color: AppTheme.textPrimary),
              textCapitalization: TextCapitalization.characters,
              inputFormatters: [
                const UpperCaseTextFormatter(),
                LengthLimitingTextInputFormatter(17),
              ],
              validator: AppValidators.validateChassis,
              decoration: const InputDecoration(
                labelText: 'Chassis (VIN) *',
                hintText: '17 caracteres alfanuméricos',
                prefixIcon: Icon(
                  Icons.pin_outlined,
                  color: AppTheme.primary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBrandModelCard({
    required AsyncValue<List<VehicleBrand>> brandsAsync,
    required AsyncValue<List<VehicleModel>> modelsAsync,
    required ValueNotifier<int?> selectedBrandId,
    required ValueNotifier<int?> selectedModelId,
    required bool isSaving,
  }) {
    return Card(
      color: AppTheme.surface,
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Marca e Modelo',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppTheme.textPrimary,
              ),
            ),
            const SizedBox(height: 16),
            brandsAsync.when(
              data: (brands) => DropdownButtonFormField<int>(
                initialValue: selectedBrandId.value,
                dropdownColor: AppTheme.surface,
                style: const TextStyle(color: AppTheme.textPrimary),
                decoration: const InputDecoration(
                  labelText: 'Marca *',
                  prefixIcon: Icon(
                    Icons.business_outlined,
                    color: AppTheme.primary,
                  ),
                ),
                hint: const Text('Selecione uma marca'),
                items: brands.map((b) {
                  return DropdownMenuItem<int>(
                    value: b.id,
                    child: Text(
                      b.nome,
                      style: const TextStyle(color: AppTheme.textPrimary),
                    ),
                  );
                }).toList(),
                onChanged: isSaving
                    ? null
                    : (value) {
                        selectedBrandId.value = value;
                        selectedModelId.value = null;
                      },
                validator: (v) => v == null ? 'Selecione a marca.' : null,
              ),
              loading: () => const LinearProgressIndicator(color: AppTheme.primary),
              error: (e, _) => Text(
                'Erro ao carregar marcas: $e',
                style: const TextStyle(color: AppTheme.destructive),
              ),
            ),
            const SizedBox(height: 16),
            modelsAsync.when(
              data: (models) => DropdownButtonFormField<int>(
                key: ValueKey('model_${selectedBrandId.value}_${selectedModelId.value}'),
                initialValue: selectedModelId.value,
                dropdownColor: AppTheme.surface,
                style: const TextStyle(color: AppTheme.textPrimary),
                decoration: const InputDecoration(
                  labelText: 'Modelo *',
                  prefixIcon: Icon(
                    Icons.directions_car_filled_outlined,
                    color: AppTheme.primary,
                  ),
                ),
                hint: Text(
                  selectedBrandId.value == null
                      ? 'Selecione uma marca primeiro'
                      : 'Selecione o modelo',
                ),
                items: models.map((m) {
                  return DropdownMenuItem<int>(
                    value: m.id,
                    child: Text(
                      m.nome,
                      style: const TextStyle(color: AppTheme.textPrimary),
                    ),
                  );
                }).toList(),
                onChanged: (selectedBrandId.value == null || isSaving)
                    ? null
                    : (value) => selectedModelId.value = value,
                validator: (v) => v == null ? 'Selecione o modelo.' : null,
              ),
              loading: () => const LinearProgressIndicator(color: AppTheme.primary),
              error: (e, _) => Text(
                'Erro ao carregar modelos: $e',
                style: const TextStyle(color: AppTheme.destructive),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSpecsCard({
    required TextEditingController corController,
    required TextEditingController anoController,
    required ValueNotifier<String?> selectedPorte,
    required ValueNotifier<String?> selectedTipoCarga,
    required bool isSaving,
  }) {
    return Card(
      color: AppTheme.surface,
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Características e Especificações',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppTheme.textPrimary,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: TextFormField(
                    controller: corController,
                    style: const TextStyle(color: AppTheme.textPrimary),
                    validator: (v) =>
                        AppValidators.validateRequired(v, 'A cor'),
                    decoration: const InputDecoration(
                      labelText: 'Cor *',
                      hintText: 'Ex: Prata',
                      prefixIcon: Icon(
                        Icons.palette_outlined,
                        color: AppTheme.primary,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  flex: 1,
                  child: TextFormField(
                    controller: anoController,
                    style: const TextStyle(color: AppTheme.textPrimary),
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(4),
                    ],
                    validator: AppValidators.validateYear,
                    decoration: const InputDecoration(
                      labelText: 'Ano *',
                      hintText: 'Ex: 2024',
                      prefixIcon: Icon(
                        Icons.calendar_today_outlined,
                        color: AppTheme.primary,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              initialValue: selectedPorte.value,
              dropdownColor: AppTheme.surface,
              style: const TextStyle(color: AppTheme.textPrimary),
              decoration: const InputDecoration(
                labelText: 'Porte *',
                prefixIcon: Icon(
                  Icons.straighten_outlined,
                  color: AppTheme.primary,
                ),
              ),
              hint: const Text('Selecione o porte'),
              items: _porteOptions.map((p) {
                return DropdownMenuItem<String>(
                  value: p,
                  child: Text(
                    p,
                    style: const TextStyle(color: AppTheme.textPrimary),
                  ),
                );
              }).toList(),
              onChanged: isSaving ? null : (v) => selectedPorte.value = v,
              validator: (v) => AppValidators.validateRequired(v, 'O porte'),
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              initialValue: selectedTipoCarga.value,
              dropdownColor: AppTheme.surface,
              style: const TextStyle(color: AppTheme.textPrimary),
              decoration: const InputDecoration(
                labelText: 'Tipo de Carga *',
                prefixIcon: Icon(
                  Icons.local_shipping_outlined,
                  color: AppTheme.primary,
                ),
              ),
              hint: const Text('Selecione o tipo de carga'),
              items: _tipoCargaOptions.map((tc) {
                return DropdownMenuItem<String>(
                  value: tc,
                  child: Text(
                    tc,
                    style: const TextStyle(color: AppTheme.textPrimary),
                  ),
                );
              }).toList(),
              onChanged: isSaving ? null : (v) => selectedTipoCarga.value = v,
              validator: (v) =>
                  AppValidators.validateRequired(v, 'O tipo de carga'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSubmitButton({
    required bool isSaving,
    required VoidCallback onSave,
  }) {
    return FilledButton.icon(
      onPressed: isSaving ? null : onSave,
      style: FilledButton.styleFrom(
        backgroundColor: AppTheme.success,
        foregroundColor: AppTheme.textOnAction,
        padding: const EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      icon: isSaving
          ? const SizedBox(
              width: 18,
              height: 18,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: AppTheme.textOnAction,
              ),
            )
          : const Icon(Icons.save_outlined),
      label: Text(
        isSaving
            ? 'Salvando...'
            : (isEditing ? 'Salvar Alterações' : 'Cadastrar Veículo'),
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
