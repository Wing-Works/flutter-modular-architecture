import 'package:database/database.dart';
import 'package:injectable/injectable.dart';
import 'package:network/src/providers/header/header_provider.dart';

@LazySingleton(as: HeaderProvider)
class HeaderProviderImpl implements HeaderProvider {
  final AuthSessionStore sessionStore;
  final AppInfoStore appInfoStore;

  HeaderProviderImpl(this.sessionStore, this.appInfoStore);

  @override
  Map<String, dynamic> getHeaders(String path) {
    return {
      'Content-Type': 'application/json',
      'X-APPLICATON-ID': 123456789,
      'X-REQ-UID': _generateTraceId(),
      'X-ENTITY-ID': sessionStore.entityId ?? '',
      'X-GEO-CHANNEL': sessionStore.channelId?.isNotEmpty == true
          ? sessionStore.channelId!
          : '1',
      if (sessionStore.token?.isNotEmpty == true)
        'Authorization': 'Bearer ${sessionStore.token}',
      if (sessionStore.xToken?.isNotEmpty == true)
        'X-TOKEN': sessionStore.xToken!,
      if (sessionStore.mobileNumber?.isNotEmpty == true)
        'mobilenumber': sessionStore.mobileNumber!,
      if (_shouldSendOrgId(path) && sessionStore.camUserId?.isNotEmpty == true)
        'orgID': sessionStore.camUserId!,
      'X-APP-VERSION': appInfoStore.appVersion,
      'x-apikey': appInfoStore.apiKey,
      'X-DEVICE-ID': 'WEB',
      'X-DEVICE-OS': 'WEB',
      'X-DEVICE-OS-VER': 'NA',
      'X-DEVICE-MODEL': 'BROWSER',
      'X-GEO-LOCATION': 'NA',
      'X-LANGUAGE-ID': 'NA',
      'X-IPADDRESS': 'NA',
    };
  }

  String _generateTraceId() {
    return DateTime.now().microsecondsSinceEpoch.toString();
  }

  bool _shouldSendOrgId(String path) {
    return path.contains('org') || path.contains('corporate');
  }
}
