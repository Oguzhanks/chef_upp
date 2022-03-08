part of 'recipe_information_bloc.dart';

@immutable
abstract class RecipeInformationEvent extends Equatable {}

class GetRecipeUnformation extends RecipeInformationEvent {
  final int id;

  GetRecipeUnformation(this.id);

  @override
  List<Object?> get props => [id];
}
