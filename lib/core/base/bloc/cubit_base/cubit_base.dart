import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular_architecture/core/base/bloc/state/base_state.dart';
import 'package:flutter_modular_architecture/core/utils/request_controller.dart';

abstract class CubitBase<S extends BaseState> extends Cubit<S>
    with RequestController {
  CubitBase(super.state) {
    init();
  }

  void init() {}
}
