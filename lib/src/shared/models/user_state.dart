import 'package:dio/dio.dart';

class AuthState {}

class Authenticated extends AuthState {}

class NotAuthenticated extends AuthState {}

class Loading extends AuthState {}

class Error extends AuthState {
  final DioError error;

  Error(this.error);
}