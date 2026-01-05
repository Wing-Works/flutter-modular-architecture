import 'package:shared/shared.dart';

abstract class AuthRemoteDS {
  Future<Map> login(DataMap body);
}
