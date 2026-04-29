import 'package:flutter/material.dart';
import 'package:lab2/app_theme.dart';
import 'package:lab2/model/recipe_database/recipe_handler.dart';
import 'package:lab2/util/difficulty.dart';
import 'package:provider/provider.dart';

class DifficultyControl extends StatefulWidget {
  const DifficultyControl({super.key});

  @override
  State<DifficultyControl> createState() => _DifficultyControlState();
}

class _DifficultyControlState extends State<DifficultyControl> {
  String _difficulty = Difficulty.labels[0];

  @override
  Widget build(BuildContext context) {
    final recipeHandler = Provider.of<RecipeHandler>(context, listen: false);

    return RadioGroup<String>(
      groupValue: _difficulty,
      onChanged: (value) {
        setState(() {
          _difficulty = value!;
        });
        recipeHandler.setDifficulty(_difficulty);
      },
      child: Column(
        children: [
          for (int i = 0; i < Difficulty.labels.length; i++)
            RadioListTile<String>(
              value: Difficulty.labels[i],

              title: Row(
                children: [
                  if (Difficulty.icons[i] != null) ...[
                    Difficulty.icons[i]!,
                    SizedBox(width: AppTheme.paddingMedium),
                  ],
                  Text(Difficulty.labels[i]),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
