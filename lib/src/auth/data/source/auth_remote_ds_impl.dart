import 'package:flutter_modular_architecture/src/auth/data/source/auth_remote_ds.dart';
import 'package:flutter_modular_architecture/src/auth/domain/endpoints/auth_endpoints.dart';
import 'package:injectable/injectable.dart';
import 'package:network/network.dart';
import 'package:shared/shared.dart';

@Injectable(as: AuthRemoteDS)
class AuthRemoteDSImpl implements AuthRemoteDS {
  final AuthEndpoints endpoints;
  final NetworkClient client;

  AuthRemoteDSImpl(this.endpoints, this.client);

  @override
  BaseFutureResponse login(DataMap body) {
    return client.get(endpoints.login, body: body);
  }
}
