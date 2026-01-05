import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' hide BlocBase;
import 'package:flutter_modular_architecture/core/base/bloc/base_event.dart';
import 'package:flutter_modular_architecture/core/base/bloc/base_state.dart';
import 'package:flutter_modular_architecture/core/base/bloc/bloc_base.dart';
import 'package:flutter_modular_architecture/src/auth/domain/usecase/auth.dart';
import 'package:injectable/injectable.dart';

part 'auth_bloc_state.dart';
part 'auth_event.dart';

@injectable
class AuthBloc extends BlocBase<AuthEvent, AuthBlocState> {
  AuthBloc(this._authUC) : super(AuthBlocState());

  final AuthUC _authUC;

  @override
  void mapEventToState() {
    on<LoginSubmitted>((event, emit) async {
      emit(state.copyWith(isLoading: true));
      await _handleLogin(event, emit);
    });

    on<AuthResponseReceived>((event, emit) {
      emit(state.copyWith(isLoading: false, response: event.response));
    });
  }

  final usernameController = TextEditingController(text: 'emilys');
  final passwordController = TextEditingController(text: 'emilyspass');
  final formKey = GlobalKey<FormState>();

  Future<void> _handleLogin(
    LoginSubmitted event,
    Emitter<AuthBlocState> emit,
  ) async {
    final params = AuthUCParams(
      username: event.username,
      password: event.password,
    );

    await apiCall(
      _authUC,
      params: params,
      onSuccess: (data) {
        emit(state.copyWith(isLoading: false, response: data));
      },
      onFailure: (err) {
        emit(state.copyWith(isLoading: false));
      },
    );
  }

  @override
  Future<void> close() {
    usernameController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
