import 'package:flutter/material.dart';
import 'package:flutter_modular_architecture/core/di/di.dart';
import 'package:flutter_modular_architecture/core/mapper/mapper_init.init.dart';
import 'package:flutter_modular_architecture/src/auth/presentation/auth_screen.dart';

class InitializeApp {
  Future<void> initialize(String flavor) async {
    WidgetsFlutterBinding.ensureInitialized();
    initializeMappers();
    await configureDependencies(flavor);
    runApp(const MaterialApp(home: AuthScreen()));
  }
}
