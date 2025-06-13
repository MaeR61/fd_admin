import 'package:fd_admin/app/common/constants/color_constants.dart';
import 'package:fd_admin/app/common/cubits/home_index/home_index_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BNB extends StatelessWidget {
  const BNB({
    super.key,
    required this.currentBottomIndex,
    required this.darkMode,
  });

  final int currentBottomIndex;
  final bool darkMode;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      elevation: 0,
      iconSize: 24,
      selectedFontSize: 0,
      unselectedFontSize: 0,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      enableFeedback: true,
      currentIndex: currentBottomIndex,
      selectedItemColor: ColorConstants.colorPrimary,
      unselectedItemColor: darkMode
          ? ColorConstants.colorWhite
          : ColorConstants.colorBlack,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.search), label: ""),
        BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: ""),
        BottomNavigationBarItem(icon: Icon(Icons.category_outlined), label: ""),
      ],
      onTap: (index) {
        context.read<HomeIndexCubit>().setCurrentIndex(index);
      },
      backgroundColor: ColorConstants.colorCarolineBlue,
    );
  }
}
