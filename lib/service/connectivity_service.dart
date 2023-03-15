import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

class ConnectivityService extends GetxService {
  var networkStatus = false.obs;

  bool networkConnected() {
    return networkStatus.value;
  }
  Timer? timer;

  Future<void> setup() async {
    networkStatus.value =
        (await Connectivity().checkConnectivity()) != ConnectivityResult.none;
    Connectivity().onConnectivityChanged.listen((event) {
      timer?.cancel();
      timer = Timer(const Duration(milliseconds: 100), () {
        networkStatus.value = (event == ConnectivityResult.mobile ||
            event == ConnectivityResult.wifi ||
            event == ConnectivityResult.ethernet);
      });

    });
  }
}
