import 'package:flutter/foundation.dart';
import 'package:flutter_modular_architecture/core/base/bloc/base_event.dart';
import 'package:flutter_modular_architecture/core/base/bloc/base_state.dart';
import 'package:flutter_modular_architecture/core/base/bloc/bloc_base.dart';

part 'auth_bloc_state.dart';
part 'auth_event.dart';

class AuthBloc extends BlocBase<AuthEvent, AuthBlocState> {
  AuthBloc() : super(AuthBlocState());

  @override
  void mapEventToState() {
    // TODO: implement mapEventToState
  }
}
