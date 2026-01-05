part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent extends BaseEvent {}

class LoginSubmitted extends AuthEvent {
  final String username;
  final String password;

  LoginSubmitted({required this.username, required this.password});
}

class AuthResponseReceived extends AuthEvent {
  final dynamic response;

  AuthResponseReceived(this.response);
}
