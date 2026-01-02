import 'package:flutter_modular_architecture/src/auth/domain/model/auth/auth.dart';
import 'package:flutter_modular_architecture/src/auth/domain/repository/auth.dart';
import 'package:shared/shared.dart';

class AuthUC extends BaseCheck<AuthUCParams, AuthModel> {
  final AuthRepository _repo;

  AuthUC(this._repo);

  @override
  ApiResult<AuthModel> execute(AuthUCParams params) {
    return _repo.login(params.toJson);
  }
}

class AuthUCParams extends Params {
  AuthUCParams({required this.accountId, required this.accountType});

  final String accountId;
  final String accountType;

  @override
  Map<String, dynamic> get toJson => {
    "accountId": accountId,
    "accountType": accountType,
  };
}
