import 'package:flutter_modular_architecture/src/auth/domain/model/auth/auth.dart';
import 'package:shared/shared.dart';

abstract class AuthRepository {
  ApiResult<AuthModel> login(DataMap body);
}
