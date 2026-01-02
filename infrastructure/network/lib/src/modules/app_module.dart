import 'package:injectable/injectable.dart';

@module
abstract class AppModule {
  // --> Existing baseUrlDev
  @dev
  @Named('BaseUrl')
  String get baseUrlDev => '';

  // --> baseUrl for CUG
  @prod
  @Named('BaseUrl')
  String get baseUrlProd => '';

  // --> baseUrl for Prod
  @test
  @Named('BaseUrl')
  String get baseUrlTest => '';

  @dev
  @Named('x-apikey')
  String get xApiKeyDev => '';

  @prod
  @Named('x-apikey')
  String get xApiKeyProd => '';

  @test
  @Named('x-apikey')
  String get xApiKeyTest => '';
}
