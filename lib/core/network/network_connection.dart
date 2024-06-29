import 'package:internet_connection_checker/internet_connection_checker.dart';

class NetworkConnection {
  InternetConnectionChecker internetConnectionChecker;
  NetworkConnection({
    required this.internetConnectionChecker,
  });

  Future<bool> get isConnected async {
    return internetConnectionChecker.hasConnection;
  }
}
