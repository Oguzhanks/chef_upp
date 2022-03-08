import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

enum AniProps { opacity, translateY }

class FadeAnimation extends StatelessWidget {
  final double delay;
  final Widget child;

  const FadeAnimation({Key? key, required this.delay, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TimelineTween<AniProps> _tween = TimelineTween<AniProps>()
      ..addScene(begin: const Duration(milliseconds: 0), end: const Duration(milliseconds: 500))
          .animate(AniProps.opacity, tween: Tween(begin: 0.0, end: 1.0))
      ..addScene(begin: const Duration(milliseconds: 0), end: const Duration(milliseconds: 500))
          .animate(AniProps.translateY, tween: Tween(begin: -30.0, end: 0.0), curve: Curves.easeOut);

    // ignore: deprecated_member_use
    return PlayAnimation<TimelineValue<AniProps>>(
      delay: Duration(milliseconds: (500 * delay).round()),
      duration: _tween.duration,
      tween: _tween,
      child: child,
      builder: (context, child, value) => Opacity(
        opacity: value.get(AniProps.opacity),
        child: Transform.translate(offset: Offset(0, value.get(AniProps.translateY)), child: child),
      ),
    );
  }
}
