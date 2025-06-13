import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieCustomWidget extends StatelessWidget {
  const LottieCustomWidget({super.key, required this.path});
  final String path;

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      "assets/lottie/$path.json"
    );
  }
}
