part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginSuccess extends LoginState {
  final dynamic data;
  LoginSuccess(this.data);
}

final class LoginError extends LoginState {
  final String message;
  LoginError(this.message);
}
