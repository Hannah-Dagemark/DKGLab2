import 'package:flutter/material.dart';
import '../util/cuisine.dart';
import 'package:provider/provider.dart';
import 'package:lab2/model/recipe_database/recipe_handler.dart';

class KitchenControl extends StatelessWidget {
  const KitchenControl({super.key});

  @override
  Widget build(BuildContext context) {
    const labels = Cuisine.labels;
    var recipeHandler = Provider.of<RecipeHandler>(context, listen: false);

    return DropdownMenu<String>(
      width: 164,
      enableFilter: false,
      requestFocusOnTap: false,
      initialSelection: labels[0],
      dropdownMenuEntries: [
        for (int i = 0; i < labels.length; i++)
          DropdownMenuEntry(value: labels[i], label: labels[i]),
      ],
      onSelected: (value) {
        recipeHandler.setCuisine(value);
      },
    );
  }
}
