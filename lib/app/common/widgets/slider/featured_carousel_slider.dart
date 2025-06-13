import 'package:carousel_slider/carousel_slider.dart';
import 'package:fd_admin/app/common/constants/color_constants.dart';
import 'package:fd_admin/app/common/theme/styles/font_styles.dart';
import 'package:fd_admin/app/common/widgets/bosluk/dikey_bosluk.dart';
import 'package:fd_admin/app/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:fd_admin/app/common/widgets/custom_shapes/containers/rounded_image_container.dart';
import 'package:fd_admin/app/presentation/home/controllers/home_controller.dart';
import 'package:fd_admin/app/common/models/slider_model.dart';
import 'package:fd_admin/app/presentation/webview/webview_screen.dart';
import 'package:fd_admin/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FeaturedCarouselSlider extends StatelessWidget {
  const FeaturedCarouselSlider({super.key, required this.contents});

  final List<SliderModel> contents;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());

    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            autoPlay: true,
            enlargeCenterPage: true,
            aspectRatio: 2.0,
            onPageChanged: (index, _) => controller.updatePageIndicator(index),
          ),
          items: contents.map((content) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: LayoutBuilder(
                builder: (_, cst) {
                  return GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => WebViewScreen(url: content.url),
                        ),
                      );
                    },
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: MaeRRoundedImage(
                            backgroundColor: ColorConstants.colorCarolineBlue,
                            imageUrl: content.resimYolu,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned.fill(
                          top: cst.maxHeight * 0.7,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.transparent,
                                  ColorConstants.colorBlack,
                                ],
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: context.dynamicHeight(0.005),
                          right: context.dynamicWidth(0.025),
                          left: context.dynamicWidth(0.025),
                          child: Text(
                            content.baslik,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: FontStyles.w7s18.copyWith(
                              color: ColorConstants.colorWhite,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            );
          }).toList(),
        ),
        DikeyBosluk(height: 0.015),
        Center(
          child: Obx(
            () => Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                for (int i = 0; i < contents.length; i++)
                  MaeRCircularContainer(
                    width: controller.carousalCurrentIndex.value == i ? 20 : 5,
                    height: 5,
                    margin: const EdgeInsets.only(right: 10),
                    backgroundColor: controller.carousalCurrentIndex.value == i
                        ? ColorConstants.colorPrimary
                        : ColorConstants.colorCarolineBlue,
                  ),
              ],
            ),
          ),
        ),
        DikeyBosluk(height: 0.015),
      ],
    );
  }
}
