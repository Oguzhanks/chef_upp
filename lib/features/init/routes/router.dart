import 'package:auto_route/auto_route.dart';

import '../../../view/recipe/recipe_information/view/recipe_information_screen.dart';
import '../../../view/recipe/recipe_search/view/recipe_search_screen.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Screen,Route',
  routes: [
    MaterialRoute(page: RecipeSearchScreen, initial: true),
    MaterialRoute(page: RecipeInformationScreen, path: ':id'),
  ],
)
class $AppRouter {}
