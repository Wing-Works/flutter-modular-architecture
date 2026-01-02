import 'package:flutter/foundation.dart';
import 'package:flutter_modular_architecture/core/base/bloc/bloc_base/bloc_base.dart';
import 'package:flutter_modular_architecture/core/base/bloc/state/base_state.dart';
import 'package:injectable/injectable.dart';

part 'auth_bloc_state.dart';
part 'auth_event.dart';

@Injectable()
class AuthBloc extends BlocBase<AuthEvent, AuthBlocState> {
  AuthBloc() : super(const AuthBlocState());

  @override
  void mapEventToState() {}
}
