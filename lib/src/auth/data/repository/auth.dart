import 'package:flutter_modular_architecture/src/auth/data/source/auth_remote_ds.dart';
import 'package:flutter_modular_architecture/src/auth/domain/model/auth/auth.dart';
import 'package:flutter_modular_architecture/src/auth/domain/repository/auth.dart';
import 'package:injectable/injectable.dart';
import 'package:network/network.dart';
import 'package:shared/shared.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(this.remote);
  final AuthRemoteDS remote;

  @override
  ApiResult<AuthModel> login(DataMap body) {
    return safeApiCall<AuthModel>(remote.login(body));
  }
}
