import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular_architecture/core/base/base_widgets/stateless/base_stateless_widget.dart';
import 'package:flutter_modular_architecture/src/auth/presentation/bloc/auth_bloc.dart';

class AuthScreen extends BaseStatelessWidget<AuthBloc> {
  const AuthScreen({super.key});

  @override
  Widget buildView(BuildContext context) {
    final bloc = context.read<AuthBloc>();
    return Center(
      child: Container(
        width: 500,
        padding: const EdgeInsets.all(16),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Form(
                  key: bloc.formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: bloc.usernameController,
                        decoration: const InputDecoration(
                          labelText: 'Username',
                        ),
                        validator: (v) =>
                            (v == null || v.isEmpty) ? 'Enter username' : null,
                      ),
                      const SizedBox(height: 12),
                      TextFormField(
                        controller: bloc.passwordController,
                        decoration: const InputDecoration(
                          labelText: 'Password',
                        ),
                        obscureText: true,
                        validator: (v) =>
                            (v == null || v.isEmpty) ? 'Enter password' : null,
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          print('-------------------------------------------');
                          if (bloc.formKey.currentState?.validate() ?? false) {
                            bloc.add(
                              LoginSubmitted(
                                username: bloc.usernameController.text.trim(),
                                password: bloc.passwordController.text,
                              ),
                            );
                          }
                        },
                        child: const Text('Login'),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                // show loading or response
                Builder(
                  builder: (context) {
                    final state = bloc.state;
                    if (state.isLoading) {
                      return const CircularProgressIndicator();
                    }
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Response:',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        Text(state.response?.toString() ?? 'No response yet'),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
