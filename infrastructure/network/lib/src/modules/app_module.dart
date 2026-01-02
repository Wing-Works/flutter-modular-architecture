import 'package:injectable/injectable.dart';
import 'package:network/src/utils/network_constant.dart';

@module
abstract class AppModule {
  // --> Existing baseUrlDev
  @dev
  @Named('BaseUrl')
  String get baseUrlDev => NetworkConstant.baseUrl;

  // --> baseUrl for CUG
  @prod
  @Named('BaseUrl')
  String get baseUrlProd => NetworkConstant.baseUrl;

  // --> baseUrl for Prod
  @test
  @Named('BaseUrl')
  String get baseUrlTest => NetworkConstant.baseUrl;

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
