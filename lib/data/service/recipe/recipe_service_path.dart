part of 'recipe_service.dart';

enum _RecipePathEnum {
  search,
  information,
}

extension on _RecipePathEnum {
  String toPath({String? val}) {
    String _controller = '/recipes';

    switch (this) {
      case _RecipePathEnum.search:
        return '$_controller/search';
      case _RecipePathEnum.information:
        return '$_controller${(val != null ? '/$val' : '')}/information';
    }
  }
}
