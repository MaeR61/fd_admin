import 'package:fd_admin/app/common/constants/string_constants.dart';
import 'package:fd_admin/app/common/cubits/home_index/home_index_cubit.dart';
import 'package:fd_admin/app/common/widgets/bottom_nav_bar/floating_bnb.dart';
import 'package:fd_admin/app/presentation/animal_pet/view/animal_pet_info_view.dart';
import 'package:fd_admin/app/presentation/animal_pet/view/animal_pet_view.dart';
import 'package:fd_admin/app/presentation/categories/view/categories_view.dart';
import 'package:fd_admin/app/presentation/devices/view/devices_info_view.dart';
import 'package:fd_admin/app/presentation/devices/view/devices_view.dart';
import 'package:fd_admin/app/presentation/drugs/view/drug_info_view.dart';
import 'package:fd_admin/app/presentation/drugs/view/drugs_view.dart';
import 'package:fd_admin/app/presentation/foods/view/foods_info_view.dart';
import 'package:fd_admin/app/presentation/foods/view/foods_view.dart';
import 'package:fd_admin/app/presentation/home/view/home_view.dart';
import 'package:fd_admin/app/presentation/others/view/others_info_view.dart';
import 'package:fd_admin/app/presentation/others/view/others_view.dart';
import 'package:fd_admin/app/presentation/search/view/search_view.dart';
import 'package:fd_admin/app/presentation/tobacco/view/tobacco_info_view.dart';
import 'package:fd_admin/app/presentation/tobacco/view/tobacco_view.dart';
import 'package:fd_admin/app/presentation/topics/about/view/about_view.dart';
import 'package:fd_admin/app/presentation/topics/emergency/view/emergency_view.dart';
import 'package:fd_admin/app/presentation/topics/international/view/international_view.dart';
import 'package:fd_admin/app/presentation/topics/news/view/news_view.dart';
import 'package:fd_admin/app/presentation/topics/products/view/products_view.dart';
import 'package:fd_admin/app/presentation/topics/science/view/science_view.dart';
import 'package:fd_admin/app/presentation/topics/training/view/training_view.dart';
import 'package:fd_admin/core/helpers/helpers_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavigationMenu extends StatefulWidget {
  const NavigationMenu({super.key});

  @override
  State<NavigationMenu> createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<NavigationMenu> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  DateTime oldTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final homeState = context.watch<HomeIndexCubit>().state;
    final currentIndex = homeState.currentIndex;
    final cubit = context.read<HomeIndexCubit>();

    List<Widget> body = [
      HomeView(), //0
      SearchView(), //1
      CategoriesView(), //2
      AnimalPetView(), //3
      DrugsView(), //4
      DevicesView(), //5
      FoodsView(), //6
      TobaccoView(), //7
      OthersView(), //8
      AnimalPetInfoView(), //9
      DrugInfoView(), //10
      DevicesInfoView(), //11
      FoodsInfoView(), //12
      TobaccoInfoView(), //13
      OthersInfoView(), //14
      AboutView(), //15
      ProductsView(), //16
      EmergencyView(), //17
      InternationalView(), //18
      NewsView(), //19
      TrainingView(), //20
      ScienceView(), //21
    ];

    return Scaffold(
      extendBody: true,
      key: scaffoldKey,
      body: PopScope(
        canPop: false,
        onPopInvokedWithResult: (bool didPop, Object? result) {
          if (didPop) return;
          if (currentIndex >= 9 && currentIndex < 15) {
            switch (currentIndex) {
              case 9:
                cubit.setCurrentIndex(3);
                break;
              case 10:
                cubit.setCurrentIndex(4);
                break;
              case 11:
                cubit.setCurrentIndex(5);
                break;
              case 12:
                cubit.setCurrentIndex(6);
                break;
              case 13:
                cubit.setCurrentIndex(7);
                break;
              case 14:
                cubit.setCurrentIndex(8);
                break;
              default:
            }
          } else if (currentIndex > 2 && currentIndex < 9) {
            cubit.setCurrentIndex(2);
          } else if (currentIndex != 0) {
            cubit.setCurrentIndex(0);
          } else {
            final now = DateTime.now();
            final diff = now.difference(oldTime).inMilliseconds;
            oldTime = now;

            if (diff < 1000) {
              Navigator.of(context).maybePop();
            } else {
              MaeRHelperFunctions(context).showSnackBar(Stringler.cik);
            }
          }
        },
        child: IndexedStack(index: currentIndex, children: body),
      ),
      bottomNavigationBar: FloatingBnb(),
    );
  }
}
