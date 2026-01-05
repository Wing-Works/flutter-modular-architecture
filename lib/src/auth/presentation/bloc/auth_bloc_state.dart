part of 'auth_bloc.dart';

class AuthBlocState extends BaseState {
  final bool isLoading;
  final dynamic response;

  AuthBlocState({this.isLoading = false, this.response});

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
