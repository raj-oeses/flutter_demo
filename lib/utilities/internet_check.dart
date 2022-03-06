import 'dart:io';

import 'package:connectivity/connectivity.dart';

class Utilities {
  static Future<bool> isInternetWorking() async {
    bool condition1 = false;
    bool condition2 = false;

    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        condition1 = true;
      }
    } on SocketException catch (_) {
      condition1 = false;
    }

//----------------------------------------------------------------------//
    try {
      var connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult == ConnectivityResult.mobile) {
        condition2 = true;
      } else if (connectivityResult == ConnectivityResult.wifi) {
        condition2 = true;
      } else
        condition2 = false;
    } on SocketException {
      condition2 = false;
    }

    return condition1 & condition2;
  }
}
