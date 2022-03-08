import 'package:flutter/material.dart';

extension PaddingKit on BuildContext {
  double get _height => MediaQuery.of(this).size.height;
  //double get _width => MediaQuery.of(this).size.width;
  // ALL
  EdgeInsets get paddingVeryLow => EdgeInsets.all(_height * 0.01);
  EdgeInsets get paddingLow => EdgeInsets.all(_height * 0.02);
  EdgeInsets get paddingNormal => EdgeInsets.all(_height * 0.03);
  EdgeInsets get paddingHigt => EdgeInsets.all(_height * 0.05);

  // VERTICAL
  EdgeInsets get paddingVeryLowVertical => EdgeInsets.symmetric(vertical: _height * 0.01);
  EdgeInsets get paddingLowVertical => EdgeInsets.symmetric(vertical: _height * 0.02);
  EdgeInsets get paddingNormalVertical => EdgeInsets.symmetric(vertical: _height * 0.03);
  EdgeInsets get paddingHigtVertical => EdgeInsets.symmetric(vertical: _height * 0.05);

  // HORIZONTAL
  EdgeInsets get paddingVeryLowHorizontal => EdgeInsets.symmetric(horizontal: _height * 0.01);
  EdgeInsets get paddingLowHorizontal => EdgeInsets.symmetric(horizontal: _height * 0.02);
  EdgeInsets get paddingNormalHorizontal => EdgeInsets.symmetric(horizontal: _height * 0.03);
  EdgeInsets get paddingHigtHorizontal => EdgeInsets.symmetric(horizontal: _height * 0.05);

  // CARD
  EdgeInsets get paddingVeryLowCARD => EdgeInsets.symmetric(horizontal: _height * 0.01, vertical: (_height * 0.01) / 2);
  EdgeInsets get paddingLowCARD => EdgeInsets.symmetric(horizontal: _height * 0.02, vertical: (_height * 0.02) / 2);
  EdgeInsets get paddingNormalCARD => EdgeInsets.symmetric(horizontal: _height * 0.03, vertical: (_height * 0.03) / 2);
  EdgeInsets get paddingHigtCARD => EdgeInsets.symmetric(horizontal: _height * 0.05, vertical: (_height * 0.05) / 2);
}
