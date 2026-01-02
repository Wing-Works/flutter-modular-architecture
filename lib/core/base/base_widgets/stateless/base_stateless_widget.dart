import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular_architecture/core/base/base_widgets/scaffold/scaffold_wrapper.dart';
import 'package:flutter_modular_architecture/core/base/bloc/base_state.dart';
import 'package:flutter_modular_architecture/core/di/di.dart';

abstract class BaseStatelessWidget<B extends BlocBase<BaseState>> extends Widget
    with ScaffoldWrapper<B> {
  const BaseStatelessWidget({super.key});

  @override
  DataProviderElement<B> createElement() {
    return DataProviderElement<B>(this);
  }

  void dispose() {}
}

class DataProviderElement<B extends BlocBase<BaseState>>
    extends ComponentElement {
  DataProviderElement(BaseStatelessWidget super.widget);

  late final B bloc = getIt<B>();

  @override
  late final BaseStatelessWidget widget = super.widget as BaseStatelessWidget;

  @override
  Widget build() {
    return widget.buildBody(this, bloc);
  }

  @override
  void unmount() {
    super.unmount();
    widget.dispose();
  }
}
