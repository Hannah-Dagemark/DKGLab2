import 'package:flutter/material.dart';
import 'package:lab2/model/recipe_database/recipe_handler.dart';
import 'package:lab2/ui_controller.dart';
import 'package:lab2/widgets/recipe_list_item.dart';
import 'package:provider/provider.dart';

class RecipeList extends StatelessWidget {
  const RecipeList({super.key});

  @override
  Widget build(BuildContext context) {
    var recipeHandler = context.watch<RecipeHandler>();
    var recipes = recipeHandler.bestMatches;
    var uiController = Provider.of<UIController>(context, listen: false);

    return ListView(
      children: [
        for (final recipe in recipes)
          Card(
            elevation: 2,
            margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
            child: RecipeListItem(
              recipe,
              onTap: () {
                uiController.selectRecipe(recipe);
              },
            ),
          ),
      ],
    );
  }
}
