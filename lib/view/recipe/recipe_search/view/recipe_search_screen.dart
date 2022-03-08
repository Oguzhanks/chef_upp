import 'package:chef_upp/core/extensions/padding_kit.dart';
import 'package:chef_upp/data/model/recipe/recipe_search_model.dart';
import 'package:chef_upp/data/model/recipe/recipe_search_query_model.dart';
import 'package:chef_upp/view/recipe/recipe_search/view/recipe_item_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/base/base_bloc.dart';
import '../../../../features/widgets/field/search_field.dart';
import '../../../../features/widgets/load/bottom_loading.dart';
import '../../../../features/widgets/views/empty_view.dart';
import '../../../../features/widgets/views/error_view.dart';
import '../../../../features/widgets/views/loading_view.dart';
import '../bloc/recipe_search_bloc.dart';

class RecipeSearchScreen extends StatefulWidget {
  const RecipeSearchScreen({Key? key}) : super(key: key);

  @override
  State<RecipeSearchScreen> createState() => _RecipeSearchScreenState();
}

class _RecipeSearchScreenState extends State<RecipeSearchScreen> {
  late final RecipeSearchBloc _bloc;
  final RecipeSearchQueryModel _queryModel = RecipeSearchQueryModel();
  final _search = TextEditingController();

  bool isLazyLoad = false;

  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    _bloc = context.read<RecipeSearchBloc>();

    getRecipeSearch();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    super.dispose();
  }

  void _onScroll() async {
    if (isLazyLoad) {
      final maxScroll = _scrollController.position.maxScrollExtent;
      final currentScroll = _scrollController.position.pixels;

      if (maxScroll - currentScroll <= 500) {
        isLazyLoad = false;
        laztRecipeSearch();
      }
    }
  }

  void getRecipeSearch({bool? isRefresh}) => _bloc.add(GetRecipeSearch(queryModel: _queryModel, isRefresh: isRefresh ?? false));
  void laztRecipeSearch() => _bloc.add(LazyRecipeSearch(queryModel: _queryModel));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: _searcField),
      body: BlocBuilder<RecipeSearchBloc, BaseState>(
        bloc: _bloc,
        builder: _stateRouter,
      ),
    );
  }

  Widget _stateRouter(BuildContext context, BaseState state) {
    if (state is LazyLoadedState<RecipeSearchModel?>) {
      return _recipeListView(state.data!, state.hasReachedMax);
    } else if (state is ErrorState) {
      return ErrorView(
        error: state.error,
        onTryAgain: getRecipeSearch,
      );
    } else if (state is LoadingState) {
      return const LoadingView();
    } else {
      return const SizedBox();
    }
  }

  Widget get _searcField => SearchField(
        controller: _search,
        onChangedDebouncer: () {
          if (_queryModel.query != _search.text) {
            _queryModel.query = _search.text;
            getRecipeSearch();
          }
        },
      );

  Widget _recipeListView(RecipeSearchModel recipeSearchModel, bool hasReachedMax) {
    isLazyLoad = true;
    final _recipeList = recipeSearchModel.results;

    if (_recipeList != null && _recipeList.isNotEmpty) {
      return Scrollbar(
        child: ListView.builder(
          controller: _scrollController,
          itemCount: _recipeList.length,
          addAutomaticKeepAlives: true,
          itemBuilder: (context, index) => Column(
            children: [
              RecipeItemCard(itemData: _recipeList[index], baseUri: recipeSearchModel.baseUri),
              if (index == _recipeList.length - 1 && !hasReachedMax) BottomLoading(padding: context.paddingLow)
            ],
          ),
        ),
      );
    } else {
      return const EmptyView(label: 'Recipe list not found.');
    }
  }
}
