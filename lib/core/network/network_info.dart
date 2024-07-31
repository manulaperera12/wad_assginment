import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class NetworkInfo {
  Future<bool> get isConnectedToInternet;
}

class NetworkInfoImpl implements NetworkInfo {
  final InternetConnectionChecker connectionChecker;

  const NetworkInfoImpl({
    required this.connectionChecker,
  });

  @override
  Future<bool> get isConnectedToInternet => connectionChecker.hasConnection;
}
