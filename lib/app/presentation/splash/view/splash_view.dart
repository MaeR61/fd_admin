import 'package:fd_admin/app/common/constants/color_constants.dart';
import 'package:fd_admin/app/common/widgets/lottie/lottie_widget.dart';
import 'package:fd_admin/app/presentation/splash/view_model/splash_view_model.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends SplashViewModel {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorConstants.colorPrimary,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: SizedBox(child: LottieCustomWidget(path: "splash")),
          ),
        ],
      ),
    );
  }
}
