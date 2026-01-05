import 'package:flutter_modular_architecture/core/mapper/mapper_init.init.dart';
import 'package:flutter_modular_architecture/src/main/initialize_app.dart';
import 'package:injectable/injectable.dart';

void main() {
  initializeMappers();
  InitializeApp().initialize(Environment.dev);
}
