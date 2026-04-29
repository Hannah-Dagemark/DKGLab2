import 'package:flutter/material.dart';
import 'package:lab2/app_theme.dart';
import 'package:lab2/util/main_ingredient.dart';
import 'package:lab2/util/cuisine.dart';

class RecipeCard extends StatelessWidget {
  final dynamic recipe;

  const RecipeCard({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: SizedBox(
        height: 128,
        child: Row(
          children: [
            _image(recipe),

            const SizedBox(width: 8),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(recipe.name, style: AppTheme.mediumHeading),

                  Text(
                    recipe.description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),

                  const Spacer(),

                  Row(
                    children: [
                      if (recipe.time != null) Text('${recipe.time} min'),

                      const SizedBox(width: 12),

                      if (recipe.price != null) Text('${recipe.price} kr'),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _image(recipe) {
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
