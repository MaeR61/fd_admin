import 'package:fd_admin/app.dart';
import 'package:fd_admin/app/common/cubits/categories/category_cubit.dart';
import 'package:fd_admin/app/common/cubits/home_index/home_index_cubit.dart';
import 'package:fd_admin/app/presentation/animal_pet/view_model/animal_pet_info_view_model.dart';
import 'package:fd_admin/app/presentation/devices/view_model/devices_info_view_model.dart';
import 'package:fd_admin/app/presentation/drugs/view_model/drug_info_view_model.dart';
import 'package:fd_admin/app/presentation/foods/view_model/foods_info_view_model.dart';
import 'package:fd_admin/app/presentation/others/view_model/others_info_view_model.dart';
import 'package:fd_admin/app/presentation/search/view_model/search_view_model.dart';
import 'package:fd_admin/app/presentation/tobacco/view_model/tobacco_info_view_model.dart';
import 'package:fd_admin/dependency_injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('tr_TR', null);
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    runApp(
      MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => HomeIndexCubit()),
          BlocProvider(create: (_) => CategoryCubit()),
          BlocProvider(create: (_) => AnimalPetInfoViewModel()),
          BlocProvider(create: (_) => DrugInfoViewModel()),
          BlocProvider(create: (_) => DevicesInfoViewModel()),
          BlocProvider(create: (_) => FoodsInfoViewModel()),
          BlocProvider(create: (_) => TobaccoInfoViewModel()),
          BlocProvider(create: (_) => OthersInfoViewModel()),
          BlocProvider(create: (_) => SearchViewModel()),
        ],
        child: MyApp(),
      ),
    );
  });
  DependencyInjection.init();
}

