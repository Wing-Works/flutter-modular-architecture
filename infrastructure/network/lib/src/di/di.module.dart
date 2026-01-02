//@GeneratedMicroModule;NetworkPackageModule;package:network/src/di/di.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i687;

import 'package:database/database.dart' as _i252;
import 'package:dio/dio.dart' as _i361;
import 'package:injectable/injectable.dart' as _i526;
import 'package:network/src/client/network_client.dart' as _i103;
import 'package:network/src/interceptors/header_interceptor.dart' as _i49;
import 'package:network/src/modules/app_module.dart' as _i462;
import 'package:network/src/modules/network_module.dart' as _i700;
import 'package:network/src/providers/header/header_provider.dart' as _i345;
import 'package:network/src/providers/header/header_provider_impl.dart' as _i69;
import 'package:pretty_dio_logger/pretty_dio_logger.dart' as _i528;

const String _dev = 'dev';
const String _test = 'test';
const String _prod = 'prod';

class NetworkPackageModule extends _i526.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i687.FutureOr<void> init(_i526.GetItHelper gh) {
    final networkModule = _$NetworkModule();
    final appModule = _$AppModule();
    gh.singleton<_i528.PrettyDioLogger>(
        () => networkModule.providerPrettyLogger());
    gh.factory<String>(
      () => appModule.baseUrlDev,
      instanceName: 'BaseUrl',
      registerFor: {_dev},
    );
    gh.factory<String>(
      () => appModule.xApiKeyDev,
      instanceName: 'x-apikey',
      registerFor: {_dev},
    );
    gh.factory<String>(
      () => appModule.baseUrlTest,
      instanceName: 'BaseUrl',
      registerFor: {_test},
    );
    gh.factory<String>(
      () => appModule.xApiKeyTest,
      instanceName: 'x-apikey',
      registerFor: {_test},
    );
    gh.factory<String>(
      () => appModule.baseUrlProd,
      instanceName: 'BaseUrl',
      registerFor: {_prod},
    );
    gh.factory<String>(
      () => appModule.xApiKeyProd,
      instanceName: 'x-apikey',
      registerFor: {_prod},
    );
    gh.singleton<_i361.BaseOptions>(() =>
        networkModule.provideBaseOptions(gh<String>(instanceName: 'BaseUrl')));
    gh.lazySingleton<_i345.HeaderProvider>(() => _i69.HeaderProviderImpl(
          gh<_i252.AuthSessionStore>(),
          gh<_i252.AppInfoStore>(),
        ));
    gh.singleton<_i49.HeaderInterceptor>(() =>
        networkModule.provideHeaderInterceptor(gh<_i345.HeaderProvider>()));
    gh.singleton<List<_i361.Interceptor>>(
        () => networkModule.provideInterceptors(
              gh<_i49.HeaderInterceptor>(),
              gh<_i528.PrettyDioLogger>(),
            ));
    gh.lazySingleton<_i361.Dio>(() => networkModule.providerDio(
          gh<_i361.BaseOptions>(),
          gh<List<_i361.Interceptor>>(),
        ));
    gh.lazySingleton<_i103.NetworkClient>(
        () => _i103.NetworkClient(gh<_i361.Dio>()));
  }
}

class _$NetworkModule extends _i700.NetworkModule {}

class _$AppModule extends _i462.AppModule {}
