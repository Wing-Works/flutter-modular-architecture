import 'package:database/database.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:network/network.dart';
import 'package:shared/shared.dart';

import 'di.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  externalPackageModulesBefore: [
    ExternalModule(DatabasePackageModule),
    ExternalModule(NetworkPackageModule),
    ExternalModule(SharedPackageModule),
  ],
)
Future<GetIt> configureDependencies(String flavor) async =>
    await getIt.init(environment: flavor);
