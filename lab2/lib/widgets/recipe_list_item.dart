import 'package:flutter/material.dart';
import 'package:lab2/model/recipe_database/recipe.dart';
import 'package:lab2/app_theme.dart';
import 'package:lab2/util/cuisine.dart';
import 'package:lab2/util/difficulty.dart';
import 'package:lab2/util/main_ingredient.dart';

class RecipeListItem extends StatelessWidget {
  const RecipeListItem(this.recipe, {required this.onTap, super.key});

  final Recipe recipe;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        splashColor: Colors.blue.withAlpha(30),
        onTap: onTap,
        child: SizedBox(
          height: 128,
          child: Row(
            children: [
              _image(recipe),

              const SizedBox(width: 8),

              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(recipe.name, style: AppTheme.mediumHeading),

                      const SizedBox(height: 4),

                      Text(
                        recipe.description,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),

                      const Spacer(),

                      Row(
                        children: [
                          if (recipe.mainIngredient != null)
                            MainIngredient.icons[MainIngredient.labels.indexOf(
                                  recipe.mainIngredient,
                                )] ??
                                const SizedBox(),

                          const SizedBox(width: 8),

                          if (recipe.difficulty != null)
                            Difficulty.icons[Difficulty.labels.indexOf(
                                  recipe.difficulty,
                                )] ??
                                const SizedBox(),

                          const SizedBox(width: 12),

                          Icon(Icons.schedule, size: 16),
                          const SizedBox(width: 4),
                          Text('${recipe.time} min'),

                          const SizedBox(width: 12),

                          Icon(Icons.attach_money, size: 16),
                          const SizedBox(width: 4),
                          Text('${recipe.price} kr'),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _image(Recipe recipe) {
    final square = ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: SizedBox(
        width: 104,
        height: 104,
        child: FittedBox(fit: BoxFit.cover, child: recipe.image),
      ),
    );

    final flag = Cuisine.flag(recipe.cuisine, width: 24);

    return Stack(
      children: [
        square,
        Positioned(bottom: 8, right: 8, child: flag ?? const SizedBox()),
      ],
    );
  }
}
