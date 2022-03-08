import 'dart:ui';

import 'package:flutter/material.dart';

extension AnimatedKit on Widget {
  Widget get toRotate => _AnmatedBody(this);
  Widget backBlurEffect({Duration? duration}) => _BlurEffectBody(this, duration: duration);
}

class _BlurEffectBody extends StatefulWidget {
  final Widget child;
  final Duration? duration;
  const _BlurEffectBody(this.child, {Key? key, this.duration}) : super(key: key);

  @override
  __BlurEffectBodyState createState() => __BlurEffectBodyState();
}

class __BlurEffectBodyState extends State<_BlurEffectBody> with TickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(duration: const Duration(milliseconds: 350), vsync: this);
    animation = Tween<double>(begin: 0, end: 5).animate(controller)
      ..addListener(() {
        setState(() {
          // The state that has changed here is the animation object’s value.
        });
      });
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: animation.value, sigmaY: animation.value),
      child: widget.child,
    );
  }
}

class _AnmatedBody extends StatefulWidget {
  final Widget child;
  const _AnmatedBody(this.child, {Key? key}) : super(key: key);

  @override
  __AnmatedBodyState createState() => __AnmatedBodyState();
}

class __AnmatedBodyState extends State<_AnmatedBody> with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: false);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(turns: _controller, child: widget.child);
  }
}
