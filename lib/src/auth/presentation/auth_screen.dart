import 'package:flutter/material.dart';
import 'package:flutter_modular_architecture/core/base/base_widget/stateless/base_stateless_widget.dart';
import 'package:flutter_modular_architecture/src/auth/presentation/bloc/auth_bloc.dart';

class AuthScreen extends BaseStatelessWidget<AuthBloc> {
  const AuthScreen(super.bloc, {super.key});

  static const String routeName = '/';

  @override
  PreferredSizeWidget? buildAppbar(BuildContext context, AuthBloc bloc) {
    return AppBar(title: const Text('Login'));
  }

  @override
  Widget buildView(BuildContext context, AuthBloc bloc) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Welcome Back',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.email),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.lock),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
