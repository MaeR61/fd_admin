import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NetworkController extends GetxController {
  final Connectivity _connectivity = Connectivity();
  bool _initialCheckCompleted = false;

  @override
  void onInit() {
    super.onInit();
    _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  void setInitialCheckCompleted() {
    _initialCheckCompleted = true;
  }

  void _updateConnectionStatus(List<ConnectivityResult> resultList) {
    if (!_initialCheckCompleted) return; // Açılış kontrolü bitmeden popup gösterme

    if (resultList.contains(ConnectivityResult.none)) {
      if (Get.currentRoute == '/noInternetPage') {
        if (Get.isDialogOpen == true) {
          Get.close(1);
        }
      } else {
        if (Get.isDialogOpen != true) {
          Get.defaultDialog(
            barrierDismissible: false,
            title: "Lütfen internet bağlantınızı kontrol ediniz!",
            content: const Icon(Icons.wifi_off, color: Colors.black, size: 35),
            onWillPop: () async => false,
          );
        }
      }
    } else {
      if (Get.isDialogOpen == true) {
        Get.close(1);
      }
    }
  }
}
