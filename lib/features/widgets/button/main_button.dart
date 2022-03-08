import 'package:chef_upp/core/extensions/context_extension.dart';
import 'package:chef_upp/core/extensions/padding_kit.dart';
import 'package:chef_upp/features/constant/color_constant.dart';
import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  final Function()? onPressed;
  final String? label;
  final bool isExpand;
  const MainButton({Key? key, this.onPressed, this.label, this.isExpand = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          elevation: MaterialStateProperty.all<double>(0),
          padding: MaterialStateProperty.all<EdgeInsets>(context.paddingLow),
          backgroundColor: MaterialStateProperty.all<Color>(ColorConstant.mainColor1),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
            borderRadius: context.lowBorderRadius,
          )),
          textStyle: MaterialStateProperty.all<TextStyle>(context.textTheme.titleMedium!.copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
        ),
        child: isExpand
            ? Center(
                child: Text(
                  label ?? '',
                ),
              )
            : Text(
                label ?? '',
              ));
  }
}
