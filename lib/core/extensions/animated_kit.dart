import 'package:flutter/material.dart';

import '../components/animation/fade_drop_animation.dart';

extension AnimatedKit on Widget {
  Widget addDropFade({required double delay}) => FadeAnimation(
        delay: delay,
        child: this,
      );
}
