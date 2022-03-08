import 'package:chef_upp/core/extensions/context_extension.dart';
import 'package:chef_upp/core/extensions/padding_kit.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../constant/color_constant.dart';
import '../../widgets/button/main_button.dart';

class EmptyView extends StatelessWidget {
  final dynamic label;
  final Function()? onTryAgain;
  const EmptyView({Key? key, this.label, this.onTryAgain}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width * 0.4;
    return Center(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        FaIcon(
          FontAwesomeIcons.clipboardList,
          size: size,
          color: ColorConstant.headline.withOpacity(0.6),
        ),
        Padding(
          padding: context.paddingNormal,
          child: Text(
            label.toString(),
            textAlign: TextAlign.center,
            maxLines: 6,
            overflow: TextOverflow.ellipsis,
            style: context.textTheme.titleMedium!.copyWith(color: ColorConstant.headline),
          ),
        ),
        if (onTryAgain != null) MainButton(onPressed: onTryAgain, label: 'Try Again')
      ],
    ));
  }
}
