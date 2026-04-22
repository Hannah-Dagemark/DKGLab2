import 'package:flutter/material.dart';
import 'package:lab2/pages/main_view.dart';
import 'package:provider/provider.dart';
import 'package:lab2/model/recipe_database/recipe_handler.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => RecipeHandler(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Receptsök',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: MainView(),
    );
  }
}
