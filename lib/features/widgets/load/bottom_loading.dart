import 'package:chef_upp/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../constant/color_constant.dart';

class BottomLoading extends StatelessWidget {
  final EdgeInsets padding;
  const BottomLoading({Key? key, this.padding = EdgeInsets.zero}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: SpinKitPulse(color: ColorConstant.mainColor1, size: context.width * 0.1),
    );
  }
}
