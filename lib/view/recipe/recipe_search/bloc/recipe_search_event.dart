part of 'recipe_search_bloc.dart';

@immutable
abstract class RecipeSearchEvent extends Equatable {}

class GetRecipeSearch extends RecipeSearchEvent {
  final RecipeSearchQueryModel? queryModel;
  final bool isRefresh;

  GetRecipeSearch({@required this.queryModel, this.isRefresh = false});

  @override
  List<Object?> get props => [queryModel, isRefresh];
}

class LazyRecipeSearch extends RecipeSearchEvent {
  final RecipeSearchQueryModel? queryModel;

  LazyRecipeSearch({
    @required this.queryModel,
  });

  @override
  List<Object?> get props => [queryModel];
}
