import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:network/src/entity/response/product_entity/product_entity.dart';
import 'package:network/src/entity/response/response.dart';
import 'package:network/src/utils/network_constant.dart';

@lazySingleton
class NetworkClient {
  final Dio dio;

  NetworkClient(this.dio);

  Future<ResponseEntity> get(
    String path, {
    Map<String, dynamic>? query,
    dynamic body,
    Map<String, dynamic>? headers,
  }) async {
    final response = await dio.request(
      path,
      data: body,
      queryParameters: query,
      options: Options(method: 'GET', headers: headers),
    );

    if (response.data is Map<String, dynamic>) {
      return ResponseEntity.fromJson(response.data);
    }
    throw const FormatException('Invalid server response');
  }

  Future<ProductEntity> getProductList(Map<String, dynamic> query) async {
    try {
      final response = await dio.request(
        NetworkConstant.products,
        queryParameters: query,
        options: Options(method: 'GET'),
      );

      if (response.data is Map<String, dynamic>) {
        return ProductEntity.fromJson(response.data);
      }
      throw const FormatException('Invalid server response');
    } on Object {
      rethrow;
    }
  }
}
