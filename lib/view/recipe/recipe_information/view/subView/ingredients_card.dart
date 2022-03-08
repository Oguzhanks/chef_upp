part of '../recipe_information_screen.dart';

class IngredientsCard extends StatelessWidget {
  final ExtendedIngredient model;
  final int index;

  const IngredientsCard({
    Key? key,
    required this.index,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingVeryLowVertical,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _leaderImage(context),
          SizedBox(width: context.paddingLow.bottom),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _name(context),
                _unit(context),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _name(BuildContext context) => Text(
        model.name ?? '',
        style: context.textTheme.titleMedium?.copyWith(
          color: ColorConstant.titleCard,
          fontWeight: FontWeight.w400,
        ),
      );
  Widget _unit(BuildContext context) => Text(
        model.original ?? '',
        style: context.textTheme.titleSmall?.copyWith(
          color: ColorConstant.headline,
          fontWeight: FontWeight.w400,
        ),
      );

  Widget _leaderImage(BuildContext context) => Container(
        width: context.width * 0.1,
        height: context.width * 0.1,
        decoration: BoxDecoration(
          borderRadius: context.lowBorderRadius,
          color: ColorConstant.mainColor1.withOpacity(0.3),
        ),
        child: Center(
          child: Text(
            index.toString(),
            style: context.textTheme.titleSmall?.copyWith(
              color: ColorConstant.titleCard.withOpacity(0.6),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
}
