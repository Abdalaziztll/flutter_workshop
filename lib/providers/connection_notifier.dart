import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum ConnectionStatus { offline, online }

class ConnectionNotifier extends StateNotifier {
  ConnectionStatus? result;
  ConnectionStatus? newState;
  ConnectionNotifier() : super(ConnectionStatus.offline) {
    if (state == ConnectionStatus.online) {
      result = ConnectionStatus.online;
    } else {
      result = ConnectionStatus.offline;
    }

    Connectivity().onConnectivityChanged.listen((event) {
      switch (event.first) {
        case ConnectivityResult.mobile:
        case ConnectivityResult.wifi:
          newState = ConnectionStatus.online;
          break;
        default:
          newState = ConnectionStatus.offline;
      }

      if (newState != result) {
        state = newState;
        result = newState;
      }
    });
  }
}
