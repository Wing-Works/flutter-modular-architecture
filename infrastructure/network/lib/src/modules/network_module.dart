import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:network/src/utils/api_interceptor.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@module
abstract class NetworkModule {
  @lazySingleton
  BaseOptions provideBaseOptions(@Named('BaseUrl') String url) {
    return BaseOptions(baseUrl: url, receiveTimeout: Duration(seconds: 50));
  }

  @lazySingleton
  PrettyDioLogger providerPrettyLogger() => PrettyDioLogger(
    request: true,
    requestBody: true,
    requestHeader: true,
    responseBody: true,
    responseHeader: true,
  );

  @lazySingleton
  List<Interceptor> provideInterceptors(
    ApiInterceptor headerInterceptor,
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
