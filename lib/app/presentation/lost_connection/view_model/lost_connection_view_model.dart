import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:fd_admin/app/presentation/lost_connection/view/lost_connection_view.dart';
import 'package:fd_admin/app/presentation/splash/view/splash_view.dart';
import 'package:flutter/material.dart';

mixin LostConnectionViewModel on State<LostConnectionView> {
  late List<ConnectivityResult> _connectionStatus;

  @override
  void initState() {
    super.initState();
    checkInternetConnection();
  }

  Future<void> checkInternetConnection() async {
    _connectionStatus = await Connectivity().checkConnectivity();
    handleConnectionChange(_connectionStatus);

    Connectivity()
        .onConnectivityChanged
        .listen((List<ConnectivityResult> resultList) {
      handleConnectionChange(resultList);
    });
  }

  void handleConnectionChange(List<ConnectivityResult> resultList) {
    setState(() {
      _connectionStatus = resultList;
      final hasConnection = resultList.contains(ConnectivityResult.mobile) ||
          resultList.contains(ConnectivityResult.wifi);

      if (hasConnection) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => SplashView()),
        );
      }
    });
  }
}
