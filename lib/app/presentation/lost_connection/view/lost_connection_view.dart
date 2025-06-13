import 'package:fd_admin/app/common/constants/color_constants.dart';
import 'package:fd_admin/app/common/theme/styles/font_styles.dart';
import 'package:fd_admin/app/common/widgets/lottie/lottie_widget.dart';
import 'package:fd_admin/app/presentation/lost_connection/resources/lost_connection_stringler.dart';
import 'package:fd_admin/app/presentation/lost_connection/view_model/lost_connection_view_model.dart';
import 'package:fd_admin/core/extensions/context_extension.dart';
import 'package:fd_admin/core/helpers/helpers_functions.dart';
import 'package:flutter/material.dart';

class LostConnectionView extends StatefulWidget {
  const LostConnectionView({super.key});

  @override
  LostConnectionViewState createState() => LostConnectionViewState();
}

class LostConnectionViewState extends State<LostConnectionView>
    with LostConnectionViewModel {
  @override
  Widget build(BuildContext context) {
    final dark = MaeRHelperFunctions(context).isDarkMode;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LottieCustomWidget(path: "no_internet"),
            const SizedBox(height: 20),
            SizedBox(
              width: context.dynamicWidth(0.8),
              child: Center(
                child: Text(
                  LCStringler.cevrimdisi,
                  style: FontStyles.w7s20.copyWith(
                      color: dark
                          ? ColorConstants.colorWhite
                          : ColorConstants.colorBlack),
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: context.dynamicWidth(0.8),
              child: Center(
                child: Text(
                  LCStringler.aciklama,
                  textAlign: TextAlign.center,
                  style: FontStyles.w4s16.copyWith(
                      color: dark
                          ? ColorConstants.colorWhite
                          : ColorConstants.colorBlack),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
