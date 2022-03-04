import 'package:flutter/material.dart';

class RecipeSearchScreen extends StatefulWidget {
  const RecipeSearchScreen({Key? key}) : super(key: key);

  @override
  State<RecipeSearchScreen> createState() => _RecipeSearchScreenState();
}

class _RecipeSearchScreenState extends State<RecipeSearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text(
        'RecipeSearchScreen',
        style: Theme.of(context).textTheme.displaySmall,
      ),
    );
  }
}
