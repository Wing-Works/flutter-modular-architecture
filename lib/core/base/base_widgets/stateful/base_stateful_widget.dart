import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular_architecture/core/base/base_widgets/scaffold/scaffold_wrapper.dart';
import 'package:flutter_modular_architecture/core/base/bloc/base_state.dart';
import 'package:flutter_modular_architecture/core/di/di.dart';

abstract class BaseStatefulWidget extends StatefulWidget {
  const BaseStatefulWidget({super.key});
}

abstract class BasePageState<
  B extends BlocBase<BaseState>,
  W extends BaseStatefulWidget
>
    extends State<W>
    with ScaffoldWrapper<B> {
  late final B bloc = getIt<B>();

  @override
  Widget build(BuildContext context) {
    return buildBody(context, bloc);
  }
}
