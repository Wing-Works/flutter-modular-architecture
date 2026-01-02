import 'package:dart_mappable/dart_mappable.dart';

part 'exception.mapper.dart';

@MappableClass()
class ExceptionEntity with ExceptionEntityMappable {
  ExceptionEntity({
    this.code = 400,
    this.error = '',
    this.message = '',
    this.errors,
  });

  final int code;
  final String error;
  final String message;
  final List<String>? errors;

  static final fromJson = ExceptionEntityMapper.fromJson;
}
