import 'package:equatable/equatable.dart';

abstract class Failures extends Equatable {
  final String message;

  const Failures({required this.message});

  @override
  List<Object> get props => [message];
}


class ServerException extends Failures{
  const ServerException({required super.message});
}


class EmptyCacheFailure extends Failures {
  const EmptyCacheFailure({required super.message});
}


class OfflineFailure extends Failures{
  const OfflineFailure({required super.message});
}