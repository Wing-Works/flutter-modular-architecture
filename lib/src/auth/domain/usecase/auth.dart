import 'package:flutter_modular_architecture/src/auth/domain/model/auth/auth.dart';
import 'package:flutter_modular_architecture/src/auth/domain/repository/auth.dart';
import 'package:injectable/injectable.dart';
import 'package:shared/shared.dart';

@injectable
class AuthUC extends BaseCheck<AuthUCParams, AuthModel> {

  AuthUC(this._repo);
  final AuthRepository _repo;

  @override
  ApiResult<AuthModel> execute(AuthUCParams params) {
    return _repo.login(params.toJson);
  }
}

class AuthUCParams extends Params {
  AuthUCParams({required this.username, required this.password});

  final String username;
  final String password;

  @override
  Map<String, dynamic> get toJson => {
    'username': username,
    'password': password,
  };
}
