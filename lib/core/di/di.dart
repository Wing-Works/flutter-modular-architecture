import 'package:database/database.dart';
import 'package:flutter_modular_architecture/core/di/di.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:network/network.dart';
import 'package:shared/shared.dart';

GetIt getIt = GetIt.instance;

@InjectableInit(
  externalPackageModulesBefore: [
    ExternalModule(DatabasePackageModule),
    ExternalModule(NetworkPackageModule),
    ExternalModule(SharedPackageModule),
  ],
)
Future<GetIt> configureDependencies() async {
  return await getIt.init();
}
