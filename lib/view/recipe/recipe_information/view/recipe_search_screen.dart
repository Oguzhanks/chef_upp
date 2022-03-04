import 'package:flutter/material.dart';

class RecipeInformationScreen extends StatefulWidget {
  const RecipeInformationScreen({Key? key}) : super(key: key);

  @override
  State<RecipeInformationScreen> createState() => _RecipeInformationScreenState();
}

class _RecipeInformationScreenState extends State<RecipeInformationScreen> {
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
