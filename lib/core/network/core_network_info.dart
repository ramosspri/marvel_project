import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:safe_device/safe_device.dart';

mixin CoreNetworkInfoInterface {
  Future<bool> checkConnectivity();
}

class CoreNetworkInfo implements CoreNetworkInfoInterface {
  final Connectivity connectionChecker = Connectivity();

  @override
  Future<bool> checkConnectivity() async {
    final List<ConnectivityResult> connection =
        await connectionChecker.checkConnectivity();

    final bool isConnected = (kDebugMode && !(await SafeDevice.isRealDevice)) ||
        connection.contains(ConnectivityResult.mobile) ||
        connection.contains(ConnectivityResult.wifi);

    return isConnected;
  }
}
