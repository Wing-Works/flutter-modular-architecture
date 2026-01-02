import 'package:network/network.dart';
import 'package:shared/shared.dart';

abstract class AuthRemoteDS {
  BaseFutureResponse login(DataMap body);
}
