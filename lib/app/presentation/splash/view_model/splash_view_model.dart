import 'package:fd_admin/app/common/enum/category_enums.dart';
import 'package:fd_admin/app/presentation/search/view_model/search_view_model.dart';
import 'package:fd_admin/app/presentation/splash/view/splash_view.dart';
import 'package:fd_admin/core/helpers/helpers_functions.dart';
import 'package:fd_admin/navigation_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class SplashViewModel extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    _startSequence();
  }

  Future<void> _startSequence() async {
    await Future.delayed(const Duration(seconds: 3));

    if (mounted) {
      context.read<SearchViewModel>().fetchSearchResults(
        CategoryEnum.categoryAll,
        "",
      );
      MaeRHelperFunctions(
        context,
      ).sonrakiSayfayaGitEskiniKapat(NavigationMenu());
    }
  }
}