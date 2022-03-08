part of '../recipe_information_screen.dart';

class LabelTableCell extends StatelessWidget {
  final String? label;
  final String? subLabel;
  const LabelTableCell({Key? key, this.label, this.subLabel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          label ?? '',
          style: context.textTheme.titleMedium?.copyWith(color: ColorConstant.mainColor1, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        Text(
          subLabel ?? '',
          style: context.textTheme.labelMedium?.copyWith(color: ColorConstant.titleCard.withOpacity(0.7), fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
