import 'package:fd_admin/app/common/controllers/network_controller.dart';
import 'package:fd_admin/app/common/theme/theme.dart';
import 'package:fd_admin/app/presentation/lost_connection/view/lost_connection_view.dart';
import 'package:fd_admin/app/presentation/splash/view/splash_view.dart';
import 'package:fd_admin/core/helpers/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      builder: (context, child) {
        return MediaQuery.withNoTextScaling(child: child!);
      },
      debugShowCheckedModeBanner: false,
      title: "FDA",
      themeMode: ThemeMode.system,
      theme: MaeRAppTheme.lightTheme,
      darkTheme: MaeRAppTheme.darkTheme,
      home: FutureBuilder<bool>(
        future: checkConnection(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else {
            Get.find<NetworkController>().setInitialCheckCompleted();
            if (snapshot.hasData && snapshot.data == true) {
              return const SplashView();
            } else {
              return const LostConnectionView();
            }
          }
        },
      ),
    );
  }

  Future<bool> checkConnection() async {
    final hasInternet = await MaeRDeviceUtils.hasInternetConnection();
    return hasInternet;
  }
}
