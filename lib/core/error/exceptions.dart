import 'package:equatable/equatable.dart';


class ServerException implements Exception {
   final String message;

  ServerException({required this.message});
}

class EmptyCacheException implements Exception{
  final String message;

  EmptyCacheException({required this.message});
}

class OffLineException implements Exception{
  final String message;

  OffLineException({required this.message});
}