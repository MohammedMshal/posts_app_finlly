import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class BaseInternetChecker {
  Future<bool> get isConnected;
}

class InternetChecker implements BaseInternetChecker{
  final InternetConnectionChecker connectionChecker;

  InternetChecker({required this.connectionChecker});

  @override
  Future<bool> get isConnected => connectionChecker.hasConnection;
}