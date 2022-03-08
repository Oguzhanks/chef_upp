import 'package:auto_route/auto_route.dart';
import 'package:chef_upp/core/extensions/context_extension.dart';
import 'package:chef_upp/core/extensions/padding_kit.dart';
import 'package:chef_upp/data/model/recipe/recipe_search_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:chef_upp/features/init/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../../features/constant/color_constant.dart';

class RecipeItemCard extends StatelessWidget {
  final RecipeItem itemData;
  final String? baseUri;
  const RecipeItemCard({
    Key? key,
    required this.itemData,
    required this.baseUri,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: context.paddingLowCARD,
        padding: context.paddingLow,
        decoration: BoxDecoration(
          color: ColorConstant.backgroundCard,
          borderRadius: context.lowBorderRadius,
        ),
        child: GestureDetector(
          onTap: () => context.router.push(RecipeInformationRoute(id: itemData.id!)),
          child: SizedBox(
            height: context.width * 0.2,
            child: Row(
              children: [
                _leadingImage(context),
                SizedBox(width: context.paddingLow.bottom),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: _title(context),
                    ),
                    _minsAndServing(context)
                  ],
                ))
              ],
            ),
          ),
        ));
  }

  Widget _title(BuildContext context) => Padding(
        padding: EdgeInsets.only(right: context.paddingLow.right),
        child: Text(
          itemData.title ?? '',
          textAlign: TextAlign.start,
          style: context.textTheme.titleMedium!.copyWith(
            color: ColorConstant.titleCard,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
  Widget _minsAndServing(BuildContext context) => Text(
        '${itemData.readyInMinutes} Mins | ${itemData.servings} Serving',
        style: context.textTheme.labelMedium!.copyWith(color: ColorConstant.subLabel),
      );
  CachedNetworkImage _leadingImage(BuildContext context) => CachedNetworkImage(
        imageUrl: baseUri != null && itemData.image != null ? baseUri! + itemData.image! : '',
        imageBuilder: (context, imageProvider) => Container(
          decoration: BoxDecoration(
            borderRadius: context.lowBorderRadius,
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,
            ),
          ),
        ),
        progressIndicatorBuilder: (context, url, downloadProgress) => SpinKitPulse(color: ColorConstant.mainColor1, size: context.width * 0.1),
        errorWidget: (context, url, error) => const Icon(Icons.error),
        width: context.width * 0.2,
        height: context.width * 0.2,
        fit: BoxFit.cover,
      );
}
