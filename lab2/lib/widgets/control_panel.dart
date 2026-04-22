import 'package:flutter/material.dart';
import 'ingredient_control.dart';
import 'kitchen_control.dart';
import 'difficulty_control.dart';
import 'price_control.dart';
import 'time_control.dart';

class ControlPanel extends StatelessWidget {
  final double width;

  const ControlPanel({super.key, this.width = 320});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      color: const Color.fromARGB(255, 200, 218, 193),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Sök recept'),
            const SizedBox(height: 8),

            const Text('Här kan du filtrera...'),
            const SizedBox(height: 16),

            Row(
              children: const [
                Text('Ingrediens:'),
                SizedBox(width: 10),
                IngredientControl(),
              ],
            ),
            const SizedBox(height: 16),

            Row(
              children: [
                const Text('Kök'),
                const SizedBox(width: 10),
                const KitchenControl(),
              ],
            ),
            const SizedBox(height: 16),
            const Text('Svårighetsgrad'),
            DifficultyControl(),

            const SizedBox(height: 16),
            const Text('Pris'),
            PriceControl(),

            const SizedBox(height: 16),
            const Text('Tid'),
            TimeControl(),
          ],
        ),
      ),
    );
  }
}
