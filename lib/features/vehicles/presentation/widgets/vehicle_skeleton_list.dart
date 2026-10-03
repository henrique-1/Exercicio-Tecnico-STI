import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../domain/models/vehicle.dart';
import 'vehicle_card.dart';

class VehicleSkeletonList extends StatelessWidget {
  const VehicleSkeletonList({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: ListView.builder(
        itemCount: 4,
        padding: const EdgeInsets.only(bottom: 80),
        itemBuilder: (context, index) {
          return VehicleCard(
            vehicle: const Vehicle(
              id: 0,
              placa: 'ABC1234',
              cor: 'Prata Metálico',
              ano: 2024,
              porte: 'Médio Porte',
              tipoCarga: 'Passageiro Geral',
              chassis: '9BRBL42E0P0123456',
              modeloId: 1,
              modeloNome: 'Modelo do Veículo',
              marcaId: 1,
              marcaNome: 'Marca Fabricante',
            ),
            onEdit: () {},
            onDelete: () {},
          );
        },
      ),
    );
  }
}
