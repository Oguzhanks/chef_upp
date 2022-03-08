import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingView extends StatelessWidget {
  const LoadingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width * 0.4;
    return Center(
        child: Lottie.asset(
      'assets/images/lot_cooking.json',
      width: size * 1.4,
      height: size,
      fit: BoxFit.fill,
    ));
  }
}
