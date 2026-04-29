import 'package:flutter/material.dart';
import 'package:lab2/app_theme.dart';
import 'package:lab2/model/recipe_database/recipe.dart';
import 'package:lab2/ui_controller.dart';
import 'package:provider/provider.dart';

class RecipeDetail extends StatelessWidget {
  const RecipeDetail(this.recipe, {super.key});

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    var uiController = Provider.of<UIController>(context, listen: false);

    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(AppTheme.paddingMedium),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // IMAGE LEFT
            SizedBox(
              width: 240,
              child: recipe.customImage(width: 240, height: 240),
            ),

            const SizedBox(width: 16),

            // RIGHT SIDE
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Top row: title + close button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(recipe.name, style: AppTheme.largeHeading),
                      ),
                      IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () {
                          uiController.deselectRecipe();
                        },
                      ),
                    ],
                  ),

                  const SizedBox(height: 8),

                  Text(recipe.description),

                  const SizedBox(height: 12),

                  // TIME + PRICE
                  Row(
                    children: [
                      const Icon(Icons.schedule, size: 18),
                      const SizedBox(width: 4),
                      Text('${recipe.time} min'),

                      const SizedBox(width: 16),

                      const Icon(Icons.attach_money, size: 18),
                      const SizedBox(width: 4),
                      Text('${recipe.price} kr'),
                    ],
                  ),

                  const SizedBox(height: 16),

                  // INGREDIENTS
                  Text('Ingredienser', style: AppTheme.smallHeading),
                  const SizedBox(height: 6),
                  Text(recipe.ingredients.toString()),

                  const SizedBox(height: 16),

                  // INSTRUCTIONS
                  Text('Tillagning', style: AppTheme.smallHeading),
                  const SizedBox(height: 6),
                  Text(recipe.instruction.toString()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
