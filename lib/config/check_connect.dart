import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

enum Status { offline, online }

class CheckConnect extends ChangeNotifier {
  StreamController<Status> connection = StreamController();

  CheckConnect() {
    Connectivity().onConnectivityChanged.listen((event) {
      if (event.first == ConnectivityResult.mobile ||
          event.first == ConnectivityResult.wifi) {
        connection.add(Status.online);
      } else {
        connection.add(Status.offline);
      }
    });
  }
}
