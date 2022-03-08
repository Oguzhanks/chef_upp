import 'dart:async';

import 'package:chef_upp/data/model/recipe/recipe_search_model.dart';
import 'package:chef_upp/data/model/recipe/recipe_search_query_model.dart';
import 'package:chef_upp/data/service/recipe/recipe_service.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../core/base/base_bloc.dart';

part 'recipe_search_event.dart';

class RecipeSearchBloc extends BaseBloc<RecipeSearchEvent, IRecipeService> {
  RecipeSearchBloc(IRecipeService recipeService) : super(recipeService) {
    on<GetRecipeSearch>(_getRecipeSearch);
    on<LazyRecipeSearch>(_lazyRecipeSearch);
  }

  Future<void> _getRecipeSearch(event, emit) async {
    if (!event.isRefresh) emit(LoadingState());

    try {
      event.queryModel?.offset = 0;
      final response = await service.recipeSearch(queryModel: event.queryModel);
      emit(LazyLoadedState(
        data: response!,
        hasReachedMax: response.results!.length < event.queryModel?.number,
      ));
    } catch (e) {
      emit(ErrorState(e.toString()));
    }
  }

  Future<void> _lazyRecipeSearch(event, emit) async {
    if (!_hasReachedMax(state) && state is LazyLoadedState) {
      var currentState = (state as LazyLoadedState<RecipeSearchModel>);
      if (event.queryModel != null) {
        event.queryModel!.offset = currentState.data.results!.length;
      }

      try {
        final response = await service.recipeSearch(queryModel: event.queryModel);

        LazyLoadedState<RecipeSearchModel> _stateResult;

        if (response!.results!.length < event.queryModel!.number!) {
          _stateResult = currentState.copyWith(hasReachedMax: true);
        } else {
          currentState.data.results?.addAll(response.results!);

          _stateResult = LazyLoadedState<RecipeSearchModel>(data: currentState.data, hasReachedMax: false);
        }
        emit(InitialState());

        emit(_stateResult);
      } catch (e) {
        emit(ErrorState(e.toString()));
      }
    }
  }

  bool _hasReachedMax(BaseState state) => state is LazyLoadedState && state.hasReachedMax;
}
