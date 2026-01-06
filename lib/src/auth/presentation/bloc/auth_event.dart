part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent extends BaseEvent {}

class LoginSubmitted extends AuthEvent {

  LoginSubmitted({required this.username, required this.password});
  final String username;
  final String password;
}

class AuthResponseReceived extends AuthEvent {

  AuthResponseReceived(this.response);
  final dynamic response;
}
