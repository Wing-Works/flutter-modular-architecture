import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class NetworkClient {
  final Dio dio;

  NetworkClient(this.dio);

  Future<Map> get(
    String path, {
    Map<String, dynamic>? query,
    dynamic body,
    Map<String, dynamic>? headers,
  }) async {
    final response = await dio.request(
      path,
      data: body,
      queryParameters: query,
      options: Options(method: 'POST', headers: headers),
    );

    if (response.data is Map<String, dynamic>) {
      return response.data;
    }
    throw const FormatException('Invalid server response');
  }
}
