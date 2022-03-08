import 'dart:async';

import 'package:chef_upp/data/service/recipe/recipe_service.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../core/base/base_bloc.dart';

part 'recipe_information_event.dart';

class RecipeInformationBloc extends BaseBloc<RecipeInformationEvent, RecipeService> {
  RecipeInformationBloc(RecipeService recipeService) : super(recipeService) {
    on<GetRecipeUnformation>(_getRecipeInformation);
  }

  Future<FutureOr<void>> _getRecipeInformation(event, emit) async {
    emit(LoadingState());
    try {
      final response = await service.recipeInformation(id: event.id);
      emit(LoadedState(response));
    } catch (e) {
      emit(ErrorState(e.toString()));
    }
  }
}
