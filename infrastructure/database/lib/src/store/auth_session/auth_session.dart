import 'package:injectable/injectable.dart';

@lazySingleton
class AuthSessionStore {
  String? token;
  String? xToken;
  String? mobileNumber;
  String? entityId;
  String? camUserId;
  String? channelId;

  void setDummyLoggedInUser() {
    token = 'dummy-jwt-token';
    xToken = 'dummy-x-token';
    mobileNumber = '9999999999';
    entityId = 'ENTITY_001';
    camUserId = 'ORG_123';
    channelId = '1';
  }

  void clear() {
    token = null;
    xToken = null;
    mobileNumber = null;
    entityId = null;
    camUserId = null;
    channelId = null;
  }
}
