import 'package:flutter/material.dart';
import 'package:flutter_modular_architecture/core/di/di.dart';
import 'package:flutter_modular_architecture/core/navigation/app_router.dart';
import 'package:flutter_modular_architecture/src/auth/presentation/auth_screen.dart';
import 'package:flutter_modular_architecture/src/auth/presentation/bloc/auth_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: AuthScreen.routeName,
      onGenerateRoute: onGenerateRoute,
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: AuthScreen(AuthBloc()),
    );
  }
}
