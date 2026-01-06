import 'package:flutter/material.dart';
import 'package:flutter_modular_architecture/core/di/di.dart';
import 'package:flutter_modular_architecture/core/mapper/mapper_init.init.dart';
import 'package:flutter_modular_architecture/core/navigation/app_router.dart';
import 'package:flutter_modular_architecture/src/auth/presentation/auth_screen.dart';

Future<void> initialize(String flavor) async {
  WidgetsFlutterBinding.ensureInitialized();
  initializeMappers();
  await configureDependencies(flavor);
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
    );
  }
}
