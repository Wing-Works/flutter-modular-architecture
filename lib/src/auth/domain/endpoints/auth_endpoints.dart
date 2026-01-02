import 'package:injectable/injectable.dart';
import 'package:shared/shared.dart';

@injectable
class AuthEndpoints {
  final NetworkPathResolver networkPathResolver;
  const AuthEndpoints(this.networkPathResolver);

  String get login => networkPathResolver.getPath(uat: '/api/v1/login');
}
