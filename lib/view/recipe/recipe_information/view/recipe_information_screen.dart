import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:chef_upp/core/extensions/context_extension.dart';
import 'package:chef_upp/core/extensions/padding_kit.dart';
import 'package:chef_upp/data/model/recipe/recipe_information_model.dart';
import 'package:chef_upp/features/widgets/views/error_view.dart';
import 'package:chef_upp/features/widgets/views/loading_view.dart';
import 'package:chef_upp/features/widgets/chip/label_chip.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../bloc/recipe_information_bloc.dart';
import '../../../../core/base/base_bloc.dart';
import '../../../../features/constant/color_constant.dart';

part 'subView/ingredients_card.dart';
part 'subView/label_table_cell.dart';

class RecipeInformationScreen extends StatefulWidget {
  final int id;
  const RecipeInformationScreen({Key? key, @PathParam() required this.id}) : super(key: key);

  @override
  State<RecipeInformationScreen> createState() => _RecipeInformationScreenState();
}

class _RecipeInformationScreenState extends State<RecipeInformationScreen> {
  late final RecipeInformationBloc _bloc;
  @override
  void initState() {
    super.initState();
    _bloc = context.read<RecipeInformationBloc>();

    _getRecipeInformation();
  }

  void _getRecipeInformation() => _bloc.add(GetRecipeUnformation(widget.id));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar,
      body: BlocBuilder<RecipeInformationBloc, BaseState>(
        bloc: _bloc,
        builder: _stateRouter,
      ),
    );
  }

  Widget _stateRouter(BuildContext context, BaseState state) {
    if (state is LoadedState<RecipeInformationModel>) {
      return _body(state.data);
    } else if (state is ErrorState) {
      return ErrorView(
        error: state.error,
        onTryAgain: _getRecipeInformation,
      );
    } else {
      return const LoadingView();
    }
  }

  AppBar get _appbar => AppBar(
        centerTitle: true,
        leading: CloseButton(color: ColorConstant.titleCard.withOpacity(0.9)),
        title: Text(
          'Reciept',
          style: context.textTheme.titleMedium?.copyWith(
            color: ColorConstant.titleCard.withOpacity(0.9),
            fontWeight: FontWeight.bold,
          ),
        ),
      );

  Widget _body(RecipeInformationModel model) => Scrollbar(
        isAlwaysShown: true,
        child: Padding(
          padding: context.paddingLowHorizontal,
          child: ListView(
            children: [
              _imageFrame(model.image),
              _space,
              _title(model),
              _space,
              _titleTable(model),
              _space,
              ticketWrap(model),
              _space,
              _ingredients(model.extendedIngredients!),
              _space,
              _instructions(model.instructions),
              _space,
            ],
          ),
        ),
      );

  Widget get _space => SizedBox(height: context.paddingLowVertical.bottom);

  Widget _imageFrame(String? uri) => Padding(
        padding: context.paddingVeryLowVertical,
        child: CachedNetworkImage(
          imageUrl: uri ?? '',
          imageBuilder: (context, imageProvider) => Container(
            decoration: BoxDecoration(
              borderRadius: context.normalBorderRadius,
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.cover,
              ),
            ),
          ),
          progressIndicatorBuilder: (context, url, downloadProgress) => SpinKitPulse(
            color: ColorConstant.mainColor1,
            size: context.width * 0.1,
          ),
          errorWidget: (context, url, error) => const Icon(Icons.error),
          width: double.infinity,
          height: context.height * 0.3,
          fit: BoxFit.cover,
        ),
      );
  Widget _title(RecipeInformationModel model) => Text(
        model.title ?? '',
        style: context.textTheme.titleLarge?.copyWith(color: ColorConstant.titleCard, fontWeight: FontWeight.bold),
        textAlign: TextAlign.start,
      );
  Widget _titleTable(RecipeInformationModel model) => Container(
        padding: context.paddingLow,
        decoration: BoxDecoration(
          borderRadius: context.lowBorderRadius,
          color: ColorConstant.lightGrey,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LabelTableCell(label: model.aggregateLikes.toString(), subLabel: 'like'),
            LabelTableCell(label: model.servings.toString(), subLabel: 'servings'),
            LabelTableCell(label: model.readyInMinutes.toString(), subLabel: 'mins'),
          ],
        ),
      );

  Widget ticketWrap(RecipeInformationModel model) => Wrap(
        runSpacing: context.paddingVeryLow.bottom,
        spacing: context.paddingVeryLow.bottom,
        children: <String>[
          if (model.vegetarian == true) "Vegetarian",
          if (model.vegan == true) "Vegan",
          if (model.glutenFree == true) "Gluten free",
          if (model.dairyFree == true) "Dairy free",
          if (model.veryHealthy == true) "Very healthy",
          if (model.cheap == true) "Cheap",
          if (model.veryPopular == true) "Very popular",
        ]
            .map((e) => LabelChip(
                  label: e,
                  color: ColorConstant.mainColor1,
                ))
            .toList(),
      );
  Widget _ingredients(List<ExtendedIngredient> ingredientsList) => Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'Ingredients',
                style: context.textTheme.titleLarge?.copyWith(
                  color: ColorConstant.titleCard.withOpacity(0.7),
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '${ingredientsList.length} item',
                style: context.textTheme.labelLarge?.copyWith(color: ColorConstant.subLabel),
              ),
            ],
          ),
          _space,
          ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: ingredientsList.length,
              itemBuilder: (context, index) => IngredientsCard(
                    index: index + 1,
                    model: ingredientsList[index],
                  )),
        ],
      );
  Widget _instructions(String? instructions) => Column(
        children: [
          Text(
            '- Instructions -',
            style: context.textTheme.titleLarge?.copyWith(
              color: ColorConstant.titleCard.withOpacity(0.7),
              fontWeight: FontWeight.bold,
            ),
          ),
          _space,
          Text(
            instructions ?? '',
            textAlign: TextAlign.justify,
            style: context.textTheme.titleMedium?.copyWith(
              color: ColorConstant.titleCard.withOpacity(0.5),
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      );
}
