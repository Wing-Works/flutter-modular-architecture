import 'package:injectable/injectable.dart';

@lazySingleton
class AppInfoStore {
  final String appVersion;
  final String apiKey;

  AppInfoStore() : appVersion = '1.0.0-web', apiKey = 'dummy-web-api-key';
}
