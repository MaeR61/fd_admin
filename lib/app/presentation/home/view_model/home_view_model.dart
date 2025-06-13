import 'package:fd_admin/app/common/constants/image_paths.dart';
import 'package:fd_admin/app/common/constants/string_constants.dart';
import 'package:fd_admin/app/common/models/slider_model.dart';
import 'package:fd_admin/app/presentation/home/view/home_view.dart';
import 'package:flutter/material.dart';

abstract class HomeViewModel extends State<HomeView> {
  @override
  void initState() {
    super.initState();
  }

  final List<SliderModel> bannerList = [
    SliderModel(
      baslik: Stringler.sliderContent1,
      resimYolu: ImagePaths.bannerPNG1,
      url: "https://www.safetyreporting.hhs.gov/smarthub#/",
    ),
    SliderModel(
      baslik: Stringler.sliderContent2,
      resimYolu: ImagePaths.bannerPNG2,
      url: "https://www.fda.gov/news-events/fda-newsroom/press-announcements",
    ),
    SliderModel(
      baslik: Stringler.sliderContent3,
      resimYolu: ImagePaths.bannerPNG3,
      url: "https://www.fda.gov/about-fda/contact-fda",
    ),
    SliderModel(
      baslik: Stringler.sliderContent4,
      resimYolu: ImagePaths.bannerPNG4,
      url:
          "https://www.fda.gov/regulatory-information/search-fda-guidance-documents",
    ),
  ];

  final List<String> topicsList = [
    Stringler.topics1,
    Stringler.topics2,
    Stringler.topics3,
    Stringler.topics4,
    Stringler.topics5,
    Stringler.topics6,
    Stringler.topics7,
  ];
}
