import 'package:dart_mappable/dart_mappable.dart';
import 'package:network/src/entity/exception/exception.dart';

part 'response.mapper.dart';

@MappableClass()
class ResponseEntity with ResponseEntityMappable {
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
}
