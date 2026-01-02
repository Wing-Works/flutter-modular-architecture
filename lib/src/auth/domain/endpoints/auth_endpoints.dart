import 'package:injectable/injectable.dart';
import 'package:shared/shared.dart';

@injectable
class AuthEndpoints {
  const AuthEndpoints(this.networkPathResolver);
  final NetworkPathResolver networkPathResolver;

  String get login => networkPathResolver.getPath(uat: '/api/v1/login');
}
