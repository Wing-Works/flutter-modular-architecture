import 'package:dio/dio.dart';
import 'package:network/src/providers/header/header_provider.dart';

class HeaderInterceptor extends Interceptor {
  final HeaderProvider provider;

  HeaderInterceptor(this.provider);

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    options.headers.addAll(provider.getHeaders(options.path));
    handler.next(options);
  }
}
