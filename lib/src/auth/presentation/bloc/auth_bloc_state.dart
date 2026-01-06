part of 'auth_bloc.dart';

class AuthBlocState extends BaseState {

  AuthBlocState({this.isLoading = false, this.response});
  final bool isLoading;
  final dynamic response;

  AuthBlocState copyWith({bool? isLoading, dynamic response}) {
    return AuthBlocState(
      isLoading: isLoading ?? this.isLoading,
      response: response ?? this.response,
    );
  }

  @override
  String toString() =>
      'AuthBlocState(isLoading: $isLoading, response: $response)';
}
