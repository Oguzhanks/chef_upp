import 'package:chef_upp/data/model/recipe/recipe_search_query_model.dart';
import 'package:chef_upp/data/service/recipe/recipe_service.dart';
import 'package:chef_upp/features/init/network/dio_manager.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Recipe Service Test', () {
    final RecipeService recipeService = RecipeService(DioManager.instance.networkManager);
    /*  setUp(() {
      recipeService = RecipeService(DioManager.instance.networkManager);
    }); */

    test('Search Request Test', () async {
      final response = await recipeService.recipeSearch(
          queryModel: RecipeSearchQueryModel(
        query: 'burger',
        diet: 'vegetarian',
        excludeIngredients: 'coconut',
        intolerances: 'egg, gluten',
        number: 10,
        offset: 0,
        type: 'main course',
      ));

      expect(response, isNotNull);
    });
    test('Information Request Test', () async {
      final response = await recipeService.recipeInformation(id: 479101);

      expectLater(response, isNotNull);
    });
  });
}
