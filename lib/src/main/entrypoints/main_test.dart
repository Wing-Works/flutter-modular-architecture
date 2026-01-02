import 'package:flutter_modular_architecture/src/main/initialize_app.dart';
import 'package:injectable/injectable.dart';

void main() {
  InitializeApp().initialize(Environment.test);
}
