import 'package:chef_upp/core/extensions/context_extension.dart';
import 'package:chef_upp/core/extensions/padding_kit.dart';
import 'package:flutter/material.dart';

class LabelChip extends StatelessWidget {
  final String? label;
  final Color? color;
  const LabelChip({Key? key, this.label, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: context.paddingLowCARD,
      decoration: BoxDecoration(borderRadius: context.normalBorderRadius, color: color?.withOpacity(0.2)),
      child: Text(
        label ?? '',
        style: context.textTheme.labelLarge?.copyWith(color: color, fontWeight: FontWeight.bold),
      ),
    );
  }
}
