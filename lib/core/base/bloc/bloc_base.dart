import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular_architecture/core/base/bloc/base_event.dart';
import 'package:flutter_modular_architecture/core/base/bloc/base_state.dart';
import 'package:flutter_modular_architecture/core/utils/request_controller.dart';

abstract class BlocBase<E extends BaseEvent, S extends BaseState>
    extends Bloc<E, S>
    with RequestController {
  bool get keepAlive => false;

  BlocBase(super.initialState) {
    mapEventToState();
    init();
  }

  @mustCallSuper
  @protected
  void mapEventToState();

  void init() {}
}
