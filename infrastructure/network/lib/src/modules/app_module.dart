import 'package:injectable/injectable.dart';

@module
abstract class AppModule {
  // --> Existing baseUrlDev
  @dev
  @Named('BaseUrl')
  String get baseUrlDev => 'https://dummyjson.com';

  // --> baseUrl for CUG
  @prod
  @Named('BaseUrl')
  String get baseUrlProd => 'https://dummyjson.com';

  // --> baseUrl for Prod
  @test
  @Named('BaseUrl')
  String get baseUrlTest => 'https://dummyjson.com';

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
