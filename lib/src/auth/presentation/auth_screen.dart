import 'package:flutter/material.dart';
import 'package:flutter_modular_architecture/core/base/base_widgets/stateless/base_stateless_widget.dart';
import 'package:flutter_modular_architecture/src/auth/presentation/bloc/auth_bloc.dart';

class AuthScreen extends BaseStatelessWidget<AuthBloc> {
  const AuthScreen({super.key});

  @override
  Widget buildView(BuildContext context) {
    return Center(child: Container(width: 500, height: 500, color: Colors.red));
  }
}
