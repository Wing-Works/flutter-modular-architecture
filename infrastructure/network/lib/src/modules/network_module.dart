import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:network/src/interceptors/header_interceptor.dart';
import 'package:network/src/providers/header/header_provider.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@module
abstract class NetworkModule {
  @singleton
  BaseOptions provideBaseOptions(@Named('BaseUrl') String url) =>
      BaseOptions(baseUrl: url, receiveTimeout: Duration(seconds: 50));

  @singleton
  HeaderInterceptor provideHeaderInterceptor(HeaderProvider headerProvider) =>
      HeaderInterceptor(headerProvider);

  @singleton
  PrettyDioLogger providerPrettyLogger() => PrettyDioLogger(
    request: true,
    requestBody: true,
    requestHeader: true,
    responseBody: true,
    responseHeader: true,
    logPrint: (log) {
      return debugPrint(log as String);
    },
  );

  @singleton
  List<Interceptor> provideInterceptors(
    HeaderInterceptor headerInterceptor,
    PrettyDioLogger logger,
  ) {
    final interceptors = <Interceptor>[headerInterceptor];

    if (kDebugMode) {
      interceptors.add(logger);
    }

    return interceptors;
  }

  @lazySingleton
  Dio providerDio(BaseOptions options, List<Interceptor> interceptors) {
    Dio dio = Dio(options);
    dio.interceptors.addAll(interceptors);
    return dio;
  }
}
