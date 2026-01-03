import 'package:dart_mappable/dart_mappable.dart';
import 'package:network/src/entity/exception/exception.dart';
import 'package:network/src/utils/base_layer_transformer.dart';

part 'response.mapper.dart';

@MappableClass()
class ResponseEntity extends BaseLayerDataTransformer<dynamic>
    with ResponseEntityMappable {
  ResponseEntity({
    this.response = '',
    this.data,
    this.error,
    this.statusCode = '',
    this.successfulResponse = false,
  });

  final String? response;
  final String? data;
  final ExceptionEntity? error;
  final String? statusCode;
  final bool successfulResponse;

  static final fromJson = ResponseEntityMapper.fromJson;

  @override
  dynamic get transform => data;
}
