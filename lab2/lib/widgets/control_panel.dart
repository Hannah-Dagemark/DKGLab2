import 'package:flutter/material.dart';
import 'package:lab2/app_theme.dart';
import 'package:lab2/widgets/logo.dart';
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
        padding: const EdgeInsets.all(AppTheme.paddingMedium),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Sök recept\n'),
              const SizedBox(height: AppTheme.paddingSmall),

              const Logo(),
              const SizedBox(height: AppTheme.paddingMedium),

              const Text('Här kan du filtrera...'),
              const SizedBox(height: AppTheme.paddingMedium),

              const IngredientControl(),
              const SizedBox(height: AppTheme.paddingMedium),

              const KitchenControl(),
              const SizedBox(height: AppTheme.paddingMedium),

              Row(
                children: [
                  Text('Svårighetsgrad', style: AppTheme.smallHeading),
                ],
              ),
              DifficultyControl(),

              const SizedBox(height: AppTheme.paddingMedium),

              Row(children: [Text('Pris', style: AppTheme.smallHeading)]),
              PriceControl(),

              const SizedBox(height: AppTheme.paddingMedium),

              Row(children: [Text('Tid', style: AppTheme.smallHeading)]),
              TimeControl(),
            ],
          ),
        ),
      ),
    );
  }
}
