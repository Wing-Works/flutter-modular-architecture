import 'package:dart_mappable/dart_mappable.dart';

part 'auth.mapper.dart';

@MappableClass()
class AuthModel with AuthModelMappable {
  final int myValue;

  AuthModel(this.myValue);
}
