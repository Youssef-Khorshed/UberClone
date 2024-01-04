import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {}

class InternetFailure extends Failure {
  String message;
  InternetFailure({required this.message});
  @override
  List<Object?> get props => [];
}

class ApiFailure extends Failure {
  String message;
  ApiFailure({required this.message});
  @override
  List<Object?> get props => [];
}

class AuthFailure extends Failure {
  String message;
  AuthFailure({required this.message});
  @override
  List<Object?> get props => [];
}

class CashFailure extends Failure {
  String message;
  CashFailure({required this.message});
  @override
  List<Object?> get props => [];
}
